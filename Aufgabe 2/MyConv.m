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
%v(n) = u(1)*h(n)+u(2)*h(n-1)+ ... +u(n)*h(1)
%...
%v(2*n-1) = u(n)*v(n)

function v = MyConv(u,h)
 v = zeros(1,length(u)+length(h)-1);

 for i = 1:length(u)+length(h)-1
    
   for j = max(1,i+1-length(h)):min(i,length(u))
     v(i) = v(i) + u(j)*h(i+1-j);

   end
 end 


