function y = nucleacio(I0,E,T,T0)
%Rati de nucleació a un instant T0 y T
%I0 constatn
% E Energia activació
% T Temp a la que es nuclea
% T Inicial a la qual volem saber la nucleació
% Kb Cte Boltzman
y=I0*exp(-E/(T*1.38064852e-23)-I0*exp(-E/(T0*1.38064852e-23);
end