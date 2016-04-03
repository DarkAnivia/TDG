function y = Ddistfrontp (T)
%Calculo de Diferencial de la distància avançada pel front prima


%T: Tfinal escalfament
%Beta ritme escalfament

global Beta

y = velfront(T)./Beta;
end