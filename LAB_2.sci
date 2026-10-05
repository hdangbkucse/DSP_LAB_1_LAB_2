clear

//ex2
n = -5:5;
msignal = bool2s(n>=0);
plot2d3(n, msignal)

//ex3
n = -5:5;
msignal = bool2s(n==0);
plot2d3(n, msignal)

//ex4
n = -5:5
msignal = bool2s(n>=0)
ur = n.*msignal
plot2d3(n, ur)
title("Unit Ramp Signal ur(n)");
xlabel("Time n");
ylabel("Amplitude");


clear;
clc;

// Exercise 5
n = -1:1;
x = [1, 3, -2];

// Time reversal
x_reverse = x($:-1:1);

// Even and odd components
xo = 0.5 * (x - x_reverse);
xe = 0.5 * (x + x_reverse);

clf;

// Original signal
subplot(3, 1, 1);
plot2d3(n, x);
title("Original Signal x(n)");
xlabel("Time n");
ylabel("Amplitude");

a = gca();
a.data_bounds = [-1.2, -2.5; 1.2, 3.5];

// Even component
subplot(3, 1, 2);
plot2d3(n, xe);
title("Even Signal Component xe(n)");
xlabel("Time n");
ylabel("Amplitude");

a = gca();
a.data_bounds = [-1.2, -1; 1.2, 3.5];

// Odd component
subplot(3, 1, 3);
plot2d3(n, xo);
title("Odd Signal Component xo(n)");
xlabel("Time n");
ylabel("Amplitude");

a = gca();
a.data_bounds = [-1.2, -2; 1.2, 2];

//ex6
clear
clc

n1 = 0:3;
x1 = [0, 0, 1, 3, -2];

n2 = -1:2;
x2 = [0, 0, 1, 2, 3];

n = -1:3
y = x1 + x2

// Plot x1(n)
clf;
subplot(3, 1, 1);
plot2d3(n, x1);
title("Signal x1(n)");
xlabel("Time n");
ylabel("Amplitude");
xgrid();

// Plot x2(n)
subplot(3, 1, 2);
plot2d3(n, x2);
title("Signal x2(n)");
xlabel("Time n");
ylabel("Amplitude");
xgrid();

// Plot y(n)
subplot(3, 1, 3);
plot2d3(n, y);
title("Output Signal y(n) = x1(n) + x2(n)");
xlabel("Time n");
ylabel("Amplitude");
xgrid();

//ex 7
clear;
clc;

// Define the common time axis
n = -1:3;

// Define the two signals on the common time axis
x1 = [0, 0, 1, 3, -2];
x2 = [0, 1, 2, 3, 0];

// Multiply the two signals sample by sample
y = x1 .* x2;

// Plot x1(n)
clf;
subplot(3, 1, 1);
plot2d3(n, x1);
title("Signal x1(n)");
xlabel("Time n");
ylabel("Amplitude");
xgrid();

// Plot x2(n)
subplot(3, 1, 2);
plot2d3(n, x2);
title("Signal x2(n)");
xlabel("Time n");
ylabel("Amplitude");
xgrid();

// Plot y(n)
subplot(3, 1, 3);
plot2d3(n, y);
title("Output Signal y(n) = x1(n) * x2(n)");
xlabel("Time n");
ylabel("Amplitude");
xgrid();




