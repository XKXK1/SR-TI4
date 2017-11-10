function v = MyConv(u,h)
 v = zeros(1,length(u)+length(h)-1);

 for i = 1:length(u)+length(h)-1

   for j = max(1,i+1-length(h)):min(i,length(u))
     v(i) = v(i) + u(j)*h(i+1-j);

   end
 end 


