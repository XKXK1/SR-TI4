%%
% Aufgabe 4.1 - b
% Moritz Höwer

%%
% read signal
[signal, fS] = audioread('GitRiff_880Hz.wav');

%%
% Filter
filterred = filter(notch_num, notch_den, signal);


%%
% FFT for signal
signalF = abs(fft(signal) / length(signal));
filterredF = abs(fft(filterred) / length(signal));

T = length(signal) / fS;
t = linspace(0, T, length(signal));
DeltaF = 1 / T;
fVec = 0 : DeltaF : fS;
fVec = fVec(1:end-1);


%%
% Plot signal
subplot(2,1,1);
plot(t, signal, 'b', t, filterred, 'r');
title('Time');
legend('Original', 'Filterred');

subplot(2,1,2);
semilogy(fVec, signalF, 'b', fVec, filterredF, 'r');
title('Frequency');
legend('Original', 'Filterred');
axis([0 3000 -inf inf]);

%%
% Play signal
soundsc(signal, fS);
pause
soundsc(filterred, fS);