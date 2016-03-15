function frac= fracbulk(I0,E,Beta,T0,DT,C,D,alpha,tol,tau0 )
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

frac=zeros(1,1);
fracext=0;
frac(1,2)=T0;
Limite= 1-tol;
AuxAcumulada = 0;
i=1;

while frac(i,1) < Limite
    
    T=T0+DT*i;
    Auxiliar = 0;
    frac(i+1,2)=T;
    T01=T0;
    j=1;
    
    while T01<=T
    
        Auxiliar = Auxiliar + dfracextbulkp(I0,E,Beta,T01,DT,C,D,alpha,tau0);
        j=j+1;
        T01=T01+DT;
       
    end
    
    AuxAcumulada(i+1) = Auxiliar;
    fracext(i+1,1) = trapz(AuxAcumulada);
    frac(i+1,1)= 1-exp(-fracext(i+1,1));
    frac(i+1,2) = T;
    i=i+1;
end



end


