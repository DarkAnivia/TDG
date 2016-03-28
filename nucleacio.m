function y = nucleacio(T)
%Rati de nucleaci� a un instant T
%I0 constatn
% E Energia activaci�
% T Temp a la que es nuclea
% Kb Cte Boltzman

global I0 E
R = 8.3;
y=I0*exp(-E./(T.*R));
end