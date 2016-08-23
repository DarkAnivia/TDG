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

global tol Ti DT T0 entalpia

frac = zeros(1,6);
frac(1,1)= Ti;
frac(1,6) = Beta(Ti);

Limite= 1-tol;
i=1;




while frac(i,3) < Limite 
    
    T=Ti+DT*i;
    frac(i+1,1) = T;
    
    Tp = @(x) x;
    frac(i+1,2) = quad2d(@dfracextbulkp,T0,T,Tp,T, 'AbsTol',tol);
    frac (i+1,3) = 1-exp(-frac(i+1,2));
    frac(i+1,6) = Beta(T);
    
    if (i>1)
    frac(i+1,4)=(frac(i+1,3)-frac(i,3))/DT;
    
    frac(i+1,5) = Cpg(T)*(1-frac(i+1,3))+Cpl(T)*frac(i+1,3)+ entalpia * frac(i+1,4);
    end
    
    fprintf('%f\t %f\t  %f\t  %f\t %f\n', frac(i,1),frac(i,2),frac(i,3),frac(i,4),frac(i,5));
    i=i+1;
    
end



end


