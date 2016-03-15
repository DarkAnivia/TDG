function y = Ddistfrontp (T0, T, C,tau0,D,alpha, Beta)
%Calculo de Diferencial de la distància avançada pel front prima

%T0: Tinicial escalfament
%T: Tfinal escalfament
%C constante Vfront
%tau0 : tau inicial
%D Cte per a tau
%alpha cte vfront
%Beta ritme escalfament

y = velfront(C,tau0,D,T0,T,alpha)/Beta;
end