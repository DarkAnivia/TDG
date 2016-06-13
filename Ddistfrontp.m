function y = Ddistfrontp (T)
%Calculo de Diferencial de la distància avançada pel front prima


%T: Tfinal escalfament
%Beta ritme escalfament

y = velfront(T)./Beta(T).*1;

%es multiplica per 1 simplement per culpa de la "escalarització"
end