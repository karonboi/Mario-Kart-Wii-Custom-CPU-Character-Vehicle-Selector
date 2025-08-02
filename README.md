# Mario Kart Wii: Custom CPU Character/Vehicle Selector
I wasted too much time building this thing.

* * *

## What is this?
In case the repo's name is not obvious enough, this program allows you to *customize which character and vehicle the CPU players use* in single-player or local multiplayer Mario Kart Wii races. This also affects Grand Prix races, as well as VS races and Battles.

If you're looking for a way to let every player in Mario Kart Wii to play as Funky Kong, *you have found the right place*.

## How and why did I make this?
I didn't actually build the core part of this program. All I did was use [this Gecko code](https://mariokartwii.com/showthread.php?tid=1563) and built a UI shell so that the process of setting up this code can become much easier than it originally was.

The code requires the user to *subject which character and vehicle each CPU player is allowed to use*. Seems simple, but: first, **there are 24 characters** in the Mario Kart Wii roster (not counting the Miis: 3 outfits x 3 sizes x 2 genders). Each character has a set of **12 vehicles** (6 karts, 6 bikes), and they ***must match the character's size*** (three types of sizes: Small, Medium, and Large). Secondly, there are **11 CPU opponents**. To input the combo, you need to do it *manually in a fixed order* (from CPU 1 to CPU 11, but even so, the CPUs **will not appear in the order you've set**), and ***none of them are allowed to be left empty***. Finally, and also the main reason why it's one of the most painful parts of a cheat code configuration: to specify character and vehicle, you have to use *hexadecimal*, and, the characters' and the vehicles' list is ***really, really long*** thanks to the possible combinations mentioned earlier.

## How to use this
Simply specify which character and vehicle you want for a CPU opponent. If you want to set one config for all CPU opponents, go to *Other options - Set all CPUs selection*. Then click *Generate Gecko code* and you're done.
### Does it have any known issues?
Once the code is applied, **all the characters** - including the one that the players have selected - **will be locked**. Unless the game is closed or force reset, they cannot be changed whatsoever. It can get a little bit annoying, but if you can put up with it, then that's good.
### Is it compatible with other regions?
You can change the Gecko code's region in *Other options*.
### Can Mii racers be added in here?
Yes, this program supports including the Mii racers. Detailed instructions will be included in the program.

## How do I build the program?
You don't need to build the program, just download the source code and run *app.bat* and it will work just fine. However, if you want to keep your PC's desktop clean or just don't like starting a program from a folder, download the compiled executable from the releases page instead.
