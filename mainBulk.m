function mainBulk
%autoejecución para sólo Vbulk

%I0 contant nucleació
%E Energia activació (J/mols)
%Beta ratio de calentamiento (K/s)-->passa a ser una càrrega desde arxiu
%T0: temperatura incial (Kelvin)
%DT incremento de temperatura en cada paso de integral (K)
%C constante de velocidad del frente
%D constante para calculo de tau
%alpha coeficiente para calculo velocidad frente 
%tol tolerancia, quant a prop del volum complet volem estar
%tau0 Constante para calculo de tau
%r0 Radi inicial (nm)


clear all;
close all;

%Recrdar que en el fracbulk hay una multiplicación para poder comparar


global I0 E Beta T0 DT C D alpha tol tau0 Ti r0 entalpia;

fitxerBeta='Beta0167.txt';
%fitxerBeta='Beta25K.txt';
%fitxerBeta='BetaSmooth25000.txt';
%savefile_para='B01667Bulk.txt';
savefile_para='Betavariable00167.txt';  

T0 = 234;
C = 0.1;
tau0 = 10^(-19.36);
D = 17;
alpha = 0.78;
Beta = load(fitxerBeta);
entalpia = 34.5;
DT = 0.1;
I0 = 10^21.7;  %primera I0 calculada en base a 1a aprox
%I0 = 10^21.15;
E = 206950;
tol = 1E-3;
Ti= 320;
r0 = 0;
%I0 = 10^11.0;   
%E = 140000;

I0 = 10^32.0;   
E = 275000;

fi=fopen(savefile_para, 'w');
%fprintf(fi, 'Ti: %4.1f\t temperatura incial proces (Kelvin)\n', T0);
%fprintf(fi, 'T0: %4.1f\t temperatura vidre (Kelvin)\n', T0);
%fprintf(fi, 'C: %5.2f\t constante de velocidad del frente\n', C);
%fprintf(fi, 'tau0: %5.2f\t Constante para calculo de tau\n', tau0);
%fprintf(fi, 'D: %5.2f\t constante para calculo de tau\n', D);
%fprintf(fi, 'alpha: %5.2f\t coeficiente para calculo velocidad frente \n', alpha);
%%%fprintf(fi, 'Beta: %5.2f\t ratio de calentamiento (K/s)\n', Beta);
%fprintf(fi, 'DT: %4.1f\t incremento de temperatura en cada paso de integrla (K)\n', DT);
%fprintf(fi, 'I0: %5.2f\t nucleació \n', I0);
%fprintf(fi, 'E: %5.2f\t Energia de activació (Jouls/mol)\n',E);
%fprintf(fi, 'tol: %5.5f tolerància \n', tol);
%fprintf(fi, 'r0: %f Radi Inicial \n', r0);
%fprintf(fi, '\n\n\n\n');
fprintf(fi, ' T \t frac ext\t frac \t Dx/DT\t Cp  \t Beta\n');
fclose(fi);



Resultat = fracbulk();

fi = fopen(savefile_para, 'a');

for i=1:length(Resultat)
    fprintf(fi, '%f\t %f\t %f\t %f\t %f\t %f\n', Resultat(i,1),Resultat(i,2),Resultat(i,3),Resultat(i,4),Resultat(i,5),Resultat(i,6));
end
fclose(fi);

i=1;


%scatter(Resultat(i:length(Resultat),1),Resultat(i:length(Resultat),3));
scatter(Resultat(i:length(Resultat),1),Resultat(i:length(Resultat),4));



end