function out = makeMono(in)
  %%
  % ensures that in is a mono signal
  out = zeros(size(in, 1), 1);
  for i = 1:size(in, 2)
    out = out + in(:,i);
  end
  out = out / size(in, 2);
end