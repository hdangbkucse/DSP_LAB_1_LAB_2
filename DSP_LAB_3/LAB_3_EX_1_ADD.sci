
clear;
clc;

// Define the discrete-time signal
function val = x_signal(n_val)
    if n_val >= -3 & n_val <= -1 then
        val = 1 + (n_val / 3);
    elseif n_val >= 0 & n_val <= 3 then
        val = 1;
    else
        val = 0;
    end
endfunction

// Generate the time indices
n = -10:10;
x = zeros(1, length(n));
y_b1 = zeros(1,length(n));
y_b2 = zeros(1, length(n));
y_c = zeros(1, length(n))
// Calculate the signal samples
for i = 1:length(n)
    x(i) = x_signal(n(i));
    y_b1(i) = x_signal(4-n(i));
    y_b2(i) = x_signal(-4-n(i));
    y_c = x_signal(4-n(i))
end

// Plot the discrete-time signal
scf(0);
clf();

// Part (a): Original signal
subplot(2, 2, 1);
plot2d3(n, x, 2);
xgrid();
xtitle("Part (a): Original Signal x(n)", ...
       "Time Index n", "Amplitude");
ax = gca();
ax.data_bounds = [-8, -0.1; 8, 1.1];

// Part (b1): Fold, then delay
subplot(2, 2, 2);
plot2d3(n, y_b1, 2);
xgrid();
xtitle("Part (b1): Fold, Then Delay by 4", ...
       "Time Index n", "Amplitude");
ax = gca();
ax.data_bounds = [-8, -0.1; 8, 1.1];

// Part (b2): Delay, then fold
subplot(2, 2, 3);
plot2d3(n, y_b2, 2);
xgrid();
xtitle("Part (b2): Delay by 4, Then Fold", ...
       "Time Index n", "Amplitude");
ax = gca();
ax.data_bounds = [-8, -0.1; 8, 1.1];

// Part (c): x(-n + 4)
subplot(2, 2, 4);
plot2d3(n, y_c, 2);
xgrid();
xtitle("Part (c): Signal x(-n + 4)", ...
       "Time Index n", "Amplitude");
ax = gca();
ax.data_bounds = [-8, -0.1; 8, 1.1];
