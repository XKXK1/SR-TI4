function y = GuitarDistortion (x, Typ, D)
  if (Typ == 1)
    % tangens hyperbolicus
    y = tanh(D * x);
  elseif (Typ == 2)
    z = D * x;
    y = sign(z) .* (1 - exp(-z .* sign(z)));
  endif
end