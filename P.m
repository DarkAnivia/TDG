function P = P( Tf )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
global sigma promig Amplitud w;

%Al hacer pruebas recordar definir la global promig

 T0 = 230.54; %K
 Taug = 2.69e-12; %s
 y0 = 0;

 T=340; %s (parametre)
 Tfc = 278; %K (promig??)

 A = -0.106 ;%K^-1
 B = 44.93;

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%funció 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%  %eta(Tf)=A*Tf + B;
%  
%  tau0 = Taug * exp((promig*A + B)*T0/(345-T0));
%  
%  
%  tau = Taug * exp((Tf*A + B)*T0/(345-T0));
%   
%  z = (tau - tau0 )/30; 
%  %/w;
% 
%  P = y0 + Amplitud*exp(-exp(-z)-z+1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%gaussiana%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%P = (1/(sqrt(2*sigma^2*pi))*exp(-(Tf.*1-promig).^2/(2*sigma^2)));


%funciona perfectamente , usar sigma 5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%funció 2 %%%%%%%%%%%%%%%%%%%%%%%%
%recordar definir globales amplitud, w para calculos desde llamadas
%directas a funcion P

tauvidre = Taug * exp(T0*(Tf.*A + B)/(T-T0));

%tauc= (Taug*exp(T0*(A*Tfc)+B)/(T-T0));  %s
tauc = 500;

P = Amplitud^-1 * exp((-exp(-(log10(tauvidre.*1)-log10(tauc))/w))-((log10(tauvidre)-log10(tauc))/w)+1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


end

