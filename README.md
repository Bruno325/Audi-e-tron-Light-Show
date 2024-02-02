# Audi-e-tron-Light-Show

This program recreates one of the many patterns from an Audi RS e-tron GT Light Show found in the following video:
https://youtu.be/MrGVitqTwYY?si=_e0gOrLxOP4Ylu1Q&t=11

How the Program Works:
- The leftmost HEX display shows how many times the pattern will repeat before stopping and updates in real-time. Finishing the pattern once will decrement the value until it reaches 0 and the program stops. The repeat counter starts at 9 but can be easily changed at the top of ledPattern.v
- The KEY0 button acts like a reset button. It will reset all registers and the pattern back to the beginning except for the repeat count
- The KEY1 button is the program start button. Similar to how turning your keys ignites your car, pressing KEY1 will begin the light show and will not need to be pressed again
