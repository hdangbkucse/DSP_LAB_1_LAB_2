
clear;
clc;

// Define the original signal from Figure P2.2
function val = x_signal(n_val)
    if n_val >= -1 & n_val <= 2 then
        val = 1;
    elseif n_val >= 3 & n_val <= 4 then
        val = 0.5;
    else
        val = 0;
    end
endfunction

// Generate the time indices
n = -5:7;
N = length(n);

// Initialize signal vectors
x   = zeros(1, N);
xa  = zeros(1, N);
xb  = zeros(1, N);
xc  = zeros(1, N);
xe1 = zeros(1, N);
xf  = zeros(1, N);
xrev = zeros(1, N);

// Calculate the original and transformed signals
for i = 1:N
    x(i) = x_signal(n(i));

    // (a) x(n - 2)
    xa(i) = x_signal(n(i) - 2);

    // (b) x(4 - n)
    xb(i) = x_signal(4 - n(i));

    // (c) x(n + 2)
    xc(i) = x_signal(n(i) + 2);

    // (e) x(n - 1), before multiplication by delta(n - 3)
    xe1(i) = x_signal(n(i) - 1);

    // (f) x(n^2)
    xf(i) = x_signal(n(i)^2);

    // x(-n), used for (g) and (h)
    xrev(i) = x_signal(-n(i));
end

// (d) x(n)u(2 - n)
xd = x .* bool2s(n <= 2);

// (e) x(n - 1)delta(n - 3)
xe = xe1 .* bool2s(n == 3);

// (g) Even component of x(n)
x_even = (x + xrev) / 2;

// (h) Odd component of x(n)
x_odd = (x - xrev) / 2;

// Create one figure with eight subplots
scf(0);
clf();

// (a) x(n - 2)
subplot(4, 2, 1);
plot2d3(n, xa, 2);
xgrid();
xtitle("(a) x(n - 2)", "n", "Amplitude");
ax = gca();
ax.data_bounds = [-5, -0.1; 7, 1.1];

// (b) x(4 - n)
subplot(4, 2, 2);
plot2d3(n, xb, 2);
xgrid();
xtitle("(b) x(4 - n)", "n", "Amplitude");
ax = gca();
ax.data_bounds = [-5, -0.1; 7, 1.1];

// (c) x(n + 2)
subplot(4, 2, 3);
plot2d3(n, xc, 2);
xgrid();
xtitle("(c) x(n + 2)", "n", "Amplitude");
ax = gca();
ax.data_bounds = [-5, -0.1; 7, 1.1];

// (d) x(n)u(2 - n)
subplot(4, 2, 4);
plot2d3(n, xd, 2);
xgrid();
xtitle("(d) x(n)u(2 - n)", "n", "Amplitude");
ax = gca();
ax.data_bounds = [-5, -0.1; 7, 1.1];

// (e) x(n - 1)delta(n - 3)
subplot(4, 2, 5);
plot2d3(n, xe, 2);
xgrid();
xtitle("(e) x(n - 1)delta(n - 3)", "n", "Amplitude");
ax = gca();
ax.data_bounds = [-5, -0.1; 7, 1.1];

// (f) x(n^2)
subplot(4, 2, 6);
plot2d3(n, xf, 2);
xgrid();
xtitle("(f) x(n^2)", "n", "Amplitude");
ax = gca();
ax.data_bounds = [-5, -0.1; 7, 1.1];

// (g) Even component
subplot(4, 2, 7);
plot2d3(n, x_even, 2);
xgrid();
xtitle("(g) Even Part of x(n)", "n", "Amplitude");
ax = gca();
ax.data_bounds = [-5, -0.1; 7, 1.1];

// (h) Odd component
subplot(4, 2, 8);
plot2d3(n, x_odd, 2);
xgrid();
xtitle("(h) Odd Part of x(n)", "n", "Amplitude");
ax = gca();
ax.data_bounds = [-5, -0.6; 7, 0.6];
