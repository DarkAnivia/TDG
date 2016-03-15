function mainFront
%autoejecución para sólo Vfront
%T0: temperatura incial (Kelvin)
%A area de la muestra (nm^2)
%C constante de velocidad del frente
%tau0 Constante para calculo de tau
%D constante para calculo de tau
%alpha coeficiente para calculo velocidad frente 
%Beta ratio de calentamiento (K/s)
%DT incremento de temperatura en cada paso de integrla (K)
%d0 grueso de la muestra (nm)
T0 = 234;
A = 40000;
C = 0.1;
tau0 = exp(-19.36);
D = 17;
alpha = 0.78;
Beta = 0.16;
DT = 0.01;
d0 = 1500;


Resultat=Vfrontp(A,T0,C,tau0,D,alpha,Beta,DT,d0);
scatter(Resultat(1:length(Resultat),1),Resultat(1:length(Resultat),2));

end