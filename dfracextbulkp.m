function dfracext= dfracextbulkp(I0,E,Beta,T0,DT,C,D,alpha,tau0)
%I0 constant
%E Energia activació
%Beta rati escalfament
%T0 temperatura inicial del pas
%DT increment del pas
%C constant de velocitat front
%D constant de tau
%alpha constant de velocitat front
%tau0 cte para tau



%Definim la temperatura final en funció de l'increment de l'interval y una
%T0 auxiliar
T=T0+DT;
T01=T0;
%Redefinim l'increment de temperatura per calcular la integral 
%corresponent a la velocitat del font y definim auxiliar bucle
%si volem mes pasos també el bucle haurá de ser més gran
j=1;
DT=DT/10;
Auxfront = 0;
nuclis = nucleacio(I0,E,T0);
while T01<=T    %es compara que la T0 sigui menor a la final
    
    %Auxiliar per poder anar gravant el radi de les boletes

    T1=T0+DT*j;

    %Calcul del radi de les boles 
    Auxfront(j+1)= Ddistfrontp(T0,T1,C,tau0,D,alpha, Beta);
    
    T01=T01+DT;    
    j=j+1;
end
    Radifront = trapz(Auxfront); 
    %quant ha crescut cada bola desde instant que comencen a creixer fins
    %actualitat
    
    dfracext = 4/3*pi*nuclis/Beta*Radifront^3;
    
    
    
end
