function dfracext= dfracextbulkp(T,Tp)
%I0 constant
%E Energia activaci�
%Beta rati escalfament
%T0 temperatura inicial del pas
%DT increment del pas
%C constant de velocitat front
%D constant de tau
%alpha constant de velocitat front
%tau0 cte para tau
%T final del proces

global Beta


%quant ha crescut cada bola desde instant que comencen a creixer fins
%actualitat

dfracext = 4/3*pi*nucleacio(T)./Beta.*Ddistfrontp(Tp).^3;

    
    
    
end
