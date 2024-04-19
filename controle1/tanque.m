% Parametrização de variáveis
% Entrada
    ae  = 0.6; % abertura da válvula de entrada
    aeq = 0.5; % condição de equilíbrio da válvula de entrada
    ke  =   1; % constante de proporcionalidade da válvula de entrada
% Saída
    as  = ae/2; % abertura da válvula de saída
    asq = 0.2; % condição de equiíbrio da válvula de saída
    ks  =   1; % constante de proporcionalidade da válvula de saída
% Condição inicial
    h0  = .25; % altura inicial do líquido no tanque (condição inicial)
    A   =   5; % área da base do tanque   
% Intervalo de tempo
    tspan = [0 500]; 

ae_variavel = .05:.05:1;
as_variavel = .05:.05:1;
% for i = 1:21
%     h_variavel_ae(i) = ((ke*ae_variavel(i))/(ks*asq))^2;
%     h_variavel_as(i) = ((ke*aeq)/(ks*as_variavel(i)))^2;
% end
% 
% plot(ae_variavel, h_variavel); hold on
% plot(ae_variavel, h_variavel); hold off
for i = 1:20
    [t_n_linear_ae, h_n_linear_ae] = ode45(@(t, h) modelo_n_linear(h, ke, ks, ae_variavel(i), as, A) , tspan, h0);
    h_estatico_ae(i) = h_n_linear_ae(end);
    [t_n_linear_as, h_n_linear_as] = ode45(@(t, h) modelo_n_linear(h, ke, ks, ae, as_variavel(i), A) , tspan, h0);
    h_estatico_as(i) = h_n_linear_as(end);
end

% ae, as, z
% as_h = zeros(1,101);
% ae_h = zeros(1,101);
% for i = 1:1:100
%     as_h(i) = modelo_n_linear(h0, ke, ks, ae, i/100, A);
%     ae_h(i) = modelo_n_linear(h0, ke, ks, i/100, as, A);
% end
% meshgrid(as_h, ae_h);
% plot(as_h, ae_h)

% Modelo não linear
function dhdt = modelo_n_linear(h, ke, ks, ae, as, A)
    Qe = ke * ae;            % vazão de entrada     
    Qs = ks * as * sqrt(h);  % vazão de saída
    dhdt = (Qe - Qs) / A;    % EDO não linear
end
[t_n_linear, h_n_linear] = ode45(@(t, h) modelo_n_linear(h, ke, ks, ae, as, A) , tspan, h0);

% Modelo linear
function dhdt = modelo_linear(ke, ks, ae, aeq, as, asq, A, h, h0)
    dQe = (ke/A)*(ae - aeq);                        % variação do Qe     
    dQs = (ks/A)*(sqrt(h0)*(as - asq));             % variação do Qs
    dh  = (ks * asq * (h - h0))/(2 * A * sqrt(h0));  % variação do h
    dhdt = dQe - dQs - dh;    % EDO linear
end
[t_linear, h_linear] = ode45(@(t, h) modelo_linear(ke, ks, ae, aeq, as, asq, A, h, h0), tspan, h0);

% Plot
plot(t_n_linear, h_n_linear, 'blue'); hold on 
grid on
plot(t_linear, h_linear, 'red'); hold off
legend('não linear','linear')
xlabel('Tempo (s)');
ylabel('Altura do Líquido (m)');
figure;
plot(ae_variavel, h_estatico_ae); hold on
plot(as_variavel, h_estatico_as); hold on
legend('ae','as')
