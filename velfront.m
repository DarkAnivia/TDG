function y = velfront(T)
%Velocitat del front transformant la mostra
%C es relaciona amb la estabilitat 
%alpha es constant i té a veure amb el pendent de la figura3 del 2n paper
global C alpha;

y = C*Tau(T).^(-alpha);
end
