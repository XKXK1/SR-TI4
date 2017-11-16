%% Faltungsecho
%

%% 
% Konfiguration
% ----------------------------------
%      Position   Echo-
%        [sec]    hoehe
Echos = [ 0.0     1.0; ...
          0.3     0.3; ...
          0.5     0.2; ...
          0.7     0.1; ...
          0.75    0.1];
          
%%
% Load the audio file
%[signal, fSignal] = audioread('GuitarMelody.wav');
%[signal, fSignal] = audioread('../uebung1/GitRiff01.wav');
%[signal, fSignal] = audioread('../uebung1/GitRiff02.wav');
[signal, fSignal] = audioread('../uebung1/Sprech.wav');

%%
% Ensure signal is mono
signal = makeMono(signal);

%%
% Generate mask
maskLength = max(Echos(:, 1)) * fSignal + 1;
mask = zeros(1, maskLength);

for i = 1:size(Echos, 1)
  index = round(Echos(i,1) * fSignal + 1);
  mask(index) = Echos(i,2);
end

%%
% Convolution
result = conv(signal, mask);
fResult = fSignal;

%%
% Soundausabe
soundsc(signal, fSignal);
pause
soundsc(result, fResult);