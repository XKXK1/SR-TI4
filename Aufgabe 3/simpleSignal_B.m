%Eingangssignal
s=[1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  1 1 1 1 1 1 1 1 ];  

%DFT von Matlab
S=fft(s);

%Normieren
S= S/length(s);

%A = Realteil, B = Imaginaerteil
A1= real(S);
B1 = imag(S);

%Plots
figure
subplot(3,1,1);
stem(s)
title('Signal f�r fft')

subplot(3,1,2);
stem(A)
title('Realteil')

subplot(3,1,3);
stem(B)
title('Imagin�rteil');