/* 
 * File:   ex5_ALI_copy
 * Author: Ali Ahmed Khan
 * Date: 1/27/20
 * Purpose:
 * Modified:
 */
/*********** COMPILER DIRECTIVES *********/

// #include for textbook library header files
#include "pic24_all.h"

// #defines for handy constants 
#define LED (_LATA0)  // LED on microstick, RA0 (pin 2)


/*********** GLOBAL VARIABLE AND FUNCTION DEFINITIONS *******/
int Servo_PWM_PERIOD = 3125; //amt of Tcks
int p_min = 150; //amt of Tcks
int motor_max = 170; // amt of Tcks


uint16_t motor_pulse_width;

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
    OC2RS = motor_pulse_width; 
    _T3IF = 0; // clear flag
}
    
/********** MAIN PROGRAM ********************************/
int main ( void )  //main function that....
{ 
/* Define local variables */


/* Call configuration routines */
	configClock();  //Sets the clock to 40MHz using FRC and PLL
    configOC2();
    configTimer3();
    


/* Initialize ports and other one-time code */

    _T3IE = 1;
    T3CONbits.TON = 1;
    motor_pulse_width = 156; // positional middle 
   // pulse_width = 234;
    DELAY_MS(500);
    
/* Main program loop */
	while (1) 
    {	
//        pulse_width=p_max;
//        DELAY_MS(3000);
        motor_pulse_width=p_min;
//        DELAY_MS(10000);
//        pulse_width=p_max;
     
//       uint16_t i=p_min;
//		for(i; i!=p_max;i++)
//        {
//            pulse_width=i;
//            DELAY_MS(5);
//        }
//        for(i; i!=p_min;i--)
//        {
//            pulse_width=i;
//            DELAY_MS(5);
//        }
       
    }
return 0;
}