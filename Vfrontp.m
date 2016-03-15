function Vtrans = Vfrontp (A, T0, C,tau0,D,alpha, Beta,DT)
%Calculo de Volum front prima basandome en el trapz, se guarda en vector
%para ver la evolución
%A:Area mostra
%T0: Tinicial escalfament
%C constante Vfront
%tau0 : tau inicial
%D gruix mostra
%alpha cte vfront
%Beta ritme escalfament
%DT increment T per cada pas
%Vtrans: Temperatura (col1) i Volum transformat a cada pas de les
%iteracions i per tant a cada temperatura (col 2)

% i: auxiliar per pasos. Degut a l'aprofitament de la variable pel bucle i
% l'indicador del vector, caldrà començar a 1 i no a 0 per a poder
% utilitzar l'array X i Y
% X: auxiliar que mostra volum transformat a cada pas

%%Inicialitzem variables auxiliars%%%
i=1;
X = zeros(100,1);
%%Fi inicialització%%

%%Inicialitzem variable destí final%%
Vtrans = zeros(100,2);
Vtrans(1,1)=T0;

%%Inici cálcul%%
while (D*A>Vtrans(i,2))
    X(i+1)=DVfrontp(A,T0,T0+i*DT,C,tau0,D,alpha,Beta);
    Vtrans(i+1,2)=trapz(X);
    Vtrans(i+1,1)=i*DT+T0;
    i=i+1;
end

end

    