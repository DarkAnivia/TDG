function VolumTransformat = VolumTransformat()
%VOLUMTRANSFORMAT Summary of this function goes here
%   Detailed explanation goes here


global A d0 Ti T0 DT tol entalpia


VolumMostra= A*d0;
VolumTransformat = zeros(1,5);
VolumTransformat(1,1) = Ti;

%pte igualar lo que llega de ambos sitios



index = 1;

while VolumTransformat(index,2)< VolumMostra
    
    T = Ti + DT*index;
    
    Tp = @(x) x;
    fracTransExt = quad2d(@dfracextbulkp,T0,T,Tp,T,'AbsTol',tol);
    fracTrans = 1-exp(-fracTransExt);
    VolTransBulkp = VolumMostra * fracTrans;
    
    distFront =  quad(@Ddistfrontp,T0,T);
    VolTransFrontp = distFront*A;
    
    VolTransBulk = VolTransBulkp - fracTrans * VolTransFrontp;
   % VolTransFront = VolTransFrontp - fracTrans* VolTransFrontp;
    
    
    
    VolumTransformat(index+1,1)=T;
    VolumTransformat(index+1,2) = VolTransBulk + VolTransFrontp;
    VolumTransformat(index+1,3) = VolumTransformat(index+1,2)/VolumMostra;
    if (index>1)
        VolumTransformat(index+1,4)= VolumTransformat(index+1,3)-VolumTransformat(index,3);
        VolumTransformat(index+1,5) = Cpg(T)*(1-VolumTransformat(index+1,3))+Cpl(T)*VolumTransformat(index+1,3)+entalpia *VolumTransformat(index+1,4)/DT;
    
    end
    
    
    index = index + 1;
    
end;










end

