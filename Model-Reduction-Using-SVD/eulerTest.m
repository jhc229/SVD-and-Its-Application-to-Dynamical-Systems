clear all;

f = @(t,x) [-8003 1999; 23988 -6004]*[x(1);x(2)];
A= [-8003 1999; 23988 -6004];

% h=0.1;
h=0.001;
% h =1.3571*10^-4;

t0 =0;
tf =0.02;
% tf =2;
x0 = [1; 4];

% [t,x] = euler(t0,tf,h,f,x0);
[t,x] = Trapezoidal(t0,tf,h,A,x0,0,0); 

subplot(2,1,1);
plot(t,x(1,:));
title('h=0.001')
xlabel('t') % x-axis label
grid on
subplot(2,1,2);
plot(t,x(2,:));
xlabel('t') % x-axis label
grid on
