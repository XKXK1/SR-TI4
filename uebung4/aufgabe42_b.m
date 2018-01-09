%%
% Aufgabe 4.1 - b
% Moritz Höwer

%%
% Settings
select = 4;

%%
% Read/Generate signal
if(select == 1)
    [signal, fS] = audioread('ACDClike.wav');
elseif(select == 2)
    % Chirp Signal erzeugen
    % Chirp-Parameter
    tStart = 0; fStart = 50;
    tStop = 5; fStop = 5000;
    fS = 44100; TSample = 1 / fS;
    % ----------------------------------------
    t = tStart:TSample:tStop;
    signal = chirp(t, fStart, tStop, fStop, 'logarithmic');
elseif(select == 3)
    fS = 44100;
    size = fS * 5;
    signal = rand(1, size);
elseif(select == 4)
     fS = 44100;
     tPulse = -0.5/20:1/fS:0.5/20;
     p = rectpuls(tPulse, 5e-3);
     t = 0:1/fS:5;
     signal = repmat(p, 1, ceil(length(t) / length(p)));
     signal = signal(1:length(t));
end

%%
% Filter
filterred = sosfilt(lowpass_iir, signal);


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