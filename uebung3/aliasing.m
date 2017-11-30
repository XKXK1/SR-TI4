%% 3.1 - Aliasing
% 

%%
% Parameter
FsVec = [10000 6000];
FreqVec = [500 : 500 : 4500];

for Fs = FsVec
  %%
  % Calculations
  Ts = 1 / Fs;
  t = 0 : Ts : 0.5;

  %%
  % Build signal
  signal = zeros();
  for f = FreqVec
    w = 2*pi*f;
    signal = [signal cos(w * t)];
  end

  %%
  % Play signal
  pause;
  soundsc(signal, Fs);
end