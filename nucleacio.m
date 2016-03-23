function y = nucleacio(I0,E,T)
%Rati de nucleaci� a un instant T
%I0 constatn
% E Energia activaci�
% T Temp a la que es nuclea
% Kb Cte Boltzman
R = 8.3;
y=I0*exp(-E/(T*R));
end