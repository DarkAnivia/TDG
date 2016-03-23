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
I0 = 1;
E = 206950;
Beta = 0.16;
T0 = 234;
DT = 0.01;
C = 0.1;
D = 17;
alpha = 0.78;
tol = 0.1;
tau0 = exp(-19.36);


Resultat = fracbulk(I0,E,Beta,T0,DT,C,D,alpha,tol,tau0 );

scatter(Resultat(1:length(Resultat),2),Resultat(1:length(Resultat),1));


end