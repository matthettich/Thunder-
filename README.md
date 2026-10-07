# ...Thunder

An 8-pad drum synth and 16-track tracker for the browser, built for a Galaxy Z Fold 6, for making one-shots to use in Koala or SunVox. It uses the Minimal skin from ...Seeds.

## What it does

- **8 pads, 8 layers each.** Every layer has its own oscillator, pitch envelope, amp envelope (A·H·D or ADSR), low-pass and high-pass filters with an envelope, delay and clap-style bursts.
- **Oscillators**
  - Standard: sine, triangle, saw, square, pulse, click
  - FM: 2-op, feedback, metal, cross-mod
  - Additive: harmonic, odd, membrane, bell, bar, chord
  - Noise: white, pink, brown, blue, 808 metal, digital LFSR, crackle, sample-and-hold
  - Plaits: all 24 models of Mutable Instruments Plaits (synth voices, 6-op FM, chords, speech, strings, modal, drums), run from the original code
  - Elements: Mutable Instruments' modal voice, with bow, blow and strike exciters and modal, string or strings resonators
  - Samples loaded from audio files
- **Samples.** Load an audio file into any layer with Load sample, then pitch, reverse and filter it like any other layer.
- **Export.** Mono WAV, 44.1k or 48k, 16 or 24-bit, normalised and tail-trimmed. Save one pad or all 8 as a zip, or share straight to Koala on Android. Optionally add the note to the file name (for example `03 Pluck C3.wav`).
- **Effects per pad.** Up to 6 in any order, with a tail length: Rings resonator, Clouds (granular, stretch, delay, spectral, with a hold-the-tail switch), Airwindows Density saturation and ToTape6, DaisySP chorus and bitcrush.
- **MIDI.** Plug in a controller, tap MIDI ▾ → Connect MIDI. Pads answer notes 36–43 with velocity; Learn pads lets you assign any note.
- **Kits.** Kits save in the browser automatically and can be saved or loaded as `.json`, recorded samples included.

## Tracker

Tap **Tracker** at the top for an M8-style sequencer that plays the kit. 16 tracks, built the M8 way:

- **Song** – 256 rows × 16 tracks of chain numbers. Each track loops back to the top of its block of filled rows when it reaches an empty row.
- **Chain** – up to 16 phrases in order, each with a transpose.
- **Phrase** – 16 steps of note, volume, instrument and three effects.
- **Inst** – 16 instruments. Each plays one of the 8 pads with its own transpose, volume, pan, reverse and start point. C-4 plays a pad at its own pitch.
- **Mixer** – volume, pan, mute, solo and effects per track, a master level and meters.
- **FX** – up to 4 effects per track and 4 on the master, running live as the song plays (see below).
- **Project** – tempo, swing, limiter, render settings, renders, and project files (song and kit together).

Effects: `RET` retrigger, `DEL` delay, `CUT`, `CHA` chance, `PSL` pitch slide, `RND` random pitch/level, `OFS` start offset, `REV` reverse, `PAN`, `TPO` tempo, `HOP` jump. There are 6 ticks to a step.

**Track effects.** Open FX from the tab, from the mixer's FX row (EDIT), or with SHIFT+▶ in the mixer (on the MASTER row it opens the master chain). Each track has 4 slots that run top to bottom; EDIT on an empty slot adds an effect, EDIT+arrows picks another type, OPTION+EDIT removes it. The settings of the slot you were last on are listed underneath, as hex values like the rest of the tracker. The effects:

- **EQ** – Airwindows EQ: treble, mid and bass, their frequencies, lowpass, highpass, output
- **COMP** – Airwindows Pressure4 compressor, with a mix control for parallel compression
- **VERB** – Airwindows Galactic reverb
- **DLY** – Airwindows TapeDelay2, timed in steps so it follows the tempo
- **SAT** – Airwindows Density · **TAPE** – Airwindows ToTape6
- **CHOR** – DaisySP chorus · **CRSH** – DaisySP bitcrush
- **RING** – Mutable Instruments Rings resonator · **CLDS** – Mutable Instruments Clouds

Renders include the effects and let reverb and delay tails ring out. Stems skip the master effects and the limiter, so they add up to the mix when the master chain is empty. Each effect costs some phone CPU; Clouds and Rings are the heaviest.

**One finger is enough.** Every M8 combination works without holding two buttons:

- **Sticky keys** – tap SHIFT or OPTION on its own and it lights up and stays on for the next button (tap it again to cancel). So SHIFT, then ▶ changes screen; OPTION, then EDIT clears; SHIFT, then OPTION selects; SHIFT, then EDIT pastes; SHIFT, then PLAY plays the song. Holding still works as before.
- **Command row** – a row of buttons above the d-pad: − − / − / + / + + (change the value), ◀ PREV / NEXT ▶ (other chain, phrase, instrument or FX track), CLEAR, SELECT, COPY, CUT, PASTE and ▶ SONG.

Both are on by default on touch screens and can be turned off in Project (COMMANDS, STICKY KEYS).

**Two input modes** (the INPUT button by the tabs, or Project → INPUT):

- **PAD** – a d-pad plus SHIFT, PLAY, OPTION and EDIT, used like an M8: SHIFT+arrows changes screen, EDIT adds (twice for a new chain or phrase), EDIT+arrows changes a value, OPTION+EDIT clears, SHIFT+OPTION selects, SHIFT+EDIT pastes. On a computer keyboard: arrows, Shift, Z = Option, X = Edit, Space = Play.
- **KEYS** – direct entry. On a keyboard: notes on Z–M and Q–I, `-`/`=` octave, `1` note off, 0–F for hex, letters for effects, Enter to add or open, Delete to clear, Alt+arrows to change values, `[` `]` for the previous/next chain or phrase, Ctrl/⌘ B, C, X, V to select, copy, cut and paste. On a touch screen the dock turns into a keypad that follows the cursor: a piano in the note column, 0–F in hex columns, effect names in effect columns.

On touch, tap a cell to move there, tap it again to open or add, and drag up or down on it to change the value. Tap a track number to mute it.

**Rendering.** Project → RENDER SONG saves a stereo WAV; RENDER STEMS saves a zip with the mix plus one WAV per track. Stems are all the same length and include each track's effects; they skip the limiter and the master effects. Rate, bits and normalising follow the Export settings.

The tracker keeps playing while you switch back to the synth, so you can change a pad and hear it in the loop.

## Running it

It's a plain web app with no build step: `index.html`, `manifest.webmanifest`, `sw.js` and the `icons` folder. Turn on GitHub Pages for this repo (Settings → Pages → deploy from `main`, root folder), then open **https://matthettich.github.io/Thunder-/** in Chrome.

## Install it

- **Android (Chrome):** open the address, tap **⋮** → **Install app** (or **Add to Home screen**).
- **Mac / PC (Chrome or Edge):** click the install icon in the address bar.

It opens full screen with its own icon and works offline once it has loaded. To update, push a new `index.html`; open the app while online and it picks up the change (close and reopen once if you still see the old version).

## Credits

Synthesis and effects come from Mutable Instruments (Plaits, Rings, Clouds, Elements; Emilie Gillet), Airwindows (Chris Johnson) and DaisySP (Electrosmith), all MIT licensed. See `THIRD_PARTY_NOTICES.md`; build sources are in `dsp/` (the tracker's effects module is in `dsp/tfx/`).
