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
samplerate = FSample