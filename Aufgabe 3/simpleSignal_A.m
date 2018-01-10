%Eingangssignal
s=[1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  1 1 1 1 1 1 1 1 ];
deltaf = 1/length(s);
f = (0:(length(s)-1))*deltaf;

%DFT mit eigener Function
[A,B]=MyDFT(s);

%Plots
figure
subplot(3,1,1);
stem(s)
title('Signal f�r MyDFT')

subplot(3,1,2);
stem(f,A)
title('A: Realteil')

subplot(3,1,3);
stem(f,B)
title('B: Imagin�rteil')