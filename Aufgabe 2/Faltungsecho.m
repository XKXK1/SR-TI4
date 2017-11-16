%Eingangsaudio laden
[y_GitMelody, fS_gitMelody] = audioread('GuitarMelody.wav');

%Groeﬂe der Dateien bestimmen
FileSizeGit = size(y_GitMelody,1);

%normierung der eingansdatei
y_GitMelody = normalize(y_GitMelody);
 
%Echomatrix
Echo_matrix = [ 0.0 1.0; 0.3 0.3; 0.5 0.2; 0.7 0.1; 0.75 0.1];
 
%Groessenbestimmung des EchoVektors in diesem Fall 0.75 * Samplerate des
%Eingangsaudiosignals
Echo_size = fS_gitMelody * Echo_matrix(length(Echo_matrix));

%Speicher anlegen fuer den EchoVektor
y_Echo = zeros(Echo_size,1);
 
%erstellen der FaltungsMaske, round ist hier erforderlich, da sonst
%Dezimalzahlen als Index verwendet werden
%die Echo Matrix wird auf die dementsprechenden Stellen der FaltungsMaske
%gemapt
for i = 1 : length(Echo_matrix)
    y_Echo(round(Echo_matrix(i)*fS_gitMelody+1)) = Echo_matrix(i,2);
end

%Convolution Anwenden
y_GitMelody_conv = conv(y_GitMelody, y_Echo);

%Normieren des Faltungssignals
y_GitMelody_conv = normalize(y_GitMelody_conv);

%Normieren des Echos
y_Echo = normalize(y_Echo);
 
subplot(3, 1, 1)
plot(y_GitMelody)
title('GuitarOriginal')

subplot(3, 1, 2)
plot(y_Echo)
title('EchoMaske')

subplot(3, 1, 3)
plot(y_GitMelody_conv)
title('conv')

sound(y_GitMelody, fS_gitMelody);
pause;
sound(y_GitMelody_conv, fS_gitMelody);
