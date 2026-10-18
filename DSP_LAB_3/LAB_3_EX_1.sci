//EX1
clear
clc

function[yn, y_origin]= delay(xn, x_origin, k)
    yn = xn;
    y_origin = x_origin - k;
endfunction

xn = [1,-2,3,6];
x_origin = 3;
k=1;

[yn, y_origin] = delay(xn, x_origin, k);

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
title("Delayed Signal y(n) = x(n-1)");
xlabel("Time n");
ylabel("Amplitude");
xgrid();
    
