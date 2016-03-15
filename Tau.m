
   
function y = Tau( tau0, D, T0, T )
%Càlcul de tau
%Calculem Tau en funció de la temperatura i de la temperatura final a més
%de una tau inicial

%tau0 : parametre
% D : parametre
% T0: T inicial
% T: T final


           y = tau0*exp(D*T0/(T-T0)); 

end

        



