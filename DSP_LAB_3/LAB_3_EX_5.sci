
clear;
clc;

function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)

    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;

    nmin = min([n1(1), n2(1)]);
    nmax = max([n1($), n2($)]);

    x1_initial = zeros(1, nmax - nmin + 1);
    x2_initial = zeros(1, nmax - nmin + 1);

    idx1 = n1 - nmin + 1;
    x1_initial(idx1) = x1n;

    idx2 = n2 - nmin + 1;
    x2_initial(idx2) = x2n
    
    yn = x1_initial .* x2_initial

    yorigin = 1 - nmin;

endfunction

x1n = [0, 1, 3, -2];
x1origin = 1;

x2n = [1, 1, 2, 3];
x2origin = 2;

[yn, yorigin] = multi(x1n, x1origin, x2n, x2origin);

n1 = (1:length(x1n)) - x1origin;
n2 = (1:length(x2n)) - x2origin;

nmin = min([n1(1), n2(1)]);
n = nmin:(nmin + length(yn) - 1);

x1plot = zeros(1, length(n));
x2plot = zeros(1, length(n));

idx1 = n1 - nmin + 1;
idx2 = n2 - nmin + 1;

x1plot(idx1) = x1n;
x2plot(idx2) = x2n;

// Plot x1(n)
clf();

subplot(3, 1, 1);
plot2d3(n, x1plot);
title("Signal x1(n)");
xlabel("Time n");
ylabel("Amplitude");
xgrid();

// Plot x2(n)
subplot(3, 1, 2);
plot2d3(n, x2plot);
title("Signal x2(n)");
xlabel("Time n");
ylabel("Amplitude");
xgrid();

// Plot y(n)
subplot(3, 1, 3);
plot2d3(n, yn);
title("Output Signal y(n) = x1(n) * x2(n)");
xlabel("Time n");
ylabel("Amplitude");
xgrid();
