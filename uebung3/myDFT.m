function [a, b] = myDFT(signal)
  %%
  % Custom DFT function.
  %
  % Returns:
  % a - Coefficients for COS
  % b - Coefficients for SIN
  M = length(signal);
  
  a = zeros(1, M);
  b = zeros(1, M);
  
  interval = 0:(M-1);
  
  for k = interval
    % index in matlab starts at 1, so we need k+1
    a(k + 1) = 1/M * sum(signal .* cos(2 * pi * k / M * interval));
    b(k + 1) = 1/M * sum(signal .* sin(2 * pi * k / M * interval));
  end
end