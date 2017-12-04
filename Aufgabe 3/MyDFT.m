function [A, B] = MyDFT(s)

%Maxsize berechnen
Max=max(size(s));

%Vorinitialisieren von Realteil und Imaginaerteil
A=zeros(Max,1);
B=zeros(Max,1);

%Dft berechnen mit der Formel fuer Real- und Imaginaerteil
for i=1:Max
    for n=0:Max-1
        A(i)=A(i)+s(n+1)*cos(2*pi*i*n/Max);
        B(i)=B(i)-s(n+1)*sin(2*pi*i*n/Max);
    end
    %normieren
    A(i)=A(i)/Max;
    B(i)=B(i)/Max;
end
return
end