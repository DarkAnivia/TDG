function y = Beta( T )
%Ts: vector de Temp carregades
% Beta: Vector de Beta carregats
% T Temperatura a la que volem saber Beta (K)

global Beta

y = interp1(Beta(1:end,1),Beta(1:end,2),T);


end

