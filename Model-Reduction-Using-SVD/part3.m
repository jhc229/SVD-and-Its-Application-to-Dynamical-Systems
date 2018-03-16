clear all
clf
set(0, 'defaultaxesfontsize',14,'defaultaxeslinewidth',1.0,...
    'defaultlinelinewidth',2.0,'defaultpatchlinewidth',1.0,...
    'defaulttextfontsize',18,'DefaultLineMarkerSize',14)

load 'iss12a'
t0 = 0; %given
tf = 50; %given

t = linspace(0, 50, 501);
x0 = zeros(length(A),1);
x= zeros(length(x0),length(t));
x(:,1) = x0;

f = @(t,x) A*x+b;   %u(t) =1 or u(t) =1 or sin(4*t)
[t,X] = ode45(f,[t0 tf], x0);


X = X';
[U S V] = svd(X,0); 
plot(t, X(1,:),'b')
title('r=12')
hold on

i = 1; 
err = 1*10^-1;
while S(i,i)/S(1,1) > err 
     r=i;                    
     i = i+1;                
end                             

%r =12 36 and 44 
Ur = U(:,1:r); %1412xr
Ar = Ur'*A*Ur; %rxr
br = Ur'*b;   %rx1
% Xr = x(1:r,1);  %r x1

x0 = zeros(length(Ar),1);
x= zeros(length(x0),length(t));
x(:,1) = x0;


f2 = @(t,x) Ar*x+br; % u(t) =1 or u(t) =1 or sin(4*t)
[t,Xhat] = ode45(f2,[t0,tf], x0);
Xhat = Xhat';
Xhat = Ur*Xhat;

plot(t, Xhat(1,:),'r')
legend('Original','POD')
grid on