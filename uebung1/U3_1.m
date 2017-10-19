%% Aufgabe 3  - Verzerrung und Echo

% Parameter
k = 10
Delay = 6000
Feedback = 0.35

% Datei einlesen und in in Monosignal umwandeln
[y_in fS] = audioread("GitRiff02.wav");
y_in = (y_in(:,1) + y_in(:,2)) / 2;
y_in = normalize(y_in);

% Request memory for filtered signal
y_in_delay = zeros(size(y_in));
y_out = zeros(size(y_in));

y_in_delay = vertcat(zeros(Delay, 1), y_in(1:(end-Delay)));
y_out = y_in .+ (Feedback * y_in_delay);

% Signal normieren
y_out = normalize(y_out);

% Ausgabe
sound(y_out, fS);