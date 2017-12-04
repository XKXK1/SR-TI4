%Eingangssignal
s=[1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  1 1 1 1 1 1 1 1 ];

%DFT mit eigener Function
[A,B]=MyDFT(s);

%Plots
figure
subplot(3,1,1);
stem(s)
title('Signal für MyDFT')

subplot(3,1,2);
stem(A)
title('A: Realteil')

subplot(3,1,3);
stem(B)
title('B: Imaginärteil')