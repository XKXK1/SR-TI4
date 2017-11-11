function out = makeMono(in)
  %%
  % ensures that in is a mono signal
  out = zeros(rows(in), 1);
  for i = 1:columns(in)
    out += in(:,i);
  endfor 
  out /= columns(in);
end