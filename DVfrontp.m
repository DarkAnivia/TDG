function y = DVfrontp (A, T0, T, C,tau0,D,alpha, Beta)
%Calculo de Diferencial Volum front prima basandome en el trapz, debo crear un vector
%A:Area mostra
%T0: Tinicial escalfament
%T: Tfinal escalfament
%C constante Vfront
%tau0 : tau inicial
%D gruix mostra
%alpha cte vfront
%Beta ritme escalfament
%DT increment T per cada pas
y = A*velfront(C,tau0,D,T0,T,alpha)/Beta;
end