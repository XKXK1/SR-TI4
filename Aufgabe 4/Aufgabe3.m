[signal_1, f_Sample] = audioread('GitRiff_880Hz.wav');

%Filter auswaehlen
Hd = notch_filter;
signal_2 = filter(Hd, signal_1);

%normieren
signal_1= signal_1/max(abs(signal_1));
signal_2= signal_2/max(abs(signal_2));

%plotten
plot(signal_1)
sound(signal_1,f_Sample);
pause;
sound(signal_2,f_Sample);
plot(signal_2);
