clear
clc

function [yn, y_origin] = convolution(xn, x_origin, hn, h_origin)
    Nx = length(xn);
    Nh = length(hn);
    
    yn = zeros(1, Nh + Nx -1)
    
    for i = 1:Nx
        for j = 1:Nh
            yn(i+j-1) = yn(i+j-1) + xn(i) * hn(j);
        end
    end
    
    y_origin = x_origin + h_origin - 1;
endfunction

xn = [1, -2, 3, 6];
xorigin = 3;

hn = [1, 1, 2, 3];
horigin = 2;

[yn, yorigin] = convolution(xn, xorigin, hn, horigin);

nx = (1:length(xn)) - xorigin;
nh = (1:length(hn)) - horigin;
ny = (1:length(yn)) - yorigin;

xplot = zeros(1, length(yn));
hplot = zeros(1, length(yn));

idxX = nx - ny(1) + 1;
idxH = nh - ny(1) + 1;

xplot(idxX) = xn;
hplot(idxH) = hn;

// Plot the input signal x(n)
clf();

subplot(3, 1, 1);
plot2d3(ny, xplot);
title("Input Signal x(n)");
xlabel("Time n");
ylabel("Amplitude");
xgrid();

// Plot the impulse response h(n)
subplot(3, 1, 2);
plot2d3(ny, hplot);
title("Impulse Response h(n)");
xlabel("Time n");
ylabel("Amplitude");
xgrid();

// Plot the convolution output y(n)
subplot(3, 1, 3);
plot2d3(ny, yn);
title("Convolution Output y(n)");
xlabel("Time n");
ylabel("Amplitude");
xgrid();
