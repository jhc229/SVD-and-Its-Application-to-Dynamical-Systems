% illustrate the stability of x(t+1) = A x(t)
% Modified version of Dr. Gugercin's check_stability.m

set(0, 'defaultaxesfontsize',14,'defaultaxeslinewidth',1.0,...
    'defaultlinelinewidth',2.0,'defaultpatchlinewidth',1.0,...
    'defaulttextfontsize',18,'DefaultLineMarkerSize',14)
x0 = [.1;.4;0.5];

l1 = 1;    v1 = [1 1 1]';    % first eigenpair
l2 = 0.7;     v2 = [-1 -1 2]';    % second eigenpair
l3 = 0.5;      v3= [-1 1 0]';

V = [v1 v2 v3];       % eigenvector matrix
L = diag([l1 l2 l3]); % eigenvalue matrix
% A = V*(L/V);

A = [0.7, .2, .1; 0.2, 0.7, .1; .1, .1, .8];
% b = [3; 9];

% Simulate x(t+1) = A x(t), x(0) = x0 and store
x = x0;
for i=1:20
    x(:,i+1) = A*x(:,i);
end

% Plot the solution

subplot(3,1,1)
plot(0:i,x(1,:),'-*')
ylabel('x_1(t)')
title('Evolution of x_1(t)')
grid on

subplot(3,1,2)
plot(0:i,x(2,:),'-*')
ylabel('x_2(t)')
xlabel('t')
title('Evolution of x_2(t)')
grid on

subplot(3,1,3)
plot(0:i,x(3,:),'-*')
ylabel('x_3(t)')
xlabel('t')
title('Evolution of x_3(t)')
grid on

