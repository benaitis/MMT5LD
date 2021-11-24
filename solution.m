clc;
clear all;
close all;

t11 = linspace(0, 0.5, 101);
t22 = linspace(0.5, 1, 101);
tau = 0.1;

%% 1 punktas
[te1, ye1] = Euler(@func,  [0, 0.5], 0, 100);
[te2, ye2] = Euler(@func2, [0.5, 1], 1, 100);
figure(1), hold on,
plot(te1, ye1, te2, ye2);

[t2,yo2] = ode45(@func, t11, 0);
[t3, yo3] = ode45(@func2, t22, 1);
plot(t2,yo2,t3,yo3);
title('Euler and ode45')

%% 2 punktas
d1 = matlabFunction(dsolve('Dy=(vin-y)/tau', 'y(0)=0'));
d11 = d1(t11, tau, 1);

d2 = matlabFunction(dsolve('Dy=(vin-y)/tau', 'y(0.5)=1'));
d22 = d2(t22, tau, 0);

figure(2);
plot(t11, d11, t22, d22);
title('dsolve');

%% 3 punktas 
a = d11.' - ye1;
b = d22.' - ye2;
figure(3);
plot(te1, a, te2, b);
title('Skirtumas tarp dsolve ir Eulerio metodo');

a1 = d11.' - yo2;
b2 = d22.' - yo3;
figure(4);
plot(t11, a1, t22, b2);
title('Skirtumas tarp dsolve ir ode metodo');

%% Funkcijos

function dydt = func(t, y)
    dydt = (1-y)/0.1;
end

function dydt2 = func2(t, y)
    dydt2 = (0-y)/0.1;
end