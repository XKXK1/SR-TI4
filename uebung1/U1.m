%% Aufgabe 1  - Mittelwert ueber n Werte

% Parameter
k = 250

% Datei einlesen und in in Monosignal umwandeln
[y_in fS] = audioread("sprech.wav");
y_in = (y_in(:,1) + y_in(:,2)) / 2;

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

% Signale normieren
y_in = normalize(y_in);
y_out = normalize(y_out);

% Ausgabe
sound(y_in, fS);
pause
sound(y_out, fS);

% Zusatzaufgaben
[samples, channels] = size(y_in)
samplerate = fS