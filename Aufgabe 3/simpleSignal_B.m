%Eingangssignal
s=[1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  1 1 1 1 1 1 1 1 ];  

%DFT von Matlab
S=fft(s);

%Normieren
S= S/M;

%A = Realteil, B = Imaginaerteil
A= real(S);
B = imag(S);

%Plots
figure
subplot(3,1,1);
stem(s)
title('Signal für fft')

subplot(3,1,2);
stem(A)
title('Realteil')

subplot(3,1,3);
stem(B)
title('Imaginärteil');