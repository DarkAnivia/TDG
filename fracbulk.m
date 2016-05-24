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

frac = zeros(1,5);
frac(1,1)= Ti;
frac(1,5) = Beta(Ti);

Limite= 1-tol;
i=1;




while frac(i,3) < Limite 
    
    T=Ti+DT*i;
    frac(i+1,1) = T;
    
    Tp = @(x) x;
    frac(i+1,2) = quad2d(@dfracextbulkp,T0,T,Tp,T, 'AbsTol',tol);
    frac (i+1,3) = 1-exp(-frac(i+1,2));
    
    frac(i+1,4)=(frac(i+1,3)-frac(i,3))/DT;
    frac(i+1,5) = Beta(T);
    
    
    i=i+1;
    
end



end


