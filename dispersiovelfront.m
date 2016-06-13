function y = dispersiovelfront(T)
%Velocitat del front transformant la mostra
%C es relaciona amb la estabilitat 
%alpha es constant i té a veure amb el pendent de la figura3 del 2n paper
global alpha;

y = Tau(T).^(-alpha);
end
