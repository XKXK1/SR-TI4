%Eingangsaudio laden
[y_GitRiff, fS_GitRiff] = audioread('GitRiff.wav');

%Normalisieren 
y_GitRiff = normalize(y_GitRiff);

for QSteps = [10 20 50 100 200 500]
    %Quantisierung
    q = round(y_GitRiff*QSteps);
    q = normalize(q);
    
    %Rauschen
    rausch = y_GitRiff-q;
    maxQuantFailure = max(abs(rausch));
    rausch = normalize(rausch);
    
    %Plots
    subplot(3,1,1),
    plot(y_GitRiff(15000:1:15400), 'b');
    title('Original' );
    xlabel 'Samples';
    axis([0 inf -1 1]);

    subplot(3,1,2),
    plot(q(15000:1:15400),'r');
    title(['Quantisiert bei QSteps:' num2str(QSteps)]);
    xlabel 'Samples';
    axis([0 inf -1 1]);

    subplot(3,1,3),
    plot(rausch(15000:1:15400),'m');
    title({['Quantisierungsfehler bei QSteps:' num2str(QSteps)] , [  ' Max. QuantisierungsFehler: ' num2str(maxQuantFailure)]});
    xlabel 'Samples';
    axis([0 inf -1 1]);
    pause;
    
    %sound(y_GitRiff, fS_GitRiff);
    %pause;
    %sound(q, fS_GitRiff);
    %pause;
end









