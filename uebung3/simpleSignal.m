%% 3.2 - Simple Signal A
%

%%
% Parameter
s = [1 1 1 1  1 1 1 1  0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 0  1 1 1 1  1 1 1 1 ];

%%
% Calculation
[a,b] = myDFT(s);
c = fft(s);

% extrac coefficients from c
A = real(c);
B = imag(c);

% normalize
A = A / length(A);
B = B / length(B);


%%
% Plot Results
x = linspace(1, length(s), length(s));
subplot(3, 1, 1);
plot(x, s, 'bx', x, s, 'b');
title('Signal');

subplot(3, 1, 2);
plot(x, a ,'bx', x, A ,'r+', x, a, 'b', x, A, 'r');
title('Coeffs for COS: a');
legend('myDFT()', 'fft()');

subplot(3, 1, 3);
plot(x, b ,'bx', x, B ,'r+', x, b, 'b', x, B, 'r');
title('Coeffs for SIN: b');
legend('myDFT()', 'fft()');

pause;

%%
% Plot Diferences

subplot(2, 1, 1);
plot(a - A);
title(strcat('Diference between myDFT and fft for a: max=', num2str(max(abs(a-A)))));

subplot(2, 1, 2);
plot(b - B);
title(strcat('Diference between myDFT and fft for b max=', num2str(max(abs(b-B)))));
