function y_out = movmean( y_in, k )
% Rechnet einen moving average aus
% 
% y_in - Eingangsvektor
% k    - Breite des Fensters für den moving average

a = 1;
b = repmat(1/k, 1, k);
y_out = filter(b, a, y_in);
end

