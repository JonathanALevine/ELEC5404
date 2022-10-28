close all;  
clear; %intialization
set(0,'DefaultFigureWindowStyle','docked');

x = [0, 1];
d = [2, 4];

w11 = 2.0;
w10 = 0;

w21 = 0.1;
w20 = 1.0;

v1 = 4;
v2 = -1.0;
v0 = 0;

w = [w10, w20, w11, w21, v0, v1, v2];

z1 = sigmoid(dlarray(x(1)*w(3) + w(1)));
z2 = sigmoid(dlarray(x(1)*w(4) + w(2)));

y = purelin(z1*w(6)+z2*w(7)+w(5))

z1 = sigmoid(dlarray(x(2)*w(3) + w(1)));
z2 = sigmoid(dlarray(x(2)*w(4) + w(2)));

y = purelin(z1*w(6)+z2*w(7)+w(5))
