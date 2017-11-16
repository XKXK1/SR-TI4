%A convolution is an integral that expresses the amount of overlap of 
%one function u as it is shifted over another function h. 
%It therefore "blends" one function with another. 
%Quelle: http://mathworld.wolfram.com/Convolution.html

%The sum is over all the values of j that lead to legal subscripts 
%for u(j) and h(k-j+1), specifically j = max(1,i+1-length(h)):1:min(i,length(u)). 
%When length(h) = length(u), this gives

%v(1) = u(1)*h(1)
%v(2) = u(1)*h(2)+u(2)*h(1)
%v(3) = u(1)*h(3)+u(2)*h(2)+u(3)*h(1)
%...
%v(n) = u(1)*h(length(h))+u(2)*h(length(h)-1)+ ... +u(length(h))*h(1)
%...
%v(2*length(h)-1) = u(length(h))*v(length(h))

function v = MyConv(u,h)
 v = zeros(1,length(u)+length(h)-1);

 for i = 1:length(u)+length(h)-1
    
   for j = max(1,i+1-length(h)):min(i,length(u))
     v(i) = v(i) + u(j)*h(i+1-j);

   end
 end 


