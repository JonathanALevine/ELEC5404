close all;  
clear; %intialization
set(0,'DefaultFigureWindowStyle','docked')

x = [0, 1];
d = [2, 4];
net = feedforwardnet(2, 'traingd');
net = configure(net, x, d);

net_parameters = [0, 1, 2.0, 0.1, 0, 4, 1.0];

net = setwb(net, net_parameters);

net(x(1))
