Fs = 6000; %Abtastfrequenz
Ts = 1/Fs;   %Abstastintervall
t = 0: Ts: 0.5; % 0.5s Signalabschnitt
x = [];


for FreqVec = [500 1000 1500 2000 2500 3000 3500 4000 4500]
tmp = sin(2*pi*FreqVec*t);
x = [x tmp];  
end

sound(x,Fs);

plot(x);


