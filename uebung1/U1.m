%% Übung 1 - Signaltheorie
% Derya Uyargil, Moritz Höwer
% 26.10.2017

%% Aufgabe 1  - Mittelwert über n Werte

% Parameter
k = 250

% Datei einlesen und in in Monosignal umwandeln
[y_in, fS] = audioread('sprech.wav');
y_in = (y_in(:,1) + y_in(:,2)) / 2;

% Moving average filter anwenden
y_out = movmean(y_in, k);

% Plot signals
subplot(2, 1, 1);
plot(y_in);
title ('Original');
xlabel 'Samples';

subplot(2, 1, 2);
plot(y_out);
title (strcat('Gefiltert mit k=', int2str(k)));
xlabel 'Samples';

% Signale normieren
addpath ../lib; % load normalize function from our library
y_in = normalize(y_in);
y_out = normalize(y_out);
rmpath ../lib;

% Ausgabe
sound(y_in, fS);
pause
sound(y_out, fS);

% Zusatzaufgaben
[samples, channels] = size(y_in)
samplerate = fS