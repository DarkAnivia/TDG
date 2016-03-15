function y = nucleacio(I0,E,T)
%Rati de nucleació a un instant T
%I0 constatn
% E Energia activació
% T Temp a la que es nuclea
% Kb Cte Boltzman
Kb = 1.38064852e-23;
y=I0*exp(-E/(T*Kb));
end