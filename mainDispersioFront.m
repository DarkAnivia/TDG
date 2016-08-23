function mainDispersioFront
%autoejecuci�n para s�lo Vfront
%T0: temperatura incial (Kelvin)
%A area de la muestra (nm^2)
%C constante de velocidad del frente
%tau0 Constante para calculo de tau
%D constante para calculo de tau
%alpha coeficiente para calculo velocidad frente 
%Beta ratio de calentamiento (K/s)
%DT incremento de temperatura en cada paso de integrla (K)
%d0 grueso de la muestra (nm)
%Ti Temperatura inicial proceso (K)
%m0 = massa de la mostra
%sigma : dispersio gaussiana
%promig: valor m�s probable gaussiana
%tol tolerancia

clear all

global T0 A C tau0 D alpha Beta DT d0 Ti m0 promig sigma tol DP entalpia;

DP=0.1;

fitxerBeta='Beta0167.txt';

savefile_para='cTestDispersio.txt';
%savefile_para='Dispersio Gausiana c .txt';
tol = 0.01;
T0 = 234;
A = 1;
C = 0.1;
tau0 = 10^(-19.36);
D = 17;
alpha = 0.78;
Beta = load(fitxerBeta);
entalpia = 34.5;
DT = 0.1;
d0 = 200;
Ti = 300;
m0 = 0;
promig = 278;
sigma = 10;


fi=fopen(savefile_para, 'w');
% fprintf(fi, 'T0: %4.1f temperatura vidre (kelvin)\n', T0);
% fprintf(fi, 'Ti: %4.1f\t temperatura incial proces (Kelvin)\n', Ti);
% fprintf(fi, 'A: %5.0f\t area de la muestra (nm^2)\n', A);
% fprintf(fi, 'C: %5.2f\t constante de velocidad del frente\n', C);
% fprintf(fi, 'tau0: %5.2f\t Constante para calculo de tau\n', tau0);
% fprintf(fi, 'D: %5.2f\t constante para calculo de tau\n', D);
% fprintf(fi, 'alpha: %5.2f\t coeficiente para calculo velocidad frente \n', alpha);
% %%fprintf(fi, 'Beta: %5.2f\t ratio de calentamiento (K/s)\n', Beta);
% fprintf(fi, 'DT: %4.1f\t incremento de temperatura en cada paso de integrla (K)\n', DT);
% fprintf(fi, 'd0: %5.2f\t grueso de la muestra (nm)\n', d0);
% fprintf(fi, '\n\n\n\n');
fprintf(fi, 'T\t Dist Front \t Frac ext \t Dx/DT \t cp\n');
fclose(fi);


Resultat = DispersioVfrontp();

fi = fopen(savefile_para, 'a');

for i=1:length(Resultat)
    fprintf(fi, '%f\t %f\t %f\t %f\t %f\n', Resultat(i,1),Resultat(i,2),Resultat(i,3), Resultat(i,4),  Resultat(i,5));
end
fclose(fi);


%scatter(Resultat(1:length(Resultat),1),Resultat(1:length(Resultat),2));
scatter(Resultat(1:length(Resultat),1),Resultat(1:length(Resultat),4));
%scatter(Resultat(i:length(Resultat),1),Resultat(i:length(Resultat),5));

end

