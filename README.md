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

**Pad effects.** Each pad can have up to 6 effects, run top to bottom after the layers: EQ, Compressor, Reverb and Tape delay (Airwindows EQ, Pressure4, Galactic and TapeDelay2, the same as the tracker's track effects), Rings, Clouds, Saturation, Tape, Chorus and Bitcrush. Each effect card has a level meter showing the peak coming out of that effect while the pad plays, with the last peak in dB beside it. Reverb and delay keep the dry hit at full level until their Mix passes the half-way point.

## Skins

**Skin ▾** in the top bar (or SKIN in the tracker's Project screen) switches between the ...Seeds skins: Pastel (follows your system), Pastel light, Minimal, Minimal colors, Monotone, Minimal black, Minimal colors black and Neon. The choice is remembered.

## Synth slots

The kit has 16 slots. 1–8 are the drum pads (one-shots). 9–16 are synths for melodic and harmonic parts, starting as Bass, Pluck, Keys, Pad, Lead, Bell, Organ and Sub. A synth note holds at its sustain level for as long as it is held (up to the slot's Max len), then fades over the longest release of its ADSR layers. They are tuned so C-4 plays middle C. On the synth page, the computer keyboard and the pads hold synth notes while pressed (hold several keys for a chord); Space and Shift+number play them for the slot's Gate; MIDI notes that aren't mapped to a drum pad play the selected synth, held until note-off. Exports still make one-shots (the Gate length), named with their note if you turn that on. Kits saved before the synth slots load with the factory synths in 9–16.

## Playing pads from the computer keyboard

On the synth page the keyboard plays the selected pad chromatically, Renoise style: Z to / is the lower octave (S D G H J for sharps), Q to P the upper (2 3 5 6 7 9 0 for sharps). C-4 is the pad at its own pitch; − and = (or numpad / and *) change the octave. Shift+1–8 or ◀ ▶ pick a pad (◀ ▶ go through all 16 slots), Space plays it as it is. On a synth slot, notes hold while the keys are down.

## Tracker

Press **?** (or F1, or the **?** button at the top right) for a help screen with every key and a guide to how the tracker works.

Tap **Tracker** at the top for an M8-style sequencer that plays the kit. 16 tracks, built the M8 way:

- **Song** – 256 rows × 16 tracks of chain numbers. Each track loops back to the top of its block of filled rows when it reaches an empty row.
- **Chain** – up to 16 phrases in order, each with a transpose.
- **Phrase** – up to 32 rows of note, volume, instrument and three effects. Press ▲ on the top row to reach the phrase's LEN (how many rows it plays, 1–32, default 16) and LPB (lines per beat for this phrase; -- uses the song's).
- **Inst** – 16 instruments. Each plays one of the 8 pads with its own transpose, volume, pan, reverse and start point. C-4 plays a pad at its own pitch.
- **Mixer** – volume, pan, mute, solo and effects per track, level meters per track (green, yellow above −12 dB, red above −6 dB), and a stereo master meter with peak and CLIP.
- **FX** – up to 4 effects per track and 4 on the master, running live as the song plays (see below).
- **Project** – tempo, LPB (lines per beat, like Renoise: 4 = 16ths, 8 = 32nds, 3 or 6 = triplets), swing, limiter, render settings, renders, and project files (song and kit together).

**Chords and polyphony.** Tracks 9–16 are polyphonic. A phrase opened from one of them shows four note columns (N1–N4), so a row can hold a chord, and notes ring over each other up to 4 per track (a fifth steals the oldest). A note OFF in any note column releases every note on the track; on synth slots that's their release, drum pads stop at once. Tracks 1–8 stay monophonic and play only N1. Instruments 08–0F play the synth slots in new songs (older songs keep their instruments as they were). Songs saved before the chord columns open with their notes in N1.

**FX column.** Named and laid out like the M8's. Sequencer commands:

| | | | |
|---|---|---|---|
| `ARP` arpeggio (+X, +Y semitones) | `ARC` arpeggio pattern (X: up, down, up-down, random) and speed (Y ticks) | `CHA` chance the note plays | `DEL` delay in ticks |
| `GRV` / `GGR` groove: X ticks on even steps, Y on odd | `HOP` end the phrase, next one starts at row Y | `INS` play with instrument XX | `KIL` stop the note after XX ticks |
| `OFF` fade the note out after XX ticks | `NTH` play on pass Y of every X | `RET` retrigger every Y ticks, X fades | `REP` repeat the last command, adding XX |
| `RND` randomise the command to the left (alone: the note's pitch), −X / +Y | `RNL` the same as a random walk | `PSL` pitch slide | `PBN` pitch bend across the step |
| `PVB` vibrato (X speed, Y depth) | `SED` seed the random numbers | `TPO` tempo | `TSP` transpose the track from here on |

Instrument commands, like the M8 sampler's: `VOL` volume, `PIT` pitch (signed semitones), `FIN` fine tune (cents), `PLY` 00 forwards / 01 reversed, `STA` start point, `PAN`. On a row with no note they change the note that is already playing (so do `ARP`, `PBN`, `PVB`, `KIL` and `OFF`). There are 6 ticks to a step. Not here yet: tables (`TBL`, `TBX`, `THO`, `TIC`), `SNG`, `NXT`, `RTO`, `PVX`, filter and MIDI commands. In this version `GRV` sets the groove for every track, the same as `GGR`. Songs from earlier versions are converted on load (`CUT` becomes `KIL`, `OFS` `STA`, `REV` `PLY`).

**Track effects.** Open FX from the tab, from the mixer's FX row (EDIT), or with SHIFT+▶ in the mixer (on the MASTER row it opens the master chain). Each track has 4 slots that run top to bottom; EDIT on an empty slot adds an effect, EDIT+arrows picks another type, OPTION+EDIT removes it. The settings of the slot you were last on are listed underneath, as hex values like the rest of the tracker. The effects:

- **EQ** – Airwindows EQ: treble, mid and bass, their frequencies, lowpass, highpass, output
- **COMP** – Airwindows Pressure4 compressor, with a mix control for parallel compression
- **VERB** – Airwindows Galactic reverb
- **DLY** – Airwindows TapeDelay2, timed in steps so it follows the tempo
- **SAT** – Airwindows Density · **TAPE** – Airwindows ToTape6
- **CHOR** – DaisySP chorus · **CRSH** – DaisySP bitcrush
- **RING** – Mutable Instruments Rings resonator · **CLDS** – Mutable Instruments Clouds

Renders include the effects and let reverb and delay tails ring out. Stems skip the master effects and the limiter, so they add up to the mix when the master chain is empty. Each effect costs some phone CPU; Clouds and Rings are the heaviest. The **CPU** meter in the top bar shows the load (Chrome's own audio load where it reports one, otherwise the share of real time the track effects take); it turns gold past 50% and red past 80% or on dropouts. Tap it to see which tracks cost the most.

**One finger is enough.** Every M8 combination works without holding two buttons:

- **Sticky keys** – tap SHIFT or OPTION on its own and it lights up and stays on for the next button (tap it again to cancel). So SHIFT, then ▶ changes screen; OPTION, then EDIT clears; SHIFT, then OPTION selects; SHIFT, then EDIT pastes; SHIFT, then PLAY plays the song. Holding still works as before.
- **Command row** – a row of buttons above the d-pad: − − / − / + / + + (change the value), ◀ PREV / NEXT ▶ (other chain, phrase, instrument or FX track), CLEAR, SELECT, COPY, CUT, PASTE and ▶ SONG.

Both are on by default on touch screens and can be turned off in Project (COMMANDS, STICKY KEYS).

**Two input modes** (the INPUT button by the tabs, or Project → INPUT):

- **PAD** – a d-pad plus SHIFT, PLAY, OPTION and EDIT, used like an M8: SHIFT+arrows changes screen, EDIT adds (twice for a new chain or phrase), EDIT+arrows changes a value, OPTION+EDIT clears, SHIFT+OPTION selects, SHIFT+EDIT pastes. On a computer keyboard: arrows, Shift, Z = Option, X = Edit, Space = Play.
- **KEYS** – direct entry. On a keyboard: notes on Z–M and Q–I, `-`/`=` octave, `1` note off, 0–F for hex, letters for effects, Enter to add or open (on a phrase row it also picks up what's there as the current values: the row's instrument, plus the note, volume, or effect and its value under the cursor, which new entries then use; the hint line shows them after NOW), Delete to clear, Alt+arrows to change values, `[` `]` for the previous/next chain or phrase, Ctrl/⌘ B, C, X, V to select, copy, cut and paste. On a touch screen the dock turns into a keypad that follows the cursor: a piano in the note column, 0–F in hex columns, effect names in effect columns.

**Computer keyboard** (KEYS mode, with Renoise habits where they fit the M8 layout):

- **Screens:** Alt+1–7 for Song, Chain, Phrase, Inst, Mixer, FX, Project (Alt+0 goes back to the synth); F2 Phrase, F3 Mixer, F4 Inst. Shift+◀▶ step through every screen in tab order (Song, Chain, Phrase, Inst, Mixer, FX, Project), and Ctrl/⌘+Shift+arrows change screen from anywhere (▲ Project, ▼ Mixer), since Shift+▲▼ selects lines.
- **Transport:** F5 plays the song from the top, F6 this screen, F7 the song from the cursor row, F8 stops. Space plays this screen, Shift+Space the song.
- **Notes:** Z to / and Q to P as in Renoise (S D G H J and 2 3 5 6 7 9 0 for sharps), 1 or Caps Lock for note off, − = or numpad / * for octave.
- **Editing:** Delete clears the whole row and steps down; Shift+Delete clears just the cell; Backspace does the same as Delete (nothing below moves); Insert adds a blank row; Ctrl/⌘+Backspace removes the row and pulls the rows below up. { and } set the edit step (how far the cursor moves after typing). Ctrl/⌘+Z undo, Ctrl/⌘+Y or Shift+Z redo.
- **Lines and clipboard:** Shift+▲▼ selects whole lines in Song, Chain and Phrase (the first press takes the cursor's line, the next ones grow it); on a touch screen, tap the row numbers instead. Ctrl/⌘+C copies, Ctrl/⌘+X cuts, Ctrl/⌘+V pastes at the cursor row (or over a selection, from its top), Ctrl/⌘+A selects every line, Ctrl/⌘+B starts a block selection, Esc drops it. Lines copied in one phrase paste into any other phrase. A paste or cut undoes in one step.
- **Files:** Ctrl/⌘+S saves the project, Shift+Ctrl/⌘+S saves it as a new file, Ctrl/⌘+O opens one (these work on the synth page too). In desktop Chrome and Edge, Save writes straight back to the file you opened or last saved; other browsers download a copy, and Save As asks for a name first.
- **Moving:** Tab and Shift+Tab jump between the note, volume, instrument and FX columns (or tracks); Home, End, Page Up/Down; Ctrl/⌘+▲▼ or [ ] for the previous/next chain or phrase.

These screen, transport and undo keys also work in PAD mode.

**Screen colour.** Project → SCREEN picks the tracker screen's colour: pastel blue (the default), lilac, mint, peach, butter, or the M8's black. The pastels use dark text at readable contrast.

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
