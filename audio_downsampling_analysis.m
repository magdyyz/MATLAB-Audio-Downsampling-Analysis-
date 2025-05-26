load handel;

t = (0:length(y)-1) / Fs;
figure;
subplot(3,2,1);
plot(t,y);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Audio Signal');

N = length(y);
frequencies = linspace(-Fs/2, Fs/2, N);
y_fft = fft(y);
y_fft2=fftshift(y_fft);
subplot(3,2,2);
plot(frequencies,abs(y_fft2));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum of Original Signal');
sound(y,Fs);
pause(9);
D=2;
y_downsampled = downsample(y, D);
Fs_downsampled = Fs / D;
t_downsampled = (0:length(y_downsampled)-1) / Fs_downsampled;
subplot(3, 2, 3);
plot(t_downsampled, y_downsampled);
xlabel('Time (s)');
ylabel('Amplitude');
title('Downsampled Audio (No Anti-aliasing)');

N_downsampled = length(y_downsampled);
frequencies_downsampled = linspace(-Fs_downsampled/2, Fs_downsampled/2, N_downsampled);
y_downsampled_fft = fft(y_downsampled);
y_downsampled_fft2=fftshift(y_downsampled_fft);
subplot(3, 2, 4);
plot(frequencies_downsampled,abs(y_downsampled_fft2));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum of Downsampled Signal (No Anti-aliasing)');
sound(y_downsampled,Fs_downsampled)
pause(9);
subplot(3, 2, 5);

y_downsampled_filtered = filter(cheby1(5, 1, 0.45), 1, downsample(y, D));
Fs_downsampled_filtered = Fs / D;
t_downsampled_filtered = (0:length(y_downsampled_filtered)-1) / Fs_downsampled_filtered;
plot(t_downsampled_filtered, y_downsampled_filtered);
xlabel('Time (s)');
ylabel('Amplitude');
title('Downsampled Audio (Anti-aliasing)');
sound(y_downsampled_filtered,Fs_downsampled_filtered);
subplot(3, 2, 6);
N_downsampled_filtered = length(y_downsampled_filtered);
frequencies_downsampled_filtered = linspace(-Fs_downsampled/2, Fs_downsampled, N_downsampled_filtered);
y_downsampled_filtered_fft = fft(y_downsampled_filtered);
y_downsampled_filtered_fft2=fftshift(y_downsampled_filtered_fft);

plot(frequencies_downsampled_filtered, abs(y_downsampled_filtered_fft2));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum of Downsampled Signal (Anti-aliasing)');