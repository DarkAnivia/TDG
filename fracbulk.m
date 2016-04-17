function frac= fracbulk()
%I0 constant
%E Energia activació
%Beta rati escalfament
%T0 temperatura inicial del pas
%DT increment del pas
%C constant de la velocitat del front
%D constant de tau
%alpha constant de velocitat front
%tol tolerancia 
%tau0 contant tau

global tol Ti DT T0

frac = zeros(1,4);
frac(1,1)= Ti;

Limite= 1-tol;
i=1;




while frac(i,3) < Limite 
    
    T=Ti+DT*i;
    frac(i+1,1) = T;
    
    Tp = @(x) x;
    frac(i+1,2) = quad2d(@dfracextbulkp,T0,T,Tp,T);
    frac (i+1,3) = 1-exp(-frac(i+1,2));
    
    frac(i+1,4)=(frac(i+1,3)-frac(i,3))/DT;
    
    
    i=i+1;
    
    fprintf('%f\t %f\t %f\n', frac(i,1),frac(i,2),frac(i,3));
    
end



end


