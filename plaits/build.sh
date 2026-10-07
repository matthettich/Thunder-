#!/bin/sh
# Rebuilds plaits.wasm (embedded in index.html as base64) from Mutable Instruments' source.
# Needs: clang 18 with wasm-ld, the WASI sysroot and libclang_rt.builtins for wasm32
# (both from https://github.com/WebAssembly/wasi-sdk/releases), and
#   git clone https://github.com/pichenettes/eurorack && git -C eurorack submodule update --init stmlib
# Usage: E=path/to/eurorack SYSROOT=path/to/wasi-sysroot RESDIR=path/to/clang-resource-dir sh build.sh
set -e
P="algorithms additive_engine bass_drum_engine chiptune_engine chord_bank chord_engine dx_units fm_engine grain_engine hi_hat_engine lpc_speech_synth lpc_speech_synth_controller lpc_speech_synth_phonemes lpc_speech_synth_words modal_engine modal_voice naive_speech_synth noise_engine particle_engine phase_distortion_engine resonator sam_speech_synth six_op_engine snare_drum_engine speech_engine string string_engine string_machine_engine string_voice swarm_engine virtual_analog_engine virtual_analog_vcf_engine voice waveshaping_engine wavetable_engine wave_terrain_engine"
SRCS=""
for f in $P; do SRCS="$SRCS $(find "$E/plaits" -name "$f.cc" | head -1)"; done
SRCS="$SRCS $(find "$E/stmlib" -name units.cc | head -1) $(find "$E/stmlib" -name random.cc | head -1) $E/plaits/resources.cc"
clang++ --target=wasm32-wasi --sysroot="$SYSROOT" -resource-dir="$RESDIR" -O2 -DTEST -include cstdio \
  -fno-exceptions -fno-rtti -I"$E" -std=c++14 -Wno-everything \
  -mexec-model=reactor -Wl,--export=_initialize -Wl,--strip-all \
  plaits_wasm.cc $SRCS -o plaits.wasm
echo "Built plaits.wasm. Paste base64 of it into the plaitsWasm script tag in index.html."
