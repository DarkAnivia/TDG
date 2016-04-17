function mainBulk
%autoejecución para sólo Vbulk
%I0 contant nucleació
%E Energia activació (J/mols)
%Beta ratio de calentamiento (K/s)
%T0: temperatura incial (Kelvin)
%DT incremento de temperatura en cada paso de integral (K)
%C constante de velocidad del frente
%D constante para calculo de tau
%alpha coeficiente para calculo velocidad frente 
%tol tolerancia, quant a prop del volum complet volem estar
%tau0 Constante para calculo de tau

clear all;
close all;


%con beta 0.1667 I0 = 10^21.7
% con beta 90 I0 = 10^23.1
%con beta 1500 I0 = 10^22.7
%con beta 23000 I0 = 10^23.8

global I0 E Beta T0 DT C D alpha tol tau0 Ti;


%%savefile_para='Test_Bulk.txt';
savefile_para='Bulk_I010-21.7_B23000.txt';  

T0 = 234;
C = 0.1;
tau0 = 10^(-19.36);
D = 17;
alpha = 0.78;
Beta = 23000;
DT = 0.1;
I0 = 10^21.7;
E = 206950;
tol = 0.001;
Ti= 300;


fi=fopen(savefile_para, 'w');
fprintf(fi, 'Ti: %4.1f\t temperatura incial proces (Kelvin)\n', T0);
fprintf(fi, 'T0: %4.1f\t temperatura vidre (Kelvin)\n', T0);
fprintf(fi, 'C: %5.2f\t constante de velocidad del frente\n', C);
fprintf(fi, 'tau0: %5.2f\t Constante para calculo de tau\n', tau0);
fprintf(fi, 'D: %5.2f\t constante para calculo de tau\n', D);
fprintf(fi, 'alpha: %5.2f\t coeficiente para calculo velocidad frente \n', alpha);
fprintf(fi, 'Beta: %5.2f\t ratio de calentamiento (K/s)\n', Beta);
fprintf(fi, 'DT: %4.1f\t incremento de temperatura en cada paso de integrla (K)\n', DT);
fprintf(fi, 'I0: %5.2f\t nucleació \n', I0);
fprintf(fi, 'E: %5.2f\t Energia de activació (Jouls/mol)\n',E);
fprintf(fi, 'tol: %5.5f tolerància \n', tol);
fprintf(fi, '\n\n\n\n');
fprintf(fi, ' T \t frac ext\t frac \t Dx/DT\n');
fclose(fi);



Resultat = fracbulk();

fi = fopen(savefile_para, 'a');

for i=1:length(Resultat)
    fprintf(fi, '%f\t %f\t %f\t %f\n', Resultat(i,1),Resultat(i,2),Resultat(i,3),Resultat(i,4));
end
fclose(fi);

i=1;
while ( Resultat(i,2)< 0.01 )
    i=i+1;
end
i=i-20;

%scatter(Resultat(i:length(Resultat),1),Resultat(i:length(Resultat),3));
scatter(Resultat(i:length(Resultat),1),Resultat(i:length(Resultat),4));



end