%% Übung 1 - Signaltheorie
% Derya Uyargil, Moritz Höwer
% 26.10.2017

%% Aufgabe 3  - Verzerrung und Echo

% Parameter
Delay = 4000
Feedback = 0.35

% Datei einlesen und in in Monosignal umwandeln
[y_in, fS] = audioread('GitRiff01.wav');
y_in = (y_in(:,1) + y_in(:,2)) / 2;

% Filtere signal
y_in_delay = vertcat(zeros(Delay, 1), y_in(1:(end-Delay)));
y_out = y_in + (Feedback * y_in_delay);

% Signal normieren
addpath ../lib; % load normalize function from our library
y_out = normalize(y_out);
rmpath ../lib;

% Ausgabe
sound(y_out, fS);