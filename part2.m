close all;  
clear; %intialization
set(0,'DefaultFigureWindowStyle','docked');

E = @(w1,w2) w1.^2 -2*w1 + 1 + 2*(w2.^2 - 4*w2 + 4);

fcontour(E, [-5 5], 'MeshDensity', 250,'LevelList', [0.125 0.25 0.5 1 1.5 2 2.25 3 3.5 4 4.5 5])
hold on
xline(0.5)
yline(1)
hold off
axis equal
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';