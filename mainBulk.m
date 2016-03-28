function mainBulk
%autoejecución para sólo Vbulk
%I0 contant nucleació
%E Energia activació (?¿)
%Beta ratio de calentamiento (K/s)
%T0: temperatura incial (Kelvin)
%DT incremento de temperatura en cada paso de integrla (K)
%C constante de velocidad del frente
%D constante para calculo de tau
%alpha coeficiente para calculo velocidad frente 
%tol tolerancia, quant a prop del volum complet volem estar
%tau0 Constante para calculo de tau

clear all

global I0 E Beta T0 DT C D alpha tol tau0;

T0 = 234;
C = 0.1;
tau0 = 10^(-19.36);
D = 17;
alpha = 0.78;
Beta = 0.16;
DT = 0.01;


I0 = 1;
E = 206950;
tol = 0.001;



Resultat = fracbulk();

scatter(Resultat(1:length(Resultat),2),Resultat(1:length(Resultat),3));


end