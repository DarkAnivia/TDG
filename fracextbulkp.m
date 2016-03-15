function fracext= fracextbulkp(i,I0,E,Beta,DT,C,D,alpha)


j=1;
dfrac= zeros(1,1);
while j<=i
    Auxfront = zeros(1,1);
    %Auxiliar per poder anar gravant el radi de les boletes
    k=j;
    %donat que s'ha de fer la segona integral necesitarem un segon auxiliar per poder recorrer el vector
    l=1; 
    %per recorrer vector auxiliar dintre while
    while k<=i
        %Calcul del radi de les boles 
        Auxfront(l+1)= DVfrontp(1,T0+DT*(j-1),T0+DT*k,C,tau0,D,alpha, Beta);
        
        k=k+1;
        l=l+1;
    end
    Rfront = trapz(Aux); 
    %quant ha crescut cada bola desde instant que comencen a creixer fins
    %actualitat
    
    dfrac(j+1) = Auxfrac(j+1) + 4/3*pi*nucleacio(I0,E,T0+DT*(j-1),To+DT*j)*Rfront^3;
    %sumem la contribucio de totes les nucleacions
    j=j+1;
end;

fracext= trapz(Auxfrac);
    
    
end
