
%Eingangsaudio laden
[y_GitMelody, fS_gitMelody] = audioread('GuitarMelody.wav');
%StossAntwort laden
[y_TrigRoom, fs_freqTrig] = audioread('TrigRoom2.wav');

%samplerate der geringeren Samplerate anpassen indem decimate die frequenz
%um den Faktor 2 Verringert
y_GitMelody = decimate(y_GitMelody,2);
 
%Groeﬂe der Dateien bestimmen
FileSizeGit = size(y_GitMelody,1);
FileSizeTrig = size(y_TrigRoom,1);

%Normieren
y_TrigRoom = normalize(y_TrigRoom);
 
%V2 Faltung mit eigener Funktion
y_TrigRoom = MyConv(y_GitMelody, y_TrigRoom);

%V2 Faltung mit Matlab Funktion
y_TrigRoom2 = conv(y_GitMelody, y_TrigRoom);
 
sound(y_GitMelody, fs_freqTrig);
pause;
sound(y_TrigRoom, fs_freqTrig);
pause;

