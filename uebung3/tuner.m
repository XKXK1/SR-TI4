%% 3.4 - Tuner
%

%%
% Read Signal
[signal, fS] = audioread('guitar_tone.wav');

%%
% Calculations
T = length(signal) / fS;
DeltaF = 1 / T;
fVec = [0 : DeltaF : fS](1:end-1);

%%
% Play file
soundsc(signal, fS);

%%
% Perform FFT
C = fft(signal) / length(signal);

%%
% approximate Frequency
[peaks, indices]=findpeaks(abs(C)(1:length(C) / 2));
deltas = diff(indices);
filteredDeltas = deltas(abs(deltas - median(deltas)) < 10 );

f0 = mean(filteredDeltas) * DeltaF;

% http://pianotip.de/frequenz.html 


%%
% Plots
subplot(2, 1, 1);
plot(signal);
title('Signal');

subplot(2, 1, 2);
semilogy(fVec, abs(C), 'b');
title(strcat('FFT (up to 5.5 kHz) - f_0 = ', num2str(f0)));
axis([0 5500 -inf inf]);