function y = DispersioDistFrontp (T)
%Calculo de Diferencial de la distància avançada pel front prima


%T: Tfinal escalfament
%Beta ritme escalfament

global d0 T0 DP;

y=0; 
Tf=250;

for index = 1:10000
    
    Tf = Tf + DP;
    auxVel = quad(@dispersiovelfront,T0,T);
    dist = auxVel * C(Tf)/Beta(T);

    if dist > d0
        dist = d0;
    end
    y = y + P(Tf)*dist;
   
end




%es multiplica per 1 simplement per culpa de la "escalarització"
end