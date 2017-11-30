%% 3.3 - Untersuchungen
%

%%
% Parameters
M = 256; % Number of samples
FVec = [15.0, 50.0, 15.0, 15.25, 15.5]; % cosine signal frequencies

for F = FVec
  %%
  % Generate signal
  t = 0 : M - 1;
  x = cos(2*pi*F*t/M); 

  %%
  % Perform FT
  X = fft(x); 
  X = X / length(X);

  %%
  % plot Real / Imaginary
  subplot(3, 1, 1);
  plot(t, real(X), 'bx', t, real(X), 'b');
  title(strcat('Real (F=', num2str(F), ')'));
  axis([0 256 -inf inf]);

  subplot(3, 1, 2);
  plot(t, imag(X), 'bx', t, imag(X), 'b');
  title(strcat('Imag (F=', num2str(F), ')'));
  axis([0 256 -inf inf]);

  subplot(3, 1, 3);
  plot(t, abs(X), 'bx', t, abs(X), 'b');
  title(strcat('Abs (F=', num2str(F), ')'));
  axis([0 256 -inf inf]);
  
  pause;
end