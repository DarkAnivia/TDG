function y = DispersioDistFrontp (T)
%Calculo de Diferencial de la distÓncia avanšada pel front prima


%T: Tfinal escalfament
%Beta ritme escalfament

global d0 T0 DP;

y=0; 
Tf=1;
auxVel = quad(@dispersiovelfront,T0,T);
while Tf<500
    
    
    
    dist = auxVel * C(Tf)/Beta(T);

    if dist > d0
        dist = d0;
    end
    y = y + P(Tf)*dist*DP;
    Tf = Tf + DP;
   
end




%es multiplica per 1 simplement per culpa de la "escalaritzaciˇ"
end