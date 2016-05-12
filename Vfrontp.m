function Vtrans = Vfrontp ()
%Calculo de Volum front prima basandome en el trapz, se guarda en vector
%para ver la evolución
%A:Area mostra
%Ti: Tinicial escalfament
%C constante Vfront
%tau0 : tau inicial
%D contant per calcular tau
%alpha cte vfront
%Beta ritme escalfament
%DT increment T per cada pas
%d0: gruix de la mostra
%Vtrans: Temperatura (col1) i Volum transformat a cada pas de les
%iteracions i per tant a cada temperatura (col 2)

global Ti A DT d0 T0 m0;

% i: auxiliar per pasos. Degut a l'aprofitament de la variable pel bucle i
% l'indicador del vector, caldrà començar a 1 i no a 0 per a poder
% utilitzar l'array X i Y
% X: auxiliar que mostra volum transformat a cada pas

%%Inicialitzem variables auxiliars%%%
i=0;
%%Fi inicialització%%

%%Inicialitzem variable destí final%%
Vtrans = zeros(1,5);
VolumMostra = d0*A;
Vtransaux = 0;
%%Inici cálcul%%

while (VolumMostra>Vtransaux)
    T=Ti+i*DT;
    Vtrans(i+1,2)= quad(@Ddistfrontp,T0,T);
    Vtrans(i+1,1)= T;
    Vtrans(i+1,3) = Vtrans(i+1,2)/d0;
    if (i>1)
    Vtrans (i+1,4) = (Vtrans(i+1,3) - Vtrans(i,3))/DT;
    Vtrans(i+1,5) = Cpg(T)*(1-Vtrans(i+1,3))+Cpl(T)*Vtrans(i+1,3)+Vtrans(i+1,4);
    end
    Vtransaux= A*Vtrans(i+1,2);
    
    
    
    i=i+1;
    
    fprintf('%f\t %f\t  %f\t %f\n', Vtrans(i,1),Vtrans(i,2),Vtrans(i,3),Vtrans(i,4));
end

Vtrans(i,2)=VolumMostra;
Vtrans(i,3) = 1;
Vtrans(i,4)= (Vtrans(i,3)-Vtrans(i-1,3))/DT;

end

    