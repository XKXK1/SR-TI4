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

% find peaks
[peaks, indices]=findpeaks(abs(C)(1:length(C) / 2));

% find good deltas
deltas = diff(indices);
significantDeltas = abs(deltas - median(deltas)) < 20;

% take only those good deltas
filteredDeltas = deltas(significantDeltas);
filteredPeaks = indices(significantDeltas);

f0 = mean(filteredDeltas) * DeltaF;

% Find note by checking thios table: http://pianotip.de/frequenz.html 


%%
% Plots
subplot(2, 1, 1);
plot(signal);
title('Signal');

subplot(2, 1, 2);
semilogy(fVec, abs(C), 'b', filteredPeaks * DeltaF, abs(C)(filteredPeaks), 'rx');
title(strcat('FFT (up to 5.5 kHz) - f_0 = ', num2str(f0)));
legend('Frequencies', 'Filterred Peaks for Frequency calculation');
axis([0 5500 -inf inf]);