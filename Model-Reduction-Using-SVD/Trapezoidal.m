function [t,x] =Trapezoidal(t0,tf,h,A,x,b,uk)
% u=0
% b=0;
b=0;
u= @(t) 0;
% u = @(t) uk % When u=0 
% u = @(t) uk(t);

[m,n] = size(x);
if m==1 && n==1 && x==0
    x0 = zeros(length(A),1);
elseif m~=1 && n==1
    x0 = x;
elseif m==1 && n~=1
    x0 = x';
else
    error('error');
end

M = speye(length(A)) -h/2*(A);
[L,U] = lu(M);
t = t0:h:tf;
x= zeros(length(x0),length(t));
x(:,1) = x0;

for i =1:length(t)-1
    z(:,i)=x(:,i) + h/2.*(A*x(:,i)+b.*u(t(i))+b.*u(t(i+1)));
    v(:,i+1) = L\z(:,i);
    x(:,i+1) = U\v(:,i+1);
end

end

    