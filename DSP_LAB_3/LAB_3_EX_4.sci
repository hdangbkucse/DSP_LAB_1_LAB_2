
clear;
clc;

function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)

    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;

    nmin = min([n1(1), n2(1)]);
    nmax = max([n1($), n2($)]);

    yn = zeros(1, nmax - nmin + 1);

    idx1 = n1 - nmin + 1;
    yn(idx1) = yn(idx1) + x1n;

    idx2 = n2 - nmin + 1;
    yn(idx2) = yn(idx2) + x2n;

    yorigin = 1 - nmin;

endfunction

x1n = [0, 1, 3, -2];
x1origin = 1;

x2n = [1, 1, 2, 3];
x2origin = 2;

[yn, yorigin] = add(x1n, x1origin, x2n, x2origin);

n = (1:length(yn)) - yorigin;

x1plot = [0, 0, 1, 3, -2];
x2plot = [1, 1, 2, 3, 0];

clf();

subplot(3, 1, 1);
plot2d3(n, x1plot);
title("Signal x1(n)");
xlabel("Time n");
ylabel("Amplitude");
xgrid();

subplot(3, 1, 2);
plot2d3(n, x2plot);
title("Signal x2(n)");
xlabel("Time n");
ylabel("Amplitude");
xgrid();

subplot(3, 1, 3);
plot2d3(n, yn);
title("Output Signal y(n) = x1(n) + x2(n)");
xlabel("Time n");
ylabel("Amplitude");
xgrid();
