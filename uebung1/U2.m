%% Übung 1 - Signaltheorie
% Derya Uyargil, Moritz Höwer
% 26.10.2017

%% Aufgabe 2  - Mittelwert ueber ein Chirp-Signal

% Parameter
k = 250

% Chirp Signal erzeugen
% Chirp-Parameter
tStart = 0; fStart = 10;
tStop = 5; fStop = 5000;
FSample = 1e4; TSample = 1 / FSample;
% ----------------------------------------
t = tStart:TSample:tStop;
y_in = chirp(t, fStart, tStop, fStop, 'logarithmic');


% Moving average Filter ausführen
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
y_in = normalize(y_in);
y_out = normalize(y_out);

% Ausgabe
sound(y_in, fS);
pause
sound(y_out, fS);

% Zusatzaufgaben
[channels, samples] = size(y_in)
samplerate = FSample