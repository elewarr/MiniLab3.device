# MiniLab3.device

## Arturia's Minilab3 integration script for Logic Pro

I am a complete and total amateur, I've just started my MIDI controllers adventure with Minilab3 from Arturia. And it's
a really nice piece of hardware.

But I had a feeling that software integration (in DAW mode, with Logic Pro) is limiting it.
For example, I tried to find a way to:

- somehow make my Minilab3 *Play* pad blink with playhead beats (to have visual cues too, not only auditory ones),
- enable shift-lock, so I wouldn't have to press the shift button for transport messages in DAW mode

And I noticed the way the Arturia Minilab3 MIDI controller works with Logic Pro leaves room for improvement.

I created my own [config.lua](config.lua), hoping I could improve a few things and add a few things I was missing.
It's very loosely based on
original [config.lua](https://downloads.arturia.net/products/minilab-3/daw-integration-script/MiniLab_3_Logic_Pro_Daw_Integration_Script_1_0.zip)
by Farès MEZDOUR provided by Arturia (SYSEX messages mostly).

### Disclaimer

Unfortunately, there are no publicly available materials on how to integrate a MIDI controller with Logic Pro, so there
may be some mistakes, bugs and hidden traps. I'm unable to tell how the implementation affects the I/O performance, etc.

Since I'm not affiliated with Apple (Logic Pro) or Arturia, *trial and error* approach was prevalent, a bit of
magic and lots of guessing were involved too.

**I tested it only on my own setup. You use this at your own risk!**

### Video

I'm sorry for the quality, and it was still a work in progress, probably won't show much.

[![Youtube video](http://img.youtube.com/vi/mQqbCdM_ewk/0.jpg)](https://www.youtube.com/watch?v=mQqbCdM_ewk "Demo")

### Features

- Bank A handles loop, stop, play, record pads the same way as MIDI transport messages (no need to hold the shift
  button)
- Play button blinks for distinct beats (when the playhead is moving)
- Stop and Rec buttons lighten up when playing (for Stop) or recording (for Rec)
- Rec button blinks for armed track (when the given track is armed and active, same as the 'R' button in Logic Pro)
- Bank A has a custom color coding
- The rest of the controls (knobs, faders) haven't changed for now (same as original Arturia's)
- Display behavior should be similar too (to Arturia's original)

### Known issues

- Sometimes the first time PAD (transport - play, stop, rec) is pressed, Logic Pro does not react the way it should
- When encoders are rotated, the Minilab3 display does not seem to display actual value; the encoder must be turned to 0
  first to make it work
- I'm still learning Logic Pro, so I wasn't able to properly test it, needs more testing

### Installation

1. **Make a copy of original `config.lua` first! And be aware you'll lose any custom controller assignments for
   Minilab3**
2. Overwrite
   original [config.lua](https://downloads.arturia.net/products/minilab-3/daw-integration-script/MiniLab_3_Logic_Pro_Daw_Integration_Script_1_0.zip)
   located in `~/Music/Audio Music Apps/MIDI Device Profiles/Arturia/MiniLab3.device`
   with [config.lua](config.lua).
3. Remove Minilab3 Surface Control Setup from Logic Pro - using menu: *Logic Pro -> Control Surfaces -> Setup... ->
   Delete `Minilab3`*.
4. If Minilab3 automatic setup is enabled in - using menu: *Logic Pro -> Settings -> Control Surfaces -> MIDI
   Controllers tab -> make sure `auto` is checked* - it should be enough to restart Logic Pro.
5. If automatic configuration is not enabled - using menu: *Logic Pro*Logic Pro -> Control Surfaces -> Setup... ->
   New -> Install -> Arturia/Minilab 3/Minilab 3 version 7 or higher* and select proper MIDI in and out ports.

### Other

Apple, Arturia, Logic Pro, Minilab 3 trademarks belong to its owners.