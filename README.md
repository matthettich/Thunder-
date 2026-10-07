# ...Thunder

An 8-pad drum synth for the browser, built for a Galaxy Z Fold 6, for making one-shots to use in Koala or SunVox. It uses the Minimal skin from ...Seeds.

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

## Running it

It's a plain web app with no build step: `index.html`, `manifest.webmanifest`, `sw.js` and the `icons` folder. Turn on GitHub Pages for this repo (Settings → Pages → deploy from `main`, root folder), then open **https://matthettich.github.io/Thunder-/** in Chrome.

## Install it

- **Android (Chrome):** open the address, tap **⋮** → **Install app** (or **Add to Home screen**).
- **Mac / PC (Chrome or Edge):** click the install icon in the address bar.

It opens full screen with its own icon and works offline once it has loaded. To update, push a new `index.html`; open the app while online and it picks up the change (close and reopen once if you still see the old version).

## Credits

Synthesis and effects come from Mutable Instruments (Plaits, Rings, Clouds, Elements; Emilie Gillet), Airwindows (Chris Johnson) and DaisySP (Electrosmith), all MIT licensed. See `THIRD_PARTY_NOTICES.md`; build sources are in `dsp/`.
