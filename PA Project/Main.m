% Design Parameters
M0 = 2;
h = 11000; % [m]
T0 = 216.5; % [K]
Tt4 = 1373; % [K]
tau_c = 2; % =Tt3/Tt2
gamma = 1.4;
hf_0 = 4.3095 * 10^7;
r = 287.15;

% Loss coeficients
epsilon_i = 0.075;
epsilon_b = 0.06;
epsilon_n = 0.02;

% Politropic efficiencies
nu_cp = 0.88;
nu_tp = 0.93;

% Nozzle Velocity Coefficient
psi = 0.98;

% Turbine Cooling Bleed
x = 0.07;

Tt0 = T0 * (1 + ((gamma - 1)/2) * (M0^2));

theta_0 = Tt0/T0;

Tt2 = Tt0;

theta_3 = tau_c * theta_0;

Tt3 = T0 * theta_3;

theta_4 = Tt4/T0;

alpha = ((Tt4 - Tt3) / (hf_0 * 1)) * ((gamma * r)/(gamma -1));

Tt5 = Tt4 * (1 - (theta_0/theta_4)*(tau_c - 1));

theta_5 = Tt5/T0;

theta_9 = theta_5;

epsilon_t = ((gamma - 1)/gamma) * (epsilon_i + epsilon_b + epsilon_n);

v9 = psi * (theta_4 * (1 - ((1 + epsilon_t) / (theta_0 * tau_c^(nu_cp) * (1 - (theta_0/theta_4) * (tau_c - 1) )^((1/nu_tp) - 1) ))) - theta_0*(tau_c - 1))^(1/2);

V9 = v9 * (2*((gamma*r)/(gamma - 1))*T0) ^(1/2);

f = v9 - (theta_0 - 1)^(1/2);

specific_thrust = f * (2*((gamma*r)/(gamma - 1))*T0) ^(1/2);

nu_th = (v9^2 - (theta_0 - 1))/(theta_4 - tau_c*theta_0);

nu_pr = 2/(1 + v9*(theta_0 - 1)^(-(1/2)));

nu_o = nu_th * nu_pr;

Cts = alpha/specific_thrust;
