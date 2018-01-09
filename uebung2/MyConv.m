function output = MyConv(a, b)
  %% Naive convolution function
  %  Assumes that the signals are periodic
  a = toColumnVector(a);
  b = toColumnVector(b);
  
  if(length(a) > length(b))
    long = a;
    short = b;
  else
    long = b;
    short = a;
  end
  
  % reserve space
  output = zeros(1, length(long));
  
  shortFlip = fliplr(short);
  
  n = length(short);
  for i = 1:length(long)
    if(i < n)
      % asume periodic signal and wrap around
      signal = [long(end-n+i+1:end) long(1:i)];
    else
      signal = long(i-n+1 : i);
    end
    signal = signal .* shortFlip;
    output(i) = sum(signal);
  end
 end