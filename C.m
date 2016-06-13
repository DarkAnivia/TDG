function C = C(Tf)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

yo= -1.329;
A= 2.55e-6;
w=23.68;

C = 10^(yo+A*exp(Tf/w));
%C=10^( A*exp(Tf/w);



end

