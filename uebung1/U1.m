%% Aufgabe 1  - Mittelwert ueber n Werte

% Parameter
k = 250

% Datei einlesen und in in Monosignal umwandeln
[y_in fS] = audioread("sprech.wav");
y_in = (y_in(:,1) + y_in(:,2)) / 2;
y_in = y_in / max(abs(y_in));

% Request memory for filtered signal
y_out = zeros(size(y_in));

% Prepare parameters for filter
a = 1;
b = repmat(1/k, 1, k);
y_out = filter(b, a, y_in);

% Plot signals
subplot(2, 1, 1);
plot(y_in);
title ('Original');
xlabel 'Samples';

subplot(2, 1, 2);
plot(y_out);
title (strcat('Gefiltert mit k=', int2str(k)));
xlabel 'Samples';

% Ausgabe
sound(y_in, fS);
pause
sound(y_out, fS);

% Zusatzaufgaben
size_of_y = size(y_in)
samplerate = fS