
# MATLAB Audio Downsampling Analysis

A demonstration of the effects of downsampling (with and without anti-aliasing) on an audio signal, using the built-in `handel` sample in MATLAB. This project visualizes both time-domain and frequency-domain representations before and after downsampling, and plays back the audio at each stage.

## Table of Contents

- [Features](#features)  
- [Prerequisites](#prerequisites)  
- [Installation](#installation)  
- [Usage](#usage)  
- [Script Breakdown](#script-breakdown)  
- [License](#license)  
- [Author](#author)

## Features

- Load and plot the original `handel` audio signal (time domain).  
- Compute and visualize its frequency spectrum via FFT.  
- Downsample the signal by a factor of 2 **without** anti-aliasing:  
  - Time-domain plot  
  - Frequency spectrum  
- Downsample with a 5th-order Chebyshev Type I low-pass filter (cutoff at 0.45·Nyquist):  
  - Time-domain plot  
  - Frequency spectrum  
- Audio playback at each stage, with pauses to listen.  
- Side-by-side comparison in a 3×2 subplot layout.

## Prerequisites

- MATLAB R2018a or later (any version with Signal Processing Toolbox).  
- Signal Processing Toolbox (for `cheby1` filter design).

## Installation

1. **Clone the repository**  
   ```bash
   git clone https://github.com/your-username/MATLAB-Audio-Downsampling-Analysis.git
   cd MATLAB-Audio-Downsampling-Analysis


2. **Open in MATLAB**

   ```matlab
   open audio_downsampling_analysis.m
  

3. **Run the script**

   ```matlab
   run('audio_downsampling_analysis.m');
  

## Usage

1. Launch MATLAB and navigate to the project directory.
2. Ensure that the Signal Processing Toolbox is installed.
3. Run the script.
4. Observe the plots:

   * **Top row**: original signal (time + spectrum)
   * **Middle row**: downsampled without anti-aliasing (time + spectrum)
   * **Bottom row**: downsampled with Chebyshev anti-alias filter (time + spectrum)
5. Listen to each playback segment; the script pauses for 9 seconds between plays.

## Script Breakdown


load handel;               % Load sample audio (y) and Fs
t = (0:length(y)-1) / Fs;  % Time vector
figure;
subplot(3,2,1); plot(t,y);            % Original time-domain
subplot(3,2,2);                       % Original frequency-domain
   y_fft2 = fftshift(fft(y));
   plot(linspace(-Fs/2,Fs/2,length(y)), abs(y_fft2));

% Downsampling without anti-aliasing
D = 2;
y_down = downsample(y,D);
Fs_down = Fs / D;
subplot(3,2,3); plot((0:length(y_down)-1)/Fs_down, y_down);
subplot(3,2,4);
   y_fft_ds = fftshift(fft(y_down));
   plot(linspace(-Fs_down/2,Fs_down/2,length(y_down)), abs(y_fft_ds));

% Downsampling with Chebyshev Type I anti-alias filter
[b,a] = cheby1(5,1,0.45);       % 5th order, 1 dB ripple, 0.45·π rad cutoff
y_filt_ds = filter(b, a, downsample(y,D));
subplot(3,2,5); plot((0:length(y_filt_ds)-1)/Fs_down, y_filt_ds);
subplot(3,2,6);
   y_fft_filt = fftshift(fft(y_filt_ds));
   plot(linspace(-Fs_down/2,Fs, length(y_filt_ds)), abs(y_fft_filt));


* **`cheby1(5,1,0.45)`** designs a low-pass filter to remove frequencies above 0.45·(Fs/2), mitigating aliasing.
* Playback commands (`sound`) and `pause(9)` let you listen to each version for 9 seconds.

## License

MIT License © 2025
See [LICENSE](LICENSE) for details.

## Author

Your Name – [your.email@example.com](mailto:your.email@example.com)
Repository created: May 27, 2025


