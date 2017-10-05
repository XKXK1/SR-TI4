%k soll entweder 10,50,250
k = 10;

%file definieren
file = 'sprech.wav'

%ausgabe der filegroesse
size(file)

%lesen des files in ein array
%y = sampledata 
%Fs = samplerate
[y,Fs] = audioread(file);

%nur positive werte des arrays (>=1)
positive = y(y>=1);

%mittelwert über k letzten werte
avg = mean(positive((end-k):end))


%abspielen der ungefilterten datei
sound(y,Fs)

%abspielen der gefilterten datei
sound(positive, Fs)

%info inkl. samplerate
auioinfo(file)