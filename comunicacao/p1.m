syms t w
syms n integer
u = @(t) heaviside(t);
d = @(t) dirac(t);

% 1.a)
f = exp(-4*abs(t))*cos(2*t)*u(t);
F = fourier(f)

% 1.b)
% a1 = 1;
% a2 = 5;
% f1 = @(t) sign(a1*t)*u(t);
% f2 = @(t) exp(-a2*t)*u(t);
% f3 = f1(t-1) + f2(t-1);
% F1 = fourier(f1(t-1))
% fplot(f1(t)); hold on
% fplot(f1(t-1))
% F = fourier(f3);

% 1.c)
% y1 = @(t) (3*t+9)*(u(t+3)-u(t+1));
% y2 = @(t) 8*(u(t+1)-u(t-1));
% y = y1(t) + y2(t)
% y__ = diff(y)
% Y = fourier(y1(t)+y2(t));

% 2.a)
% X = @(w) 2*d(w-1) + 3*d(w) + 2*d(w-1);
% x = ifourier(X(w));
% fplot(x); hold on
% myansw = (1/pi)*(2*cos(t) + 3);
% fplot(myansw);

% 2.b)
% X = @(w) cos(3*w);
% x = ifourier(X(w))

% 2.c)
% Y = @(w) (20*pi*d(w-3))/(5*w-5);
% y = ifourier(Y(w))

% 3
 x = @(t) 6*exp(-5*t)*u(t);
 X = fourier(diff(x(t)));
 h = @(t) exp(-4*t)*u(t);
 H = fourier(h(t));
 Y = X*H;
 Y1 = 6*w*1i/((4+w*1i)*(5+w*1i));
 y = ifourier(Y)
 y1 = ifourier(Y1)
