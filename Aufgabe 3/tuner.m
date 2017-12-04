%Eingangsaudio laden
[y_git_tone, fS_git_tone] = audioread('guitar_tone.wav');

%Bestimmung Filesize
sFileSize = size(y_git_tone,1)

%Bestimmung der Messzeit
T = sFileSize/fS_git_tone

%Bestimmung der Frequenzauflösung der FFT
DeltaF = 1/T;

%Anlegen des Frequenzvektors
fVek = DeltaF:DeltaF:fS_git_tone;

%Audioausgabe
sound(y_git_tone, fS_git_tone);

%FFT durchfuehren
sFFT = fft(y_git_tone);

%Signal plotten
subplot(3,1,1),
stem(y_git_tone);
title('Signal');

subplot(3,1,2),
stem(real(sFFT));
title('Realteil nach FFT');

%Absolutwert der FFT plotten
subplot(3,1,3);
stem(fVek,abs(sFFT));
%stem(abs(sFFT));
title('Absolutwerte nach FFT');
