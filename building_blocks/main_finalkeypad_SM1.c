/*
 * File:   main_keypad_SM.c
 * Author: CT
 * 
 * The value of a keypad press is displayed to a screen using
 * a serial connection.
 * 
 * This program uses a state machine to detect a key pressed and print key to serial monitor
 */

#include "pic24_all.h"           //generic header for PIcol24H family */         
#include "lcd4bit_lib.h"
// Define row pins

#define R0 (_RB15)
#define R1 (_RB12)
#define R2 (_RB11)
#define R3 (_RA1)

// Define column pins
#define C0 (_LATB0)
#define C1 (_LATB1)
#define C2 (_LATB3)
// Value to check if any key is pressed
#define KP() (!R0 || !R1 || !R2 || !R3)

// Define State Machine period to 1562 timer ticks of 6.4us
#define period 1562

volatile uint8_t t2flag = 0;  //timer flag to synchronize state machine
char pass[]={'*','*',0};

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
    
//	AD1PCFGL = 0xFFFF;  //Using all digital I/O
//    _TRISB15 = 1; _TRISB14 = 1; _TRISB13 = 1; _TRISB12 = 1; // Pin 26,25,24,23 inputs
//    _CN11PUE = 1; _CN12PUE = 1; _CN13PUE = 1; _CN14PUE = 1; // Enable pull-up resistor on pins 26,25,24,23
//	_TRISB5 = 0; _TRISB4 = 0; _TRISB3 = 0; //Pin 14,11,7 outputs
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
void print_key(uint8_t row, uint8_t col) { //print the key that is pressed to the terminal, followed by new 
    char character=keypad_table[row][col]; 
    writeLCD(0x80, 0, 1, 1); 
    
    if(pass[0]!='*'){
        pass[1]=character;
    }
    else{
        pass[0]=character;
    }
    outStringLCD(pass);
    }        
void configTimer2(void) {
    T2CON = 0x0030; //TMR2 off, FCY clk, prescale 1:256
    PR2 = period; //delay = PWM_PERIOD
    TMR2 = 0x0000; //clear the timer
    _T2IF = 0; //clear interrupt flag initially
}

void _ISR _T2Interrupt(void){
    t2flag = 1;
    _T2IF = 0; //set the flag bit to 0
}
// Declare global state variable and states
enum SM_states {S_C0, S_C1, S_C2, P, WR} state;

void SM_fct(void) {
/* Inputs: KP()
*  Outputs: C0, C1, C2
*  Variables: col, row - col needs to be static because 
*  it is used as a transition condition*/
   uint8_t rw; // local row variable
   static uint8_t col;  //static column variable - default initialization is 0 on first call
	switch (state) { //transitions
	    case S_C0:
	      if (KP()) {
			  state = P;
			  col = 0;  //Mealy output action
		  } else  {
			  state = S_C1;
		  } break;
		case S_C1:
		   if (KP()) {
			  state = P;
			  col = 1;  //Mealy output action
		  } else  {
			  state = S_C2;
		  } break;
		case S_C2:
		   if (KP()) {
			  state = P;
			  col = 2;  //Mealy output action
		  } else  {
			  state = S_C0;
		  } break;
		case P:
		  state = WR;
		  break;
		case WR:
		  if (KP()) {state = WR; }
		  if (!KP() && (col == 0)) { state = S_C1;}
		  if (!KP() && (col == 1)) { state = S_C2;}
		  if (!KP() && (col == 2)) { state = S_C0;}
		  break;
          default:
		  state = S_C0;
	}
	switch (state) { //outputs
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
		   print_key(rw, col);
		break;
		case WR:
		break;
		default:
		break;
	}
}
int main(void) {
    configClock();
    configControlLCD();
	configTimer2();
    config_keypad();  //Set up RB pins connected to keypad
//    configUART1(230400);  //Set up serial port
//    outString("Keypad Demo \n \r");
    T2CONbits.TON = 1;  // Turn on timer
	_T2IE = 1; //Enable Timer 2 interrupts
    // Local variable for column 
    initLCD();  
    state = S_C0;  //set initial state 
    writeLCD(0xC0, 0, 1, 1);
    outStringLCD("any");
    
    while(1){
	SM_fct();
	while(!t2flag);
	t2flag = 0;
    }
}
