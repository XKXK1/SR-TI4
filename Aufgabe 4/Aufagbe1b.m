Select = 2;
f_Sample = 44100;

if Select == 1
    %Einlesen der Samples
    [signal_1, f_Sample] = audioread('ACDClike.wav');
elseif Select == 2
    %chirp-Signal (44.1kHz Samplerate, 0…5s, 50 …5000 Hz) 
    t = 0 : 1/f_Sample :5; 
    signal_1 = chirp(t,50,5,5000);
elseif Select == 3
    %5s Rauschen (Befehl „rand(…)“ mit 44.1 kHz)
     t = 0 : 1/f_Sample :5;
     signal_1 = rand(size(t));
elseif Select == 4
    %Rechteckimpulsfolge 
    
    % 44,1kHz sample freq für 1s
    t = 0 : 1/f_Sample :1;  
    
    % 20 Hz Wiederholrate für 1s  
    d= 0 : 1/20 : 1;  
    
    % Rect der Breite 5ms
    signal_1 = pulstran(t,d, 'rectpuls', 0.005);  
end
        
% Anwenden des FIR Filters
Hd = lowpass_hamming_filter;
s2 = filter(Hd, signal_1);

%Normieren
signal_1= signal_1/max(abs(signal_1));
s2= s2/max(abs(s2));

plot(s2); 
sound(signal_1,f_Sample);
pause;
sound(s2,f_Sample);

