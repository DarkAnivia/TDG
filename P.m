function P = P( Tf )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
global sigma promig ;

%Al hacer pruebas recordar definir la global promig

 T0 = 230.54; %K
 Taug = 2.69e-12;
 y0 = 0;
 Amp = 1/4.4530;

 
 A = -0.106 ;%K^-1
 B = 44.93;

 %eta(Tf)=A*Tf + B;
 
 tau0 = Taug * exp((promig*A + B)*T0/(345-T0));
 
 
 tau = Taug * exp((Tf*A + B)*T0/(345-T0));
  
 z = (tau - tau0 )/33; 
 %/w;



%P = (1/(sqrt(2*sigma^2*pi))*exp(-(Tf.*1-promig).^2/(2*sigma^2)));


 P = y0 + Amp*exp(-exp(-z)-z+1);

end

