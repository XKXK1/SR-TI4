function y = GuitarDistortion (x, Typ, D)
% Wendet eine Verzerrungsfunktion an:
% 
% x   - Eingabe
% Typ - Verzerrungstyp
%         Typ = 1...Tangens hyperbolicus
%         Typ = 2...Bendikson
% D   - Verzerrungsmaﬂ
%

  if (Typ == 1)
    y = tanh(D * x);
  elseif (Typ == 2)
    z = D * x;
    y = sign(z) .* (1 - exp(-z .* sign(z)));
  end
end