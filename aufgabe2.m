%laden des signal packages um chirp() benutzen zu koennen
pkg load signal

%k soll entweder 10,50,250

% Chirp-Parameter
tStart = 0; fStart = 10;
tStop = 5; fStop = 5000;
FSample = 1e4; TSample = 1 / FSample;
% ----------------------------------------
t = tStart:TSample:tStop;
y = chirp(t, fStart, tStop, fStop, 'logarithmic');

prompt = 'please enter value for k:'
k = input(prompt)


%ausgabe der filegroesse
[samples, channels] = size (y)


%stereo -> mono
%y = (y(:,1) + y(:,2))/2;

%filtern des signals
a=1;
b=(1/k)*ones(1,k);
filtered = filter(b,a,y);

%signalnormierung beider signale
y = y /max(abs(y));
filtered = filtered /max(abs(filtered));

subplot(2,1,2);
plot(filtered);
title('filtered signal')
subplot(2,1,1);
plot(y);
title('unfilterted signal')


%info inkl. samplerate
sound(y,FSample)

pause()

%abspielen der ungefilterten datei
sound(filtered,FSample)