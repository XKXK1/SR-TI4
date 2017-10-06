%k soll entweder 10,50,250

prompt = 'please enter value for k:'
k = input(prompt)

%file definieren
file = 'sprech.wav'

%lesen des files in ein array
%y = sampledata 
%Fs = samplerate
[y,Fs] = audioread(file);

%ausgabe der filegroesse
[samples, channels] = size (y)


%stereo -> mono
y = (y(:,1) + y(:,2))/2;
a=1;
b=(1/k)*ones(1,k);
filtered = filter(b,a,y);

y = y /max(abs(y));
filtered = filtered /max(abs(filtered));

subplot(2,1,2);
plot(filtered);
title('filtered signal')
subplot(2,1,1);
plot(y);
title('unfilterted signal')


%info inkl. samplerate
sound(y,Fs)

pause()

%abspielen der ungefilterten datei
sound(filtered,Fs)