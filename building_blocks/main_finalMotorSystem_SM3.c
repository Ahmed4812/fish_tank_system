/* 
 * File:proj3
 * Author: Ali Ahmed Khan and Abishek
 * Date:02/17/2020
 * Purpose:Control DC motor with pot in different speed and direction, and display speed and direction of the motor.
 * Modified:
 */
/*********** COMPILER DIRECTIVES *********/

// #include for textbook library header files
#include "pic24_all.h"
#include "lcd4bit_lib.h"
#include <stdio.h>
// #defines for handy constants 
#define AIN2 (_LATB2)
#define PWMA (_LATB4)
#define potValue (convertADC1())
#define p_min (255)
#define p_max (510)
#define PWM_PERIOD (510)
#define ANA_D_READ_MID_RANGE (512)

/*********** GLOBAL VARIABLE AND FUNCTION DEFINITIONS *******/
uint16_t lock;
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
    

/********** MAIN PROGRAM ********************************/
int main ( void )  //main function that....
{ 
/* Define local variables */
  
/* Call configuration routines */
    CONFIG_RB2_AS_DIG_OUTPUT(); //connected to AIN2 for direction
    configClock();  //Sets the clock to 40MHz using FRC and PLL
    configOC1();    //Configs outcomparator 1 for pwm
    configTimer2(); //configs time2
    CONFIG_RA0_AS_ANALOG();     //Sets RA0 (pin2) to analog default read
    configADC1_ManualCH0(RA0_AN,31,0);
    
/* Initialize ports and other one-time code */
    initLCD();    
    T2CONbits.TON = 1;      //setting timer 2 on
    _T2IE = 1;              //enabling timer 2
    DELAY_MS(250);          //delay to initialize the system
  
    
/* Main program loop */
	while (1) {
        if(lock==1){
            AIN2=1;
            pulse_width= potPulseValueCC(potValue);
            DELAY_MS(500);}
        else{
            pulse_width=0;
        }
    }
return 0;

}