function out = toColumnVector(x)
  %% Converts x to a row vector (if it isn't one already) 
  if(!isvector(x))
    error('Argument must be a vector!');
  endif
  
  if(rows(x) != 1)
    % row vector
    % transpose it, so it becomes a column vector
    out = x';
   else
    out = x;
  endif
end