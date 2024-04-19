syms t
syms n integer
u = @(t) heaviside(t);
d = @(t) dirac(t);

% A
% a = -2; %This is the starting value of time for x(t).
% b = -2;  %Starting value of time for h(t).
 
% x = [ 0.5 -2 1 0.5 ];
% h = [ 0.5 0.5 1 0.5];
 
% subplot( 3, 1, 1);
% t = a : a+length(x)-1; %tstep is not required here.
% stem( t, x);
 
% subplot( 3, 1, 2);
% t = b : b+length(h)-1;
% stem( t, h);
 
% y = conv( x, h);
 
% subplot( 3, 1, 3);
% t = a+b : a+b+length(y)-1;
% stem( t, y);

% B
% Y = laplace(u(t))*laplace(exp(-t)*u(t));
% y = ilaplace(Y)

% C
T = 2;
Y = laplace(u(t)-u(t-T))*laplace(t*(u(t)-u(t-2*T)));
y = ilaplace(Y)*u(t);


%y1 = -((t^2)/2)*               (u(t) - u(t-2));
%y2 = -2*                     (u(t-2) - u(t-4));
%y3 = (4-((t-4)^2)/2)*(u(t-4) - u(t-6));
%y = (y1+y2+y3)*u(t);

x1 = ((t^2)/2)*(u(t)-u(t-2*T));
x2 = -(((t-T)^2)/2)*(u(t-T)-u(t-3*T));
x3 = (((2*T)^2)/2)*(u(t-2*T)-u(t-3*T));
x = (x1+x2+x3)*u(t);

z1 = ((t^2)/2)*                           (u(t));
z2 = -(((t-T)^2)/2)*                     (u(t-T));
z3 = -(((t^2)/2)-(((2*T)^2)/2))*         (u(t-2*T));
z4 = ((((t-T)^2)/2)-(((2*T)^2)/2))*   (u(t-3*T));
z = (z1+z2+z3+z4);

w = heaviside(t - 4)*(t^2/2 - 8) - heaviside(t)*(4*heaviside(t - 4)*(t - 4) - 4*heaviside(t - 6)*(t - 6) + (heaviside(t - 2)*(t - 2)^2)/2 + (heaviside(t - 4)*(t - 4)^2)/2 - (heaviside(t - 6)*(t - 6)^2)/2 - t^2/2) - (t^2*heaviside(t))/2 - heaviside(t - 6)*((t - 2)^2/2 - 8) + (heaviside(t - 2)*(t - 2)^2)/2;

subplot( 3, 1, 1);
fplot(y, [0 7]);
subplot( 3, 1, 2);
fplot(z, [0 7]);
subplot( 3, 1, 3);
fplot(x, [0 7]);

isequal(y, w)