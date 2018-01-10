function Hd = notch_filter
%NOTCH_FILTER Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.1 and the DSP System Toolbox 9.3.
% Generated on: 10-Jan-2018 10:53:17

% IIR Notching filter designed using the IIRNOTCH function.

% All frequency values are in Hz.
Fs = 4410;  % Sampling Frequency

Fnotch = 880;  % Notch Frequency
BW     = 100;  % Bandwidth
Apass  = 1;    % Bandwidth Attenuation

[b, a] = iirnotch(Fnotch/(Fs/2), BW/(Fs/2), Apass);
Hd     = dfilt.df2(b, a);

% [EOF]
