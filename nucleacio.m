function y = nucleacio(I0,E,T)
%Rati de nucleació a un instant T
%I0 constatn
% E Energia activació
% T Temp a la que es nuclea
% Kb Cte Boltzman
R = 8.3;
y=I0*exp(-E/(T*R));
end