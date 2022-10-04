close all;  
clear; %intialization

set(0,'DefaultFigureWindowStyle','docked')
% set(gca, 'XAxisLocation', 'origin')

x = dlarray(linspace(-15, 25, 100));
y = 2*sigmoid(-(x+7)) + 6*sigmoid(x-5) + sigmoid(-(x-15))-2.5;
% y = (6*sigmoid(x-5)-1.5);

figure(1)
hold on
plot(x, y)
grid on
hold off

figure(2)
hold on
plot(x, y)
grid on