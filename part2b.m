close all;  
clear; %intialization
set(0,'DefaultFigureWindowStyle','docked');

% Error Function and Gradient Functions
E = @(w1,w2) w1.^2 -2*w1 + 1 + 2*(w2.^2 - 4*w2 + 4);
Grad_E = @(w1, w2) [2*w1 - 2; 4*w2 - 8];

% Initial Point
w1_init = 0.5;
w2_init = 1.0;

figure(1)
fcontour(E, [-5 5], 'MeshDensity', 250,'LevelList', [0.001 0.01 0.03125 0.0625 0.125 0.25 0.5 1 1.5 2 2.25 3 3.5 4 4.5 5])
hold on
% quiver(0, 0, w1_init,w2_init, 'AutoScale','off', 'Color', 'b')
plot(w1_init, w2_init,'r*')
hold off
axis equal
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlabel('w1')
ylabel('w2')

% First Epoch
w1 = w1_init;
w2 = w2_init;
g = Grad_E(w1, w2);
h = -1*g;

% Minimizing function to find the best step
Phi = @(n) E(w1 + n*h(1), w2 + n*h(2));

n1 = 0.01;
n2 = 2;

% Find the best step size (best learning rate)
n = GoldenSearch(n1, n2, Phi);
w1_new = w1 + n*h(1);
w2_new = w2 + n*h(2);

figure(2)
fcontour(E, [-5 5], 'MeshDensity', 250,'LevelList', [0.001 0.01 0.03125 0.0625 0.125 0.25 0.5 1 1.5 2 2.25 3 3.5 4 4.5 5])
hold on
plot(w1_init, w2_init,'r*')
plot(w1_new, w2_new, 'r*')
% Update Direction
quiver(w1_init, w2_init, n*h(1), n*h(2), 'AutoScale','off', 'Color', 'b')
hold off
axis equal
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlabel('w1')
ylabel('w2')

% Second Epoch
h_prev = h;
gamma_val = myGamma(Grad_E(w1_new, w2_new), Grad_E(w1, w2));
g_new = -1*Grad_E(w1_new, w2_new);
h_new = g_new + gamma_val*h_prev;

% Minimizing function to find the best step
Phi = @(n) E(w1_new + n*h_new(1), w2_new + n*h_new(2));

n = GoldenSearch(n1, n2, Phi);
w1_new_new = w1_new + n*h_new(1);
w2_new_new = w2_new + n*h_new(2);

figure(3)
fcontour(E, [-5 5], 'MeshDensity', 250,'LevelList', [0.001 0.01 0.03125 0.0625 0.125 0.25 0.5 1 1.5 2 2.25 3 3.5 4 4.5 5])
hold on
% quiver(0, 0, w1_init,w2_init, 'AutoScale','off', 'Color', 'b')
plot(w1_init, w2_init,'r*')
plot(w1_new, w2_new, 'r*')
plot(w1_new_new, w2_new_new, 'r*')
quiver(w1_new, w2_new, n*h_new(1), n*h_new(2), 'Autoscale', 'off')
quiver(w1_new, w2_new, g_new(1), g_new(2), 'Autoscale', 'off')
hold off
axis equal
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlabel('w1')
ylabel('w2')

