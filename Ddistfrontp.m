function y = Ddistfrontp (T)
%Calculo de Diferencial de la dist�ncia avan�ada pel front prima


%T: Tfinal escalfament
%Beta ritme escalfament

global Beta

y = velfront(T)./Beta;
end