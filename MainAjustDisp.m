function MainAjustDisp
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


%autoejecución para sólo front dispersion

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
%promig: valor més probable gaussiana
%tol tolerancia

clear all;
close all;

global T0 A C tau0 D alpha Beta DT d0 Ti m0 promig sigma tol DP entalpia Amplitud w;

DP=0.1;

fitxerBeta='Beta0167.txt';

savefile_para='AjustTestDispersio.txt';

tol = 0.05;
T0 = 234;
A = 1;
C = 0.1;
tau0 = 10^(-19.36);
D = 17;
alpha = 0.78;
Beta = load(fitxerBeta);
entalpia = 34.5;
DT = 0.1;

Ti = 300;
m0 = 0;
promig = 278;
sigma = 5;
Amplitud = 5.6072; %Normalització P


w= 0.4 ; %parametre ajust funcio 2 P


fi=fopen(savefile_para, 'w');
fprintf(fi, ' T \t 200\t 400 \t 550\t 900 \t 1500  \t  1900 \t  4200\n');
fclose(fi);


Resultat = zeros(8,1500);


fprintf('Inicio\n');

%%CALCULO PARA 200%%
d0 = 200;

AuxResultat = DispersioVfrontp();

for  i=1:length(AuxResultat)
    Resultat(i,2)=AuxResultat(i,5);
end
fprintf('Fin 200\n');

%%CALCULO PARA 400%%
d0 = 400;

AuxResultat = DispersioVfrontp();

for  i=1:length(AuxResultat)
    Resultat(i,3)=AuxResultat(i,5);
end
fprintf('Fin 400\n');

%%CALCULO PARA 550%%
d0 = 550;

AuxResultat = DispersioVfrontp();

for  i=1:length(AuxResultat)
    Resultat(i,4)=AuxResultat(i,5);
end
fprintf('Fin 550\n');

%%CALCULO PARA 900%%
d0 = 900;

AuxResultat = DispersioVfrontp();

for  i=1:length(AuxResultat)
    Resultat(i,5)=AuxResultat(i,5);
end
fprintf('Fin 900\n');

%%CALCULO PARA 1500%%

d0 = 1500;

AuxResultat = DispersioVfrontp();

for  i=1:length(AuxResultat)
    Resultat(i,6)=AuxResultat(i,5);
end

fprintf('Fin 1500\n');

%%CALCULO PARA 1900%%

d0 = 1900;

AuxResultat = DispersioVfrontp();

for  i=1:length(AuxResultat)
    Resultat(i,7)=AuxResultat(i,5);
end

fprintf('Fin 1900\n');

%%CALCULO PARA 4200%%

d0 = 4200;

AuxResultat = DispersioVfrontp();

for  i=1:length(AuxResultat)
    Resultat(i,8)=AuxResultat(i,5);
end

fprintf('Fin 4200\n');

%%GUARDAMOS DATOS
fi = fopen(savefile_para, 'a');

for i=1:length(Resultat)
    Resultat(i,1)=Ti + i*DT;
    fprintf(fi, '%f\t %f\t %f\t %f\t %f\t %f\t %f\t %f\n', Resultat(i,1),Resultat(i,2),Resultat(i,3),Resultat(i,4),Resultat(i,5),Resultat(i,6),Resultat(i,7),Resultat(i,8));
    
end
fclose(fi);
fprintf('Fin Programa %f \n',w);

scatter(Resultat(1:length(Resultat),1),Resultat(1:length(Resultat),4));


end

