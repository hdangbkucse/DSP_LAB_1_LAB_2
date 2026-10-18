clear; clc;

// ==================================================
// 1. DEFINE THE INPUT SIGNAL AND SYSTEMS
// ==================================================

// Original signal: x(n) = 1 for 0 <= n <= 3
function val=x_signal(n_val)
    if n_val >= 0 & n_val <= 3 then
        val = 1;
    else
        val = 0;
    end
endfunction

// Delayed input: x2(n) = x(n - 2)
function val=x2_signal(n_val)
    val = x_signal(n_val - 2);
endfunction

// System (b): T[x(n)] = x(n^2)
function val=y_b(n_val, is_x2)
    if is_x2 then
        val = x2_signal(n_val^2);
    else
        val = x_signal(n_val^2);
    end
endfunction

// System (c): T[x(n)] = x(n) - x(n - 1)
function val=y_c(n_val, is_x2)
    if is_x2 then
        val = x2_signal(n_val) - x2_signal(n_val - 1);
    else
        val = x_signal(n_val) - x_signal(n_val - 1);
    end
endfunction

// System (d): T[x(n)] = n*x(n)
function val=y_d(n_val, is_x2)
    if is_x2 then
        val = n_val * x2_signal(n_val);
    else
        val = n_val * x_signal(n_val);
    end
endfunction

// ==================================================
// 2. PLOTTING FUNCTIONS
// ==================================================
// Draw vertical stems and sample markers
function draw_discrete(n, signal, color_id, marker, plot_title)

    // Draw the vertical stems
    plot2d3(n, signal, color_id);

    // Overlay markers without clearing the stems
    ax = gca();
    ax.auto_clear = "off";
    plot(n, signal, marker);
    ax.auto_clear = "on";

    // Set axis limits
    ymin = min(signal);
    ymax = max(signal);
    margin = 0.1 * (ymax - ymin + 1);

    ax.data_bounds = [min(n), ymin - margin;
                      max(n), ymax + margin];

    xgrid();
    xtitle(plot_title, "Time Index n", "Amplitude");

endfunction


// Compare two signals using vertical stems
function draw_comparison(n, signal1, signal2, plot_title)

    // Draw the first signal
    plot2d3(n, signal1, 3);

    // Preserve the first signal while drawing the second
    ax = gca();
    ax.auto_clear = "off";
    plot2d3(n, signal2, 6);

    // Add markers to distinguish the two signals
    plot(n, signal1, "go");
    plot(n, signal2, "ms");

    ax.auto_clear = "on";

    // Use common axis limits for comparison
    ymin = min([signal1 signal2]);
    ymax = max([signal1 signal2]);
    margin = 0.1 * (ymax - ymin + 1);

    ax.data_bounds = [min(n), ymin - margin;
                      max(n), ymax + margin];

    xgrid();
    xtitle(plot_title, "Time Index n", "Amplitude");

    legend("y(n-2)", "T[x2(n)]");

endfunction
// ==================================================
// 3. CALCULATE THE SIGNALS
// ==================================================

// Include n = 6 to display all nonzero samples
n = -5:7;
N_len = length(n);

// Initialize signal vectors
x         = zeros(1, N_len);
x2        = zeros(1, N_len);
yb        = zeros(1, N_len);
yb_prime  = zeros(1, N_len);
y2b       = zeros(1, N_len);
yc        = zeros(1, N_len);
yc_prime  = zeros(1, N_len);
y2c       = zeros(1, N_len);
yd        = zeros(1, N_len);
yd_prime  = zeros(1, N_len);
y2d       = zeros(1, N_len);

// Evaluate all signals
for i = 1:N_len
    ni = n(i);
    
    // Original and delayed input
    x(i)  = x_signal(ni);
    x2(i) = x2_signal(ni);
    
    // System (b): y(n) = x(n^2)
    yb(i)       = y_b(ni, %F);
    yb_prime(i) = y_b(ni - 2, %F);
    y2b(i)      = y_b(ni, %T);
    
    // System (c): y(n) = x(n) - x(n - 1)
    yc(i)       = y_c(ni, %F);
    yc_prime(i) = y_c(ni - 2, %F);
    y2c(i)      = y_c(ni, %T);
    
    // System (d): y(n) = n*x(n)
    yd(i)       = y_d(ni, %F);
    yd_prime(i) = y_d(ni - 2, %F);
    y2d(i)      = y_d(ni, %T);
end

// ==================================================
// 4. FIGURE 1: SYSTEM (b), y(n) = x(n^2)
// ==================================================
scf(1);
clf();

subplot(3, 2, 1);
draw_discrete(n, x, 2, "bo", "(1) Input x(n)");

subplot(3, 2, 2);
draw_discrete(n, yb, 5, "ro", "(2) Output y(n) = x(n^2)");

subplot(3, 2, 3);
draw_discrete(n, yb_prime, 3, "go", "(3) Shifted Output y(n-2)");

subplot(3, 2, 4);
draw_discrete(n, x2, 6, "mo", "(4) Shifted Input x(n-2)");

subplot(3, 2, 5);
draw_discrete(n, y2b, 1, "ko", "(5) Output T[x2(n)]");

subplot(3, 2, 6);
draw_comparison(n, yb_prime, y2b, ...
    "(6) Compare y(n-2) and T[x2(n)]");
// ==================================================
// 5. FIGURE 2: SYSTEM (c), y(n) = x(n)-x(n-1)
// ==================================================
scf(2);
clf();

subplot(3, 2, 1);
draw_discrete(n, x, 2, "bo", "(1) Input x(n)");

subplot(3, 2, 2);
draw_discrete(n, yc, 5, "ro", ...
    "(2) Output y(n) = x(n)-x(n-1)");

subplot(3, 2, 3);
draw_discrete(n, yc_prime, 3, "go", ...
    "(3) Shifted Output y(n-2)");

subplot(3, 2, 4);
draw_discrete(n, x2, 6, "mo", "(4) Shifted Input x(n-2)");

subplot(3, 2, 5);
draw_discrete(n, y2c, 1, "ko", ...
    "(5) Output T[x2(n)]");

subplot(3, 2, 6);
draw_comparison(n, yc_prime, y2c, ...
    "(6) Compare y(n-2) and T[x2(n)]");

// ==================================================
// 6. FIGURE 3: SYSTEM (d), y(n) = n*x(n)
// ==================================================
scf(3);
clf();

subplot(3, 2, 1);
draw_discrete(n, x, 2, "bo", "(1) Input x(n)");

subplot(3, 2, 2);
draw_discrete(n, yd, 5, "ro", ...
    "(2) Output y(n) = n*x(n)");

subplot(3, 2, 3);
draw_discrete(n, yd_prime, 3, "go", ...
    "(3) Shifted Output y(n-2)");

subplot(3, 2, 4);
draw_discrete(n, x2, 6, "mo", "(4) Shifted Input x(n-2)");

subplot(3, 2, 5);
draw_discrete(n, y2d, 1, "ko", ...
    "(5) Output T[x2(n)]");

subplot(3, 2, 6);
draw_comparison(n, yd_prime, y2d, ...
    "(6) Compare y(n-2) and T[x2(n)]");
