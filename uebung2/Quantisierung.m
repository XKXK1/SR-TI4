%% Quantisierung
%

%%
% Configuration
clear;
Qsteps = [10 20 50 100 200 500];
%Qsteps = [10 200];
plottingInterval = 15000:15400;

%%
% Load the audio file
[signal, fSignal] = audioread("GuitarMelody.wav");
%[signal, fSignal] = audioread("../uebung1/GitRiff01.wav");
%[signal, fSignal] = audioread("../uebung1/GitRiff02.wav");
%[signal, fSignal] = audioread("../uebung1/Sprech.wav");

%%
% Ensure signal is mono
signal = makeMono(signal);

%%
% Ensure signal is column vector
signal = toColumnVector(signal);

%%
% normalize
addpath ../lib; % load normalize function from our library
signal = normalize(signal);
rmpath ../lib;

%%
% Apply quantisations
n = length(Qsteps);

for i = 1:n
  result(i,:) = round(signal * Qsteps(i)) / Qsteps(i);
endfor

%%
% Plot
for i = 1:n
  subplot(n, 2, i*2-1);
  plot(plottingInterval, signal(plottingInterval), 'b', plottingInterval, result(i,plottingInterval), 'r');
  title(strcat('Signals with Qsteps=', int2str(Qsteps(i))));
  
  error = signal - result(i,:);
  maxError = max(abs(error(plottingInterval)))
  
  subplot(n, 2, i*2);
  plot(plottingInterval, error(plottingInterval), 'k');  
  title(strcat('Error - Maximum=', num2str(maxError)));
  axis([-inf, inf, -0.05 0.05]);
endfor
shg;

%%
% Play sound
for i = 1:n
  disp(strcat('Playing sound for Qsteps=', int2str(Qsteps(i))));
  soundsc(result(i,:), fSignal);
endfor
