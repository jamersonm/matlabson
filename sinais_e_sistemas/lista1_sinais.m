syms t
syms n integer
u = @(t) heaviside(t);
d = @(t) dirac(t);

% Questão A
%f = @(t) exp(-2.5*t);
% fplot(u*f, [-2, 2])

% Questão B
%fplot(3*u(t-1)*f(t), [-2, 2])

% Questão C
% f1 = @(t) u(t)-u(t-1) + (-t+2)*(u(t-1)-u(t-2));
% fplot(f1((2/3)*t - 1))

% Questão D
% x1 = @(t) cos(2*t) + sin(3*t) + 4*sin(5*t);
% x2 = @(t) (1/2)*(exp(2j*t) + exp(-2j*t)) + (1/2j)*(exp(3j*t)-exp(-3j*t)+4*exp(5j*t)-4*exp(-5j*t));
% fplot(x2(t))

% Questão E
 t = -20*pi:2:20*pi;
 x = cos(t/6);
 stem(t, x);

% Questão F
% subplot(2,2,1);
% y1 = @(t) u(t+3) - u(t-3);
% fplot(y1(t))
% 
% subplot(2,2,2);
% y2 = @(t) d(t+2);
% fplot(y2(t))
% 
% x2 = -5:1:5;
% subplot(2,2,3);
% y3 = u(n) - u(n-5);
% stem(x2, y3)
% 
% subplot(2,2,4);
% y4 = @(n) d(n) + (1/2)*d(n-1) + ((1/2)^2)*d(n-2) + ((1/2)^3)*d(n-3)
% stem(x2, y4(n))
