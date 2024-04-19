syms t tau % reta real de valores
u = @(t) heaviside(t);
d = @(t) dirac(t);

%% Questão A

% módulo do intervalo de plot x e y
a = 4; 

% Função e t0
xa = @(t) 2*t;
t0 = 2;

% plot

figure;
subplot(2,3,1); hold on
fplot(xa(t), [-a,a], 'red'); grid on % plot x(t)
ylim([-a a]);
legend('x(t)');

subplot(2,3,2);
fplot(xa(t - t0), [-a,a], 'red'); grid on % plot x(t - t0)
ylim([-a a]);
legend('x(t - t0)');

subplot(2,3,3);
fplot(xa(t + t0), [-a,a], 'red'); grid on % plot x(t + t0)
ylim([-a a]);
legend('x(t + t0)');

subplot(2,3,4);
fplot(xa(-t), [-a,a], 'blue'); grid on % plot x(-t)
ylim([-a a]);
legend('x(-t)');

subplot(2,3,5);
fplot(xa(-t - t0), [-a,a], 'blue'); grid on % plot x(-t - t0)
ylim([-a a]);
legend('x(-t - t0)');

subplot(2,3,6);
fplot(xa(-t + t0), [-a,a], 'blue'); grid on % plot x(-t + t0)
ylim([-a a]);
legend('x(-t + t0)');
sgtitle('Questão A') 
hold off

%% Questão B

xb = [1 2 3 2 1];
xb_ini = -2; % onde x[n] começa
hb = [3 2 1];
hb_ini = 0;  % onde h[n] começa

figure;
subplot(3, 1, 1); hold on
n = xb_ini:xb_ini+length(xb)-1; % intervalo entre o começo e o fim de x[n]
stem(n, xb, 'red'); % plot x[n]             
legend('x[n]');

subplot(3, 1, 2);
n = hb_ini:hb_ini+length(hb)-1; % intervalo entre o começo e o fim de h[n]
stem(n, hb, 'blue'); % plot h[n]          
legend('h[n]');

yb = conv(xb, hb);

subplot(3, 1, 3);
n = xb_ini+hb_ini:(xb_ini+hb_ini+length(yb)-1);
stem(n, yb, 'magenta'); % plot x[n]*h[n]
legend('x[n] * h[n]');hold off

sgtitle('Questão B') 

%% Questão C

xc = @(t) 2*(u(t+4)-u(t-4));
hc = @(t) exp(-t)*u(t);
yc = @(t) int(xc(tau)*hc(t-tau), tau, -inf, inf); % convolução no tempo

figure;
subplot(3,1,1); hold on
fplot(xc(t), [-10 10], 'red'); % plot x(t)
legend('x(t)');

subplot(3,1,2);
fplot(hc(t), [-10 10], 'blue'); % plot h(t)
legend('h(t)');

subplot(3,1,3);
fplot(yc(t), [-10 10], 'magenta'); % plot x(t) * h(t)
legend('x(t) * h(t)'); 

sgtitle('Questão C') 
hold off