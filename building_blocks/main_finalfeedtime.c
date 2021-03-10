/* 
 * File:   
 * Author: 
 * Date:
 * Purpose:
 * Modified:
 */
/*********** COMPILER DIRECTIVES *********/

// #include for textbook library header files
#include "pic24_all.h"
#include "lcd4bit_lib.h"

// #defines for handy constants 
#define LED (_LATA0)  // LED on microstick, RA0 (pin 2)
#define setTime (3001)
// Define State Machine period to 1562 timer ticks of 6.4us
#define period 1562
char cnt;

/*********** GLOBAL VARIABLE AND FUNCTION DEFINITIONS *******/
uint16_t TimerFlag;
uint32_t count;
uint16_t PassPermit;


enum SM1_STATES { SM1_SMStart, SM1_Feed, SM1_lockWait, SM1_TimeToFeed} SM1_STATE;
void Tick_LoHi() {
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
         //display
         break;
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
/********** MAIN PROGRAM ********************************/
int main ( void )  //main function that....
{ 
/* Define local variables */


/* Call configuration routines */
	configClock();  //Sets the clock to 40MHz using FRC and PLL
    configTimer4();
    configControlLCD();
    initLCD();
/* Initialize ports and other one-time code */
    T4CONbits.TON = 1;
    _T4IE = 1; 
/* Main program loop */
	while (1) {	
	    
    Tick_LoHi();
    while(!TimerFlag);
      TimerFlag=0;
    
     
		}
return 0;
}