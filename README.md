# Fish Tank System
## Background
  Fish owners are presented with more problems than one might assume. Leading issues for fish
owners are overfeeding and oxygen systems that disrupt the fish’s ability in the water. Overfeeding is the
number one cause of fish loss. Overfeeding causes more waste in the tank, and its due to an increase in
waste production from the fish added with the uneaten food. The excess waste causes the water to be
polluted, and it unhealthy for the fish. Some common causes of fish overfeeding are: owners not knowing
when to feed the fish, and others feeding the fish that has already been fed. Another issue is finding a
Tank Filter that is strong enough to agitate the surface of the water to increase oxygen levels in the water,
without disturbing the fish’s swimming ability is difficult.

Thus, our system will need to be able to:
* Remind owner when to feed the fish
* Only allow the owner to feed the fish
* Have adjustable strength for the water filtration system

  The system will have a timer that is set for 24 hours (demo 30seconds). This timer will run and
once the timer finishes 1 complete cycle the LCD will say “feed time”, however any other time during
that cycle it will say “Not feed time”. Once it is “feed time” then the system will wait for an input of the
passcode. The user will then input a two-digit code, and if the code matches the password that’s saved
then the system will open the feeding window using the servo, and the water filtration will stop for the
safety of the user. If it’s wrong the input process will be reset, and the user will input it again. The
password inputting can be viewed on the LCD allowing the user to view the entire process.

  During the entire system’s operation, A gear motor will spin constantly clockwise. The user will
be able to change the speed of the motor using a potentiometer. This motor will run constantly, the only
time the motor will stop is when the servo (feeding window) is opened for the safety of the user.

## Parts used in this Project:
1. [Pic24-microcontroller](https://www.microchip.com/en-us/products/microcontrollers-and-microprocessors/16-bit-mcus/pic24f-mcus-16-mips)
1. Servo
1. Brushed DC motor with encoder
1. Number Keypad

## Software:
1. [MPLAB_X](https://www.microchip.com/en-us/development-tools-tools-and-software/mplab-x-ide)
1. C programming langauge

## The circuit:
![alt text](https://github.com/Ahmed4812/fish_tank_system/blob/3c86a7a3577f006b3e0d31d76f7fee07d25d87e1/fishTank_circuit.JPG)


## Acknowledgements

| Name              |                Worked On                |
|-------------------|-----------------------------------------|
| Mudhar Muhi       | Mechanical Build & Design, Pin Mapping  |                     

## License
[MIT](https://choosealicense.com/licenses/mit/)
