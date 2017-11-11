%% Übung 1 - Signaltheorie
% Derya Uyargil, Moritz Höwer
% 26.10.2017

%% Aufgabe 3  - Verzerrung und Echo

% Parameter
Typ = 2
D = 20

% Datei einlesen und in in Monosignal umwandeln
[y_in, fS] = audioread('GitRiff02.wav');
y_in = (y_in(:,1) + y_in(:,2)) / 2;

% Apply distortion
y_out = GuitarDistortion(y_in, Typ, D);

% Plot distortion functions
x = linspace(-1, 1, 100);
dist1 = GuitarDistortion(x, 1, D);
dist2 = GuitarDistortion(x, 2, D);

subplot(1, 2, 1);
plot(dist1, x);
title (strcat('tanh - Verzerrer mit D=', int2str(D)));
grid on;

subplot(1, 2, 2);
plot(dist2, x);
title (strcat('Bendiksen - Verzerrer mit D=', int2str(D)));
grid on;


% Signal normieren
addpath ../lib; % load normalize function from our library
y_out = normalize(y_out);
rmpath ../lib;

% Ausgabe
sound(y_out, fS);