close all;  
clear; %intialization

set(0,'DefaultFigureWindowStyle','docked')
% set(gca, 'XAxisLocation', 'origin')

x = dlarray(linspace(-15, 25, 1000));
y = 2*sigmoid(-(x+7)) + 6*sigmoid(x-5) + sigmoid(-(x-15))-2.5;
% y = (6*sigmoid(x-5)-1.5);

figure(1)
hold on
plot(x, y)
grid on
hold off

x = dlarray(linspace(-15, 25, 1000));
y = -5*exp(-((x-10)./2).^2) + 10*exp(-(x-20).^2) + 2.5;

figure(2)
plot(x, y)
grid on
