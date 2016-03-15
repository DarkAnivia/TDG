function Vtrans = Vfrontp (A, T0, C,tau0,D,alpha, Beta,DT,d0)
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

% i: auxiliar per pasos. Degut a l'aprofitament de la variable pel bucle i
% l'indicador del vector, caldr� comen�ar a 1 i no a 0 per a poder
% utilitzar l'array X i Y
% X: auxiliar que mostra volum transformat a cada pas

%%Inicialitzem variables auxiliars%%%
i=1;
X = zeros(100,1);
%%Fi inicialitzaci�%%

%%Inicialitzem variable dest� final%%
Vtrans = zeros(100,2);
Vtrans(1,1)=T0;

%%Inici c�lcul%%
while (A*d0>Vtrans(i,2))
    T=T0+i*DT;
    X(i+1)=A*Ddistfrontp(T0,T,C,tau0,D,alpha,Beta);
    Vtrans(i+1,2)=trapz(X);
    Vtrans(i+1,1)=T;
    i=i+1;
end
Vtrans(i,2)=A*d0;

end

    