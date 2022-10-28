close all;  
clear; %intialization

% set(0,'DefaultFigureWindowStyle','docked')
% % set(gca, 'XAxisLocation', 'origin')
% 
% x = dlarray(linspace(-15, 25, 1000));
% y = 2*sigmoid(-(x+7)) + 6*sigmoid(x-5) + sigmoid(-(x-15))-2.5;
% % y = (6*sigmoid(x-5)-1.5);
% 
% figure(1)
% hold on
% plot(x, y)
% grid on
% hold off
% 
% x = dlarray(linspace(-15, 25, 1000));
% y = -5*exp(-((x-10)./2).^2) + 10*exp(-(x-20).^2) + 2.5;
% 
% figure(2)
% plot(x, y)
% grid on

x = 1;
v0 = 0;
v1 = 0.1;
v2 = 0.5;
w10 = 0;
w11 = -1;
w20 = 1;
w21 = 0.2;

dy_dw11 = v1*x*sigmoid(dlarray(x*w11+w10))*(1-sigmoid(dlarray(x*w11+w10)))
dy_dw10 = v1*sigmoid(dlarray(x*w11+w10))*(1-sigmoid(dlarray(x*w11+w10)))

dy_dw21 = v2*x*sigmoid(dlarray(x*w21+w20))*(1-sigmoid(dlarray(x*w21+w20)))
dy_dw20 = v2*sigmoid(dlarray(x*w21+w20))*(1-sigmoid(dlarray(x*w21+w20)))


