# Mario Kart Wii: Custom CPU Character/Vehicle Selector

I wasted too much time building this thing. And don't even think about feeding this code to AI, you will kill it.

## What is this?

In case the repo's name is not obvious enough, this program allows you to *customize which character and vehicle the CPU players use* in Mario Kart Wii races. However, this code can only be used exclusively in single-player game modes.

If you're looking for a way to let every player in Mario Kart Wii to play as Funky Kong in Flame Runner, *you have found the right place*.

## How and why did I make this?

I didn't actually build the core part of this program. All I did was use [this Gecko code](https://mariokartwii.com/showthread.php?tid=1563) and built a UI shell so that the process of setting up this code can become much easier than it originally was.

The code requires the user to *subject which character and vehicle each CPU player is allowed to use*. Seems simple, but:

- First, **there are 24 characters** in the Mario Kart Wii roster (not counting the Miis: 3 outfits x 3 sizes x 2 genders). Each character has a set of **12 vehicles** (6 karts, 6 bikes), and they ***must match the character's size*** (three types of sizes: Small, Medium, and Large).
- Secondly, there are **11 CPU opponents**. To input the combo, you need to do it *manually in a fixed order* (from CPU 1 to CPU 11, but even so, the CPUs **will not appear in the order you've set**), and ***none of them are allowed to be left empty***.
- Finally, and also the main reason why it's one of the most painful parts of a cheat code configuration: to specify character and vehicle, you have to use *hexadecimal*, and, the characters' and the vehicles' list is ***really, really long*** thanks to the possible combinations mentioned earlier.

## How to use this

Simply specify which character and vehicle you want for a CPU opponent. If you want to set one config for all CPU opponents, go to *Other options - Set all CPUs selection*. Then click *Generate Gecko code* and you're done.

### Does it have any known issues?

Once the code is applied, **all the characters** - including the one that the player has selected - **will be locked**. Unless the game is closed or force reset, they cannot be changed whatsoever. It can get a little bit annoying, but if you can put up with it, then that's good.

### Is it compatible with other regions?

You can change the Gecko code's region in *Other options*. There are 4 options to select based on the region of the game you have:

| Code | Game Region |
| --- | --- |
| NTSC-U | American |
| NTSC-K | Korean |
| NTSC-J | Japanese |
| PAL | European |

### Can Mii racers be added in here?

Yes, this program supports including the Mii racers. Detailed instructions are included in the program. The Mii used in this option is the one you used for your Mario Kart Wii license.

A step-by-step guide will show up once you select the Mii, in this order:

1. Gender (male, female)
2. Outfit (A, B, C)
3. Size (small, medium, large)
   - If you couldn't determine what size your Mii is, start the game and select your Mii to see what type of vehicle your Mii can use
4. Vehicle (based on the selected Size)

## How do I build the program?

You don't need to build the program, just download the source code and run *app.bat* and it will work just fine. However, if you want to keep your PC's desktop clean or just don't like starting a program from a folder, use *Windows IExpress* to package the source materials into a self-extract executable, then set `cmd /c app.bat` as the install command. Remeber to enable ***Store files using Long File Name inside Package*** before compiling.

Additionally, you can also use *7-zip* to wrap these files into a self-extracting executable with the same startup command as above. Just remember to re-direct the extract path to somewhere else, like `%APPDATA%`.

## External resources

| Name |Description |
| --- | --- |
| `bg.exe` | used as an alternative to `cls` to prevent flickering when switching screens |
| `cmdmenusel.exe` | used for interactive buttons on the terminal window |
| `cmdwiz.exe` | its only purpose here is to count how many letters are there in a value |

## License

[The Unlicense](LICENSE)

<img src="https://github.com/karonboi/Mario-Kart-Wii-Custom-CPU-Character-Vehicle-Selector/blob/main/IconGroup3000.png?sanitize=true&raw=true" alt="the one and only." />
