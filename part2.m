close all;  
clear; %intialization
set(0,'DefaultFigureWindowStyle','docked');

global w1 w2
w1 = 0.5;
w2 = 1;

E = @(w1,w2) w1.^2 -2*w1 + 1 + 2*(w2.^2 - 4*w2 + 4);

figure(1)
fcontour(E, [-5 5], 'MeshDensity', 250,'LevelList', [0.125 0.25 0.5 1 1.5 2 2.25 3 3.5 4 4.5 5])
hold on
xline(w1)
yline(w2)
hold off
axis equal
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

Grad_E = @(w1, w2) [2*w1 - 2; 4*w2 - 8];
global h;
h = -1*Grad_E(w1, w2);
Phi = @(n) E(w1 + n*h(1), w2 + n*h(2));

n1 = 0.1;
n2 = 1;

n = linspace(n1, n2);
Phis = Phi(n);

figure(2)
plot(n, Phis)

% After first epoch
n1 = GoldenSearch(n1, n2, E);

w1_new = w1 + n1*h(1);
w2_new = w2 + n1*h(2);

figure(3)
fcontour(E, [-5 5], 'MeshDensity', 250,'LevelList', [0.125 0.25 0.5 1 1.5 2 2.25 3 3.5 4 4.5 5])
hold on
quiver(0, 0, w1,w2, 'AutoScale','off')
plot(w1,w2,'r*')
quiver(w1, w2, w1_new - w1, w2_new - w2, 'AutoScale','off')
plot(w1_new,w2_new,'r*')
axis equal
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
hold off

% After second epoch
n1 = GoldenSearch(n1, 10*n1, E);

w1_new = w1 + n1*h(1);
w2_new = w2 + n1*h(2);

figure(3)
fcontour(E, [-5 5], 'MeshDensity', 250,'LevelList', [0.125 0.25 0.5 1 1.5 2 2.25 3 3.5 4 4.5 5])
hold on
quiver(0, 0, w1,w2, 'AutoScale','off')
plot(w1,w2,'r*')
quiver(w1, w2, w1_new - w1, w2_new - w2, 'AutoScale','off')
plot(w1_new,w2_new,'r*')
axis equal
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
hold off

