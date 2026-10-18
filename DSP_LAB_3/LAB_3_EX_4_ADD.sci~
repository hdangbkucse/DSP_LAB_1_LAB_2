clear;
clc;

n = -2:2;

x_signal = [2,3,4,5,6];
x_minus_n = x_signal($:-1:1);


x_e = (x_signal + x_minus_n)/2;
x_o = (x_signal - x_minus_n)/2;

// Create one graphic window
scf(0);
clf();

// Plot 1: Original signal
subplot(3, 1, 1);
plot2d3(n, x_signal, 2);
xgrid();
xtitle("Original Signal x(n)", "Time Index n", "Amplitude");

// Plot 2: Even component
subplot(3, 1, 2);
plot2d3(n, x_e, 3);
xgrid();
xtitle("Even Component xe(n)", "Time Index n", "Amplitude");

// Plot 3: Odd component
subplot(3, 1, 3);
plot2d3(n, x_o, 5);
xgrid();
xtitle("Odd Component xo(n)", "Time Index n", "Amplitude");
