%% Faltungshall
% 

%%
% Laden der Dateien
[signal, fSignal] = audioread("GuitarMelody.wav");
%[signal, fSignal] = audioread("../uebung1/GitRiff01.wav");
%[signal, fSignal] = audioread("../uebung1/GitRiff02.wav");
%[signal, fSignal] = audioread("../uebung1/Sprech.wav");#

%[response, fResponse] = audioread("Church2.wav");
[response, fResponse] = audioread("InTheSilo2.wav");
%[response, fResponse] = audioread("TrigRoom2.wav");

%%
% Ensure signals are mono
signal = makeMono(signal);
response = makeMono(response);

%%
% Adjust samplerates so that they fit
if(fSignal > fResponse)
  signal = decimate(signal, (fSignal / fResponse));
  fSignal = fResponse;
endif
if(fResponse > fSignal)
  response = decimate(response, (fResponse / fSignal));
  fResponse = fSignal;
endif

%%
% Convolution
tic
result = MyConv(signal, response);
%result = conv(signal, response);
toc

fResult = fSignal;

%%
% Soundausabe
soundsc(signal, fSignal);
soundsc(result, fResult);