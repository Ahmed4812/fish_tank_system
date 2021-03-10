/*
 * File:   main_keypad_SM.c
 * Author: CT
 * 
 * The value of a keypad press is displayed to a screen using
 * a serial connection.
 * 
 * This program uses a state machine to detect a key pressed and print key to serial monitor
 */
/*********** COMPILER DIRECTIVES *********/
#include "pic24_all.h"           //generic header for PIcol24H family */         
#include "lcd4bit_lib.h"

// #defines for handy constants 
#define R0 (_RB15)  // Define row pins
#define R1 (_RB12)
#define R2 (_RB11)
#define R3 (_RA1)
#define C0 (_LATB0) // Define column pins
#define C1 (_LATB1)
#define C2 (_LATB3)
#define KP() (!R0 || !R1 || !R2 || !R3) // Value to check if any key is pressed

#define period 1562 // Define State Machine period to 1562 timer ticks of 6.4us
#define Servo_PWM_PERIOD (3125)
#define p_servoLock (147)
#define p_servoUnlock (175)

#define AIN2 (_LATB2)
#define PWMA (_LATB4)
#define potValue (convertADC1())
#define p_min (255)
#define p_max (510)
#define PWM_PERIOD (510)
#define ANA_D_READ_MID_RANGE (512)


/*********** GLOBAL VARIABLE AND FUNCTION DEFINITIONS *******/
volatile uint16_t TimerFlag; //timer flag to synchronize state machine
uint32_t count;
uint16_t PassPermit;  
uint16_t inputAccess;
uint16_t lock;
uint16_t servo_pulse_width;
char pass[]={'*','*',0};

//DC motor variables
uint16_t EdgeD;
uint16_t EdgeA; 
uint16_t IC1_period;
uint16_t pulse_width;
float angularSpeed;
float pulsePeriod;


void configOC1()
{  
    T2CONbits.TON = 0; // turn off timer 2
    CONFIG_OC1_TO_RP (RB4_RP); //Mapping step motor to pin 5
    OC1RS = 0;
    OC1R = 0 ;
    OC1CON = 0x0006; // sets Timer 2 as clock source and operates in PWM mode with fault pin disabled
}

void configTimer2()
{
    T2CONbits.TON = 0; // turn off timer 2
    T2CON = 0x0010;
    T2CONbits.TCS = 0;
    PR2 = PWM_PERIOD;
    T2CONbits.TON = 1; 
    TMR2 = 0; //initialize counter to 0
    _T2IF = 0;
}

void _ISR _T2Interrupt(void)
{
    OC1RS = pulse_width; 
    _T2IF = 0; // clear flag
}

/**
 * Converts the pulse reading to motor clock wise pulse value
 * @param potVal    pot reading 
 * @return pulse value of motor
 */
float potPulseValue(uint16_t potVal){//0-512
    DELAY_MS(20); //the pot reading was taking deal
    uint32_t PulseValue=p_min+((uint32_t)((uint32_t)( p_max - p_min )*potVal))/ANA_D_READ_MID_RANGE; /// ANA_D_READ_MID_RANGE);
    return PulseValue;  
}


void configOC2()
{
    T3CONbits.TON = 0; // turn off timer 3
    CONFIG_OC2_TO_RP(RB10_RP); //Maps OC1 output to RB10, pin 21
    OC2RS = 0;
    OC2R = 0 ;
    OC2CON = 0x000E; // sets Timer 2 as clock source and operates in PWM mode with fault pin disabled
}

void configTimer3()
{
    T3CONbits.TON = 0; // turn off timer 2
    T3CON = 0x0030;
    T3CONbits.TCS = 0;
    PR2 = Servo_PWM_PERIOD;
    T3CONbits.TON = 1; 
    TMR2 = 0; //initialize counter to 0
    _T2IF = 0;
}

void _ISR _T3Interrupt(void)
{
    OC2RS = servo_pulse_width; 
    _T3IF = 0; // clear flag
}


    // Lookup table for keypad
char keypad_table[4][3] = 
{
    {'1','2','3'},
    {'4','5','6'},
    {'7','8','9'},
    {'*','0','#'}
};

void config_keypad(void) {
    CONFIG_RB15_AS_DIG_INPUT();
	CONFIG_RB12_AS_DIG_INPUT();
    CONFIG_RB11_AS_DIG_INPUT();
    CONFIG_RA1_AS_DIG_INPUT();
    ENABLE_RB15_PULLUP(); 
    ENABLE_RB12_PULLUP(); 
    ENABLE_RB11_PULLUP(); 
    ENABLE_RA1_PULLUP(); 
    
    CONFIG_RB0_AS_DIG_OUTPUT();
    CONFIG_RB1_AS_DIG_OUTPUT();
    CONFIG_RB3_AS_DIG_OUTPUT();
    

}
uint8_t get_row(void) {  //return the row of the key pressed
    if (!R0){
        return 0;
    }
    else if (!R1){
        return 1;
    }
    else if (!R2){
        return 2;
    }
    else if (!R3){
        return 3;
    }
       

}
// Function to print key	
void input_key(uint8_t row, uint8_t col) { //print the key that is pressed to the terminal, followed by new 
    char character=keypad_table[row][col]; 
    
    if (character=='*' || pass[1]!='*'){
        pass[0]='*';
        pass[1]='*';
    }
    if(pass[0]=='*'){
        pass[0]=character;
    }
    else if(pass[1]=='*'){
        pass[1]=character;
    }
    }        

void configTimer4(void) {
    T4CON = 0x0030; //TMR2 off, FCY clk, prescale 1:256
    PR4 = period; //delay = PWM_PERIOD
    TMR4 = 0x0000; //clear the timer
    _T4IF = 0; //clear interrupt flag initially
}

void _ISR _T4Interrupt(void){
    TimerFlag = 1;
    _T4IF = 0; //set the flag bit to 0
}

// Declare global state variable and states
enum SM_states {S_C0, S_C1, S_C2, P, WR} state1;
void keypadInput(void) {
/* Inputs: KP()
*  Outputs: C0, C1, C2
*  Variables: col, row - col needs to be static because 
*  it is used as a transition condition*/
   uint8_t rw; // local row variable
   static uint8_t col;  //static column variable - default initialization is 0 on first call
	switch (state1) { //transitions
	    case S_C0:
	      if (KP()) {
			  state1 = P;
			  col = 0;  //Mealy output action
		  } else  {
			  state1 = S_C1;
		  } break;
		case S_C1:
		   if (KP()) {
			  state1 = P;
			  col = 1;  //Mealy output action
		  } else  {
			  state1 = S_C2;
		  } break;
		case S_C2:
		   if (KP()) {
			  state1 = P;
			  col = 2;  //Mealy output action
		  } else  {
			  state1 = S_C0;
		  } break;
		case P:
		  state1 = WR;
		  break;
		case WR:
		  if (KP()) {state1 = WR; }
		  if (!KP() && (col == 0)) { state1 = S_C1;}
		  if (!KP() && (col == 1)) { state1 = S_C2;}
		  if (!KP() && (col == 2)) { state1 = S_C0;}
		  break;
        default:
		  state1 = S_C0;
	}
	switch (state1) { //outputs
	    case S_C0:
		   C0=0; C1=1; C2=1;
		break;
		case S_C1:
		   C0=1; C1=0; C2=1;
		break;
		case S_C2:
		   C0=1; C1=1; C2=0;
		break;	 
		case P:
		   rw = get_row();
           input_key(rw, col);
           writeLCD(0xC0, 0, 1, 1); 
           outStringLCD("Password: ");
           outStringLCD(pass);
		break;
		case WR:
		break;
		default:
		break;
	}
}

enum States {init, PassLock, PassCheck, Unlock} state; //define global state variable
void PasswordSystem() {  //Define state machine 
    switch (state) {    //transition switch statement
        case init:  //initialize state
            state = PassLock;			
            break;
        case PassLock:
            if (PassPermit == 1) {state = PassCheck;}
            else if (PassPermit == 0) {state = PassLock;}
            break;
        case PassCheck: 
            if (pass[0]=='1' && pass[1]=='2') {state = Unlock;}
            else {state = PassCheck;}
            break;
        case Unlock:            
            break;
        default:
            state = init;
            break;
    }
    switch (state) {    //output switch statement
        case init:  //initialize state		
            break;
        case PassLock:
            lock=1;
			inputAccess=0;
            writeLCD(0x80, 0, 1, 1); 
            break;
        case PassCheck:	
			inputAccess=1;
			writeLCD(0xC0, 0, 1, 1); 
            outStringLCD("Password: ");
			outStringLCD(pass);
            break;
        case Unlock:       
            lock=0;
            writeLCD(0x80, 0, 1, 1); 
			outStringLCD("Unlocked");
            servo_pulse_width = p_servoUnlock;
            break;
        default:
            state = init;
            break;
    }   
 }


int main(void) {
/* Define local variables */
    
/* Call configuration routines */
    configClock();
    configControlLCD();
	configTimer4();
    config_keypad();  //Set up RB pins connected to keypad
   
    configOC2();
    configTimer3();
    
    CONFIG_RB2_AS_DIG_OUTPUT(); //connected to AIN2 for direction
    configOC1();        //Configs output comparator 1 for pwm
    configTimer2();     //configs time2
    CONFIG_RA0_AS_ANALOG();     //Sets RA0 (pin2) to analog default read
    configADC1_ManualCH0(RA0_AN,31,0);
    
/* Initialize ports and other one-time code */
    state1 = S_C0;  //set initial state 
    state=init;
    
    T4CONbits.TON = 1;  // Turn on timer 4
	_T4IE = 1;  //Enable Timer 4 interrupts
    initLCD();  
    
    T2CONbits.TON = 1;      //setting timer 2 on
    _T2IE = 1;              //enabling timer 2
    
    _T3IE = 1;
    T3CONbits.TON = 1;
    servo_pulse_width = p_servoLock ;
    DELAY_MS(500);
    
    while(1){
        PassPermit=1;
        PasswordSystem();
        
        //MotorSystem
        if(lock==1){
            AIN2=1;
            pulse_width= potPulseValue(potValue);
        }
        else{
            AIN2=0;
        }
        
        if(inputAccess==1){ //to not allow user to put password when ever they want
            keypadInput();
        }
        
        while(!TimerFlag);
          TimerFlag=0;
    }
}
