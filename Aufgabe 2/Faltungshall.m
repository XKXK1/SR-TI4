%Eingangsaudio laden
[y_GitMelody, fS_gitMelody] = audioread('GuitarMelody.wav');
%StossAntwort laden
[y_TrigRoom, fs_freqTrig] = audioread('TrigRoom2.wav');

y_GitMelody = normalize(y_GitMelody);
y_TrigRoom = normalize(y_TrigRoom);

%samplerate der geringeren Samplerate anpassen indem decimate die frequenz
%um den Faktor 2 Verringert
y_GitMelody = decimate(y_GitMelody,2);
 
%Groeﬂe der Dateien bestimmen
FileSizeGit = size(y_GitMelody,1);
FileSizeTrig = size(y_TrigRoom,1);

tic
%V2 Faltung mit eigener Funktion
y_TrigRoom_conv = MyConv(y_GitMelody, y_TrigRoom);
timeForMyConv = toc;

tic
%V1 Faltung mit Matlab Funktion
y_TrigRoom2_conv = conv(y_GitMelody, y_TrigRoom);
timeForMatlabConv = toc;

y_TrigRoom_conv = normalize(y_TrigRoom_conv);
y_TrigRoom2_conv = normalize(y_TrigRoom2_conv);
 
%sound(y_GitMelody, fs_freqTrig);
%pause;
%sound(y_TrigRoom, fs_freqTrig);
%pause;

subplot(4, 1, 1)
plot(y_GitMelody)
title('GuitarOriginal')

subplot(4, 1, 2)
plot(y_TrigRoom)
title('Roomsound')

subplot(4, 1, 3)
plot(y_TrigRoom2_conv)
title('myconv')

subplot(4, 1, 4)
plot(y_TrigRoom_conv)
title('conv')


