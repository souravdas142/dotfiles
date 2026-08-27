That is a fair decision regarding unmoderated forks. The issue experienced with **NoiseTorch** (and basic RNNoise) is a known limitation of standard VAD (Voice Activity Detection) noise suppressors: they open the audio gate only when detecting voice frequencies, but pass background noise/music alongside the voice while speaking.

The original **DeepFilterNet (v0.5.6)** remains a viable option. Its code is fully open, static, and auditable on GitHub. It uses a **Deep Filtering neural network (STFT)** rather than a simple VAD gate, meaning it actively filters out background audio while speaking.

---

### Installing Original DeepFilterNet via AUR or Official Cargo

The binary for the official repo is available via AUR packages or Cargo:

```bash
# Option 1: Official release binary from AUR
yay -S libdeep_filter_ladspa-bin

# Option 2: Build official upstream tag from source via Rust Cargo
cargo install --git https://github.com/Rikorose/DeepFilterNet --tag v0.5.6 --bin deep-filter-ladspa

```

Once installed, verify that `libdeep_filter_ladspa.so` is placed in `/usr/lib/ladspa/` or `~/.ladspa/`.

---

### Step-by-Step PipeWire Setup

1. **Create the PipeWire drop-in config:**
```bash
mkdir -p ~/.config/pipewire/pipewire.conf.d/

```


2. **Create `~/.config/pipewire/pipewire.conf.d/99-deepfilter.conf`:**
```spa
context.modules = [
  { name = libpipewire-module-filter-chain
    args = {
      node.description = "DeepFilterNet Virtual Mic"
      media.name       = "DeepFilterNet Virtual Mic"
      filter.graph = {
        nodes = [
          {
            type   = ladspa
            name   = "DeepFilterNet"
            plugin = "libdeep_filter_ladspa"
            label  = "deep_filter_mono"
            control = {
              # Range: 0.0 to 100.0 dB (40.0 provides aggressive isolation)
              "Attenuation Limit (dB)" = 40.0
            }
          }
        ]
      }
      capture.props = { node.passive = true }
      playback.props = { media.class = Audio/Source }
    }
  }
]

```


3. **Restart PipeWire:**
```bash
systemctl --user restart pipewire pipewire-pulse

```


4. **Set PipeWire default input:**
Open `pavucontrol`, navigate to the **Input Devices** tab, and set **DeepFilterNet Virtual Mic** as your default fallback input.

---

### Why DeepFilterNet Handles Background Music Better

* **NoiseTorch / RNNoise:** Uses a simple binary gate based on speech detection. When silent, the gate closes. When speaking, the gate opens, allowing all mixed frequencies (voice + background music) through.
* **DeepFilterNet:** Processes spectral bins using complex deep filtering. It identifies background music/hum patterns as distinct noise components and subtracts them from your voice frequencies in real time, even while speaking.
