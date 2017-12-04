M=256; % Number of samples
F=15.0; % cosine signal frequency 1) F= 15,50 2)F = 15,0, 15,25, 15,5.

t=0:M-1;
x=cos(2*pi*F*t/M);

xDFT= fft(x);

xDFT=xDFT/max(abs(xDFT));

%Plots
figure
subplot(4,1,1);
plot(x)
title('Cosine Signal')

subplot(4,1,2);
stem(real(xDFT))
title('Realteil')

subplot(4,1,3);
stem(imag(xDFT))
title('Imaginärteil');

subplot(4,1,4);
plot(abs(xDFT))
title('Absolutbetrag');