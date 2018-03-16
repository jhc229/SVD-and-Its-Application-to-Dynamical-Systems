clear all
clf
set(0, 'defaultaxesfontsize',14,'defaultaxeslinewidth',1.0,...
    'defaultlinelinewidth',2.0,'defaultpatchlinewidth',1.0,...
    'defaulttextfontsize',18,'DefaultLineMarkerSize',14)

load 'msd20000'
t0 = 0; %given
tf = 5; %given
h = 0.01; %given
u =@(t) sin(4*t);
[t,X] = Trapezoidal(t0,tf,h,A,0,b,u); 

[U S V] = svd(X,0); 

% Approximate----------------------
i = 1; 
err = 5*10^-3;
while S(i,i) / S(1,1) > err 
     r = i;                    
     i = i+1;                
end                             
%-----------------------------------
%r =12 36 and 44 
Ur = U(:,1:r); %1412xr
Ar = Ur'*A*Ur; %rxr
br = Ur'*b;   %rx1
% ---------------------------------

%  plot the evolution of the second component of x(t).
[t,Xhat] = Trapezoidal(t0,tf,h,Ar,0,br,u); 
Xhat = Ur*Xhat;

plot(t, X(2,:),'b')
hold on
plot(t, Xhat(2,:),'r')
title('u(t) =sin(5t)')
legend('Original','Approximation')
grid on