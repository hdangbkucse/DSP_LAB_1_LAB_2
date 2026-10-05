clf
//1.2.1
subplot(3,1,1)
range_t = linspace(0,0.1,1000)
x_a = 3*sin(100*%pi*range_t)
plot(range_t, x_a)
xtitle("Analog Signal", "Time(s)", "Amplitude")
xgrid()

//1.2.2
subplot(3,1,2)
n = 0:30
x_n = 3*sin((%pi * n)/3)
plot2d3(n, x_n)
plot(n, x_n, "ro")
xtitle("Discrete-Time Signal", "n", "Amplitude")
xgrid()

//1.2.3
subplot(3,1,3)
delta = 0.1
x_quantization = floor(x_n/delta)*delta
plot2d3(n, x_quantization)
plot(n, x_quantization, "bo")
xtitle("Quantized Signal", "n", "Amplitude")
xgrid()



