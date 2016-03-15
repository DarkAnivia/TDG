function y = velfront(C,tau0,D,T0, T,alpha)
%Velocitat del front transformant la mostra
%C es relaciona amb la estabilitat 
%alpha es constant i té a veure amb el pendent de la figura3 del 2n paper
y = C*Tau(tau0,D,T0,T)^(-alpha);
end
