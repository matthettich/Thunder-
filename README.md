# ...Thunder

An 8-pad drum synth for the browser, built for a Galaxy Z Fold 6, for making one-shots to use in Koala or SunVox. It uses the Minimal skin from ...Seeds.

## What it does

- **8 pads, 8 layers each.** Every layer has its own oscillator, pitch envelope, amp envelope (A·H·D or ADSR), low-pass and high-pass filters with an envelope, delay and clap-style bursts.
- **Oscillators**
  - Standard: sine, triangle, saw, square, pulse, click
  - FM: 2-op, feedback, metal, cross-mod
  - Additive: harmonic, odd, membrane, bell, bar, chord
  - Noise: white, pink, brown, blue, 808 metal, digital LFSR, crackle, sample-and-hold
  - Recorded samples
- **Recording.** Tap Rec, then a pad. Capture starts when sound crosses the threshold and stops after a set stretch of quiet. You can also load an audio file.
- **Export.** Mono WAV, 44.1k or 48k, 16 or 24-bit, normalised and tail-trimmed. Save one pad or all 8 as a zip, or share straight to Koala on Android.
- **Kits.** Kits save in the browser automatically and can be saved or loaded as `.json`, recorded samples included.

## Running it

It's a single `index.html` with no build step. Turn on GitHub Pages for this repo (Settings → Pages → deploy from `main`, root folder) and open the Pages address in Chrome on the phone. The microphone needs the page served over https, which Pages provides.
