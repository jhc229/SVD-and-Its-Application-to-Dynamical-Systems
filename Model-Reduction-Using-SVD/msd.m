clear all
clf
set(0, 'defaultaxesfontsize',14,'defaultaxeslinewidth',1.0,...
    'defaultlinelinewidth',2.0,'defaultpatchlinewidth',1.0,...
    'defaulttextfontsize',18,'DefaultLineMarkerSize',14)

load 'msd20000'
t0 = 0; %given
tf = 5; %given

t = linspace(0, 5, 501);
x0 = zeros(length(A),1);
x= zeros(length(x0),length(t));
x(:,1) = x0;

f = @(t,x) A*x+b*square(10*t);   
[t,X] = ode45(f,[t0 tf], x0);

X = X';
[U S V] = svd(X,0); 
plot(t, X(2,:),'b')
hold on

% Approximate----------------------
i = 1; 
err = 5*10^-3;
while S(i,i)/S(1,1) > err 
     r=i;                    
     i = i+1;                
end                             

%r =12 36 and 44 
Ur = U(:,1:r); %1412xr
Ar = Ur'*A*Ur; %rxr
br = Ur'*b;   %rx1
% ---------------------------------
% 
% 
% x0 = zeros(length(A),1);
% x= zeros(length(x0),length(t));
% x(:,1) = x0;
% 
% f1 = @(t,x) A*x+b*square(10*t);   
% [t,Xhat0] = ode45(f1,[t0 tf], x0);
% 
% Xhat0 = Xhat0';
% [U S V] = svd(X,0); 
% plot(t, Xhat0(2,:),'b')
% hold on

x0 = zeros(length(Ar),1);
x= zeros(length(x0),length(t));
x(:,1) = x0;

f2 = @(t,x) Ar*x+br*square(10*t); 
[t,Xhat1] = ode45(f2,[t0,tf], x0);
Xhat1 = Xhat1';
Xhat1 = Ur*Xhat1;

plot(t, Xhat1(2,:),'r')
title('u(t) =square(10*t)')
legend('Original','Approximation')
grid on