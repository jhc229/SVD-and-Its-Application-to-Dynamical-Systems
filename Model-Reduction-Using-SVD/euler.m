function [t,x] = euler(t0,tf,h,f,x0)
% t0 = initial time
% tf = final time
% h = step size
% f = the function handle defning the nonlinearity of your problem
% x0 = initial condition

% t = vector of time steps, i.e, t = [t0; t1; : : : ; tf]
% x = stores the approximate numerical solution; i.e, the kth column of x is xk.

% h = (tf-t0)/10
t= t0:h:tf;
x= zeros(length(x0),length(t)); 
x(:,1)=x0;
for i=1:length(t)-1
        x(:,i+1)= x(:,i)+h*f(t(i),x(:,i));
end

