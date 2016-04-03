function y = nucleacio(T)
%Rati de nucleació a un instant T
%I0 constatn
% E Energia activació
% T Temp a la que es nuclea
% Kb Cte Boltzman

global I0 E
R = 8.3;
y=I0*exp(-E./(T.*R));
end