/*
 * File:  main_final
 * Author: Ali Ahmed Khan, Mudhar Muhi
 * Date: 3/13/2020
 * Purpose: Final project, fish tank control system for fish feeding and oxygen level control. 
 */

/*********** COMPILER DIRECTIVES *********/
#include "pic24_all.h"           //generic header for PIcol24H family */         
#include "lcd4bit_lib.h"        //import lcd library

/***********Defines for handy constants***********/
//#define setTime (750)   //feed after 15 seconds (test)
#define setTime (1500)  //feed after 30seconds (video demo)
//#define set (4321440) //feed after 24hours (practical use)
#define period 1562 // Define State Machine period to 1562 timer ticks of 6.4us

#define R0 (_RB15)  // Define row pins for keypad
#define R1 (_RB12)
#define R2 (_RB11)
#define R3 (_RA1)
#define C0 (_LATB0) // Define column pins for keypad
#define C1 (_LATB1)
#define C2 (_LATB3)
#define KP() (!R0 || !R1 || !R2 || !R3) // Value to check if any key is pressed

#define Servo_PWM_PERIOD (3125)     //servo motor period
#define p_servoLock (147)           //servo motor pulse width value for locking in system
#define p_servoUnlock (175)         //servo motor pulse width value for unlocking in system

#define AIN2 (_LATB2)               //dc motor direction specifier. Only one directional system so AIN1 is grnd/zero
#define PWMA (_LATB4)               //dc motor pulse pin
#define potValue (convertADC1())    //to read from potentiometer 
#define p_min (255)                 //dc motor min speed
#define p_max (510)                 //dc motor max speed
#define PWM_PERIOD (510)            //dc motor period
#define ANA_D_READ_MID_RANGE (512)  //dc motor mid range value
#define correctPass ({'1','2'})

/*********** GLOBAL VARIABLE AND FUNCTION DEFINITIONS *******/
volatile uint16_t TimerFlag;    //timer flag to synchronize state machine
uint32_t count;                 //tick counter for feedtime state machine
uint16_t PassPermit;            //global variable to communicate feedtime SM and password system SM, allows to input when 1
uint16_t inputAccess;           //global variable to communicate password system and keypad, allows access to keypad
uint16_t lock;                  //global variable for state machines, shows if it is lock period or not.
uint16_t servo_pulse_width;     //servo pulse width variable
char pass[]={'*','*',0};        //array to store input password. Zero at the end to have null which allows to print as String
uint16_t pulse_width;           //Dc motor pulse width

/**
 * Feed time state machine
 * Main state machine that controls if it is time to feed or not
 */
enum SM1_STATES { SM1_SMStart, SM1_Feed, SM1_lockWait, SM1_TimeToFeed} SM1_STATE;   //define global state variable
void FeedTimeSystem() {
   switch(SM1_STATE) {
      case SM1_SMStart:
         if (1) {
            SM1_STATE = SM1_Feed;
         }
         break;
      case SM1_Feed:
         if (1) {
            SM1_STATE = SM1_lockWait;
            count++;
         }
         break;
      case SM1_lockWait:
         if (count>setTime) {
            SM1_STATE = SM1_TimeToFeed;
         }
         else if (count<=setTime) {
            SM1_STATE = SM1_lockWait;
         }
         else {
            SM1_STATE = SM1_lockWait;
         }
         break;
      case SM1_TimeToFeed:
         if (1) {
            SM1_STATE = SM1_TimeToFeed;
         }
         break;
      default:
         SM1_STATE = SM1_Feed;
         break;
   }
   switch(SM1_STATE) {
      case SM1_SMStart:          
         break;
      case SM1_Feed:
         PassPermit=0;
         count=0;
         break;
      case SM1_lockWait:
         writeLCD(0x80, 0, 1, 1);
         outStringLCD("NOT Feeding Time");
         count++;
         break;
      case SM1_TimeToFeed:
         writeLCD(0x01,0,0,1);
         writeLCD(0x80, 0, 1, 1);
         outStringLCD("FEED TIME");
         PassPermit=1;
         break;
   }
}

/**
 * Configuration of Output compare for Dc motor
 */
void configOC1()
{  
    T2CONbits.TON = 0; // turn off timer 2
    CONFIG_OC1_TO_RP (RB4_RP); //Mapping step motor to pin 5
    OC1RS = 0;
    OC1R = 0 ;
    OC1CON = 0x0006; // sets Timer 2 as clock source and operates in PWM mode with fault pin disabled
}

/**
 * Configuration of timer 2 for Dc motor
 */
void configTimer2()
{
    T2CONbits.TON = 0; // turn off timer 2
    T2CON = 0x0010;     //1/8 prescale timer for dc motor
    T2CONbits.TCS = 0;  
    PR2 = PWM_PERIOD;   //preset to motor period
    T2CONbits.TON = 1;      //turns timer 2 on
    TMR2 = 0; //initialize counter to 0
    _T2IF = 0;
}

/**
 * Interrupt for Dc motor to output pulse
 */
void _ISR _T2Interrupt(void)
{
    OC1RS = pulse_width; 
    _T2IF = 0; // clear flag
}

/**
 * Converts the potentiometer reading to motor pulse value
 * @return pulse value of motor
 */
float potPulseValue(){//0-512
    DELAY_MS(20); //the pot reading was taking deal
    uint32_t PulseValue=p_min+((uint32_t)((uint32_t)( p_max - p_min )*potValue))/ANA_D_READ_MID_RANGE; /// ANA_D_READ_MID_RANGE);
    return PulseValue;  
}

/**
 * Configuration of output compare for servo motor
 */
void configOC2()
{
    T3CONbits.TON = 0; // turn off timer 3
    CONFIG_OC2_TO_RP(RB10_RP); //Maps OC1 output to RB10, pin 21
    OC2RS = 0;
    OC2R = 0 ;
    OC2CON = 0x000E; // sets Timer 2 as clock source and operates in PWM mode with fault pin disabled
}

/**
 * configuration of timer 3 for servo motor
 */
void configTimer3()
{
    T3CONbits.TON = 0; // turn off timer 3
    T3CON = 0x0030;     //prescale of 1/256 timer
    T3CONbits.TCS = 0;
    PR2 = Servo_PWM_PERIOD;   //preset to servo period
    T3CONbits.TON = 1;  //turn timer3 on
    TMR2 = 0; //initialize counter to 0
    _T3IF = 0;  //timer3 flag off
}

/**
 * interrupt for servo motor
 */
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

/**
 * configures keypad
 */
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

/**
 * finds which row has been inputed
 * @return the row number of the key pressed
 */
uint8_t get_row(void) {  
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

/**
 * gets the character of input and Saves the input character to password array. Also allows user to clear password array by '*'
 * @param row number from input 
 * @param col number from input
 */
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

/**
 * configuration of timer4 for state machines
 */
void configTimer4(void) {
    T4CON = 0x0030; //TMR4 off, FCY clk, prescale 1:256
    PR4 = period; //delay = PWM_PERIOD
    TMR4 = 0x0000; //clear the timer
    _T4IF = 0; //clear interrupt flag initially
}

/**
 * Interrupt for state machine interrupt flag(manage timing)
 */
void _ISR _T4Interrupt(void){
    TimerFlag = 1;
    _T4IF = 0; //set the flag bit to 0
}

// Declare global state variable and states
enum SM_states {S_C0, S_C1, S_C2, P, WR} state1;
/**
 * SM for keypad input
 */
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
/**
 * Password checking SM
 */
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
            if (pass[0]==correctPass[0] && pass[1]==correctPass[1]) 
                {state = Unlock; 
                DELAY_MS(3);
                }
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
//            writeLCD(0x01,0,0,1);
//            DELAY_MS(5);
            writeLCD(0x80, 0, 1, 1);
            outStringLCD("UNLOCKED ");
            servo_pulse_width = p_servoUnlock;
            break;
        default:
            state = init;
            break;
    }   
 }


int main(void) {
/*** Call configuration routines ***/
    configClock();              //config clock
    configControlLCD();         //config LCD
	configTimer4();             //config timer 4 for SM FeedTime, PasswordSystem and keypad state machine
    config_keypad();            //Set up pins connected to keypad

//configurations for servo motor
    configOC2();                //config output compare for servo motor 
    configTimer3();             //config timer 3 for servo motor
    
//cofigurations for Dc motor 
    CONFIG_RB2_AS_DIG_OUTPUT(); //connected to AIN2 for direction, AIN1 is zero always(grnd)
    configOC1();                //Configs output comparator 1 for DC motor pw
    configTimer2();             //configs timer2 for DC motor
    
//potentiometer analog configuration
    CONFIG_RA0_AS_ANALOG();     //Sets RA0 (pin2) to analog default read
    configADC1_ManualCH0(RA0_AN,31,0);  //configs Analog to digital converter
    
/* Initialize ports and other one-time code */
    state1 = S_C0;          //set initial state for keypad input SM
    state=init;             //set initial state for password system SM
    SM1_STATE=SM1_Feed;     //set initial state for feed system SM
            
    T4CONbits.TON = 1;      // Turn on timer 4
	_T4IE = 1;              //Enable Timer 4 interrupts
    initLCD();              //initialize LCD
    
    T2CONbits.TON = 1;      //setting timer 2 on
    _T2IE = 1;              //enabling timer 2
    
    _T3IE = 1;              //enabling timer 3
    T3CONbits.TON = 1;      //setting timer 3 on
    servo_pulse_width = p_servoLock ;       //initializing the servo to lock start 
    outStringLCD("Initializing");           //intial print out
    DELAY_MS(500);                          //delay to initialize the system
    
    while(1){
        FeedTimeSystem();                   //Feed time SM
        PasswordSystem();                   //Password checking SM
    
        if(inputAccess==1){                 //to not allow user to put password when ever they want
            keypadInput();
        }
        
        //**MotorSystem***//
        if(lock==1){
            AIN2=1;
            pulse_width= potPulseValue();
        }
        else{
            AIN2=0;                         //turn motor off if not locked
        }
        
        while(!TimerFlag);
          TimerFlag=0;
    }
}
