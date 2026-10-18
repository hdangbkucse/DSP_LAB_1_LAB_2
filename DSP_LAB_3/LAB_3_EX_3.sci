clear
clc

function [yn, y_origin] = fold(xn, x_origin)
    yn = xn($:-1:1);
    y_origin = length(xn) - x_origin + 1;
endfunction

xn = [0, -3, 1, 2]
x_origin = 2

[yn, y_origin] = fold(xn, x_origin);
nx = (1:length(xn)) - x_origin;
ny = (1:length(yn)) - y_origin;

clf();

subplot(2, 1, 1);
plot2d3(nx, xn);
title("Original Signal x(n)");
xlabel("Time n");
ylabel("Amplitude");
xgrid();

subplot(2, 1, 2);
plot2d3(ny, yn);
title("Fold Signal y(n) = x(-n)");
xlabel("Time n");
ylabel("Amplitude");
xgrid();

 
