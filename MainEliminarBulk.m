function MainEliminarBulk
%autoejecución para sólo Vbulk


clear all;
close all;

%Recrdar que en el fracbulk hay una multiplicación para poder comparar


global I0 E Beta T0 DT C D alpha tol tau0 Ti r0 entalpia;

%fitxerBeta='Beta100.txt';

%fitxerBeta='BetaSmooth100.txt';
%savefile_para='B01667Bulk.txt';
 

T0 = 234;
C = 0.1;
tau0 = 10^(-19.36);
D = 17;
alpha = 0.78;
entalpia = 34.5;
DT = 0.1;
%I0 = 10^21.7;  %primera I0 calculada en base a 1a aprox
%E = 206950;
tol = 1E-3;
Ti= 320;
r0 = 0;

%picos a 335.86  344.81  369.5  388.55  400

I0 = 10^21.15;
E = 206950;

%I0 = 10^24;  %Valores sólo bulk aprox
%E = 220000;

I0 = 10^32.0;   
E = 275000; %parece que este es el "bueno"

I0 = 10^28.5;   
E = 250000; 



%aumentar E los separa y desplaza hacia la derecha
%Disminuir I0 desplaza todo a la derecha
savefile_para='Test_Ajust smooth prueba.txt'; 
fi=fopen(savefile_para, 'w');
fprintf(fi, ' T \t B0.33\t B0.167 \t B100\t B1500 \t B23000\n');
fclose(fi);


Resultat = zeros(6,1500);


fprintf('Inicio\n');

%%CALCULO PARA 0.33%%

fitxerBeta='Beta0033.txt';
Beta = load(fitxerBeta);

Resultat0033 = fracbulk();

for  i=1:length(Resultat0033)
    Resultat(i,2)=Resultat0033(i,5);
end
fprintf('Fin 0033\n');

%%CALCULO PARA 0.167%%
fitxerBeta='Beta0167.txt';
Beta = load(fitxerBeta);

Resultat0167 = fracbulk();

for  i=1:length(Resultat0167)
    Resultat(i,3)=Resultat0167(i,5);
end

fprintf('Fin 0167\n');

%%CALCULO PARA 100%%
fitxerBeta='Beta01k.txt';
fitxerBeta='BetaSmooth100.txt';
Beta = load(fitxerBeta);

Resultat100 = fracbulk();

for  i=1:length(Resultat100)
    Resultat(i,4)=Resultat100(i,5);
end
fprintf('Fin 100\n');
%%CALCULO PARA 1500%%

fitxerBeta='Beta15k.txt';
fitxerBeta='BetaSmooth1500.txt';
Beta = load(fitxerBeta);

Resultat1500 = fracbulk();

for  i=1:length(Resultat1500)
    Resultat(i,5)=Resultat1500(i,5);
end
fprintf('Fin 1500\n');

%%CALCULO PARA 25000%%
fitxerBeta='Beta25k.txt';
fitxerBeta='Beta25000.txt';
Beta = load(fitxerBeta);

Resultat25000 = fracbulk();

for  i=1:length(Resultat25000)
    Resultat(i,6)=Resultat25000(i,5);
end
fprintf('Fin 23000\n');



%%GUARDAMOS DATOS
fi = fopen(savefile_para, 'a');

for i=1:length(Resultat)
    Resultat(i,1)=Ti + i*DT;
    fprintf(fi, '%f\t %f\t %f\t %f\t %f\t %f\n', Resultat(i,1),Resultat(i,2),Resultat(i,3),Resultat(i,4),Resultat(i,5),Resultat(i,6));
    
end
fclose(fi);
fprintf('Fin Programa %f %f\n',E,I0/10^18);



end