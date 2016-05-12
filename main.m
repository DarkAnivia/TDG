function main
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
%A area mostra nm^2
%d0 gruix mostra nm
%densitat densitat g/nm^3
%entalpia entalpia J/g

clear all;
close all;



global I0 E Beta T0 DT C D alpha tol tau0 Ti r0 d0 A densitat entalpia;

fitxerBeta='Beta 01667.txt';
savefile_para='Test_Main.txt';
%%savefile_para='Bulk_I010-21.7_B23000.txt';  

T0 = 234;
C = 0.1;
tau0 = 10^(-19.36);
D = 17;
alpha = 0.78;
Beta = load(fitxerBeta);
DT = 0.1;
I0 = 10^21.7;
E = 206950;
tol = 1E-5;
Ti= 300;
r0 = 0;
d0=4200;
A=1E12;
densitat = 1.32E-21;
entalpia = 34.5;

fi=fopen(savefile_para, 'w');
%Totes les variables per enregistrar es poden descomentar. Per analisi
%molesten
%%fprintf(fi, 'Ti: %4.1f\t temperatura incial proces (Kelvin)\n', T0);
%fprintf(fi, 'T0: %4.1f\t temperatura vidre (Kelvin)\n', T0);
%fprintf(fi, 'C: %5.2f\t constante de velocidad del frente\n', C);
%fprintf(fi, 'tau0: %5.2f\t Constante para calculo de tau\n', tau0);
%fprintf(fi, 'D: %5.2f\t constante para calculo de tau\n', D);
%fprintf(fi, 'alpha: %5.2f\t coeficiente para calculo velocidad frente \n', alpha);
%%fprintf(fi, 'Beta: %5.2f\t ratio de calentamiento (K/s)\n', Beta);
%fprintf(fi, 'DT: %4.1f\t incremento de temperatura en cada paso de integrla (K)\n', DT);
%fprintf(fi, 'I0: %5.2f\t nucleació \n', I0);
%fprintf(fi, 'E: %5.2f\t Energia de activació (Jouls/mol)\n',E);
%fprintf(fi, 'tol: %5.5f tolerància \n', tol);
%fprintf(fi, 'r0: %f Radi Inicial \n', r0);
%fprintf(fi, '\n\n\n\n');
fprintf(fi, ' T \t Volum \t fracció \t Dx/DT\t CpSpecific\n');
fclose(fi);
%% pte poenr todo ben


Resultat = VolumTransformat();

fi = fopen(savefile_para, 'a');

for i=1:length(Resultat)
    fprintf(fi, '%f\t %f\t %f\t %f\n', Resultat(i,1),Resultat(i,2),Resultat(i,3),Resultat(i,4),Resultat(i,5));
end
fclose(fi);



scatter(Resultat(1:length(Resultat),1),Resultat(1:length(Resultat),5));
%scatter(Resultat(1:length(Resultat),1),Resultat(1:length(Resultat),2));



end