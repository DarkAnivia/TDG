function Vtrans = Vfrontp ()
%Calculo de Volum front prima basandome en el trapz, se guarda en vector
%para ver la evoluci�n
%A:Area mostra
%T0: Tinicial escalfament
%C constante Vfront
%tau0 : tau inicial
%D contant per calcular tau
%alpha cte vfront
%Beta ritme escalfament
%DT increment T per cada pas
%d0: gruix de la mostra
%Vtrans: Temperatura (col1) i Volum transformat a cada pas de les
%iteracions i per tant a cada temperatura (col 2)

global T0 A DT d0;

% i: auxiliar per pasos. Degut a l'aprofitament de la variable pel bucle i
% l'indicador del vector, caldr� comen�ar a 1 i no a 0 per a poder
% utilitzar l'array X i Y
% X: auxiliar que mostra volum transformat a cada pas

%%Inicialitzem variables auxiliars%%%
i=1;
%%Fi inicialitzaci�%%

%%Inicialitzem variable dest� final%%
Vtrans = zeros(1,2);
Vtrans(1,1) = T0;
VolumMostra = d0*A;
%%Inici c�lcul%%

while (VolumMostra>Vtrans(i,2))
    T=T0+i*DT;
    Vtrans(i+1,2)= quad(@Ddistfrontp,T0,T);
    Vtrans(i+1,1)=T;
    i=i+1;
end

Vtrans(i,2)=VolumMostra;

end

    