clear
W = linspace(0.001*2*pi, 100*2*pi, 10000);
H = freqs([200 0], [140 203 30], W);
figure(1)
semilogx(W./(2*pi), 20*log10(abs(H)))
grid on
xlabel("Freq (Hz)")
ylabel("Magnitude (dB)")
title("Frequency Response")

sys = tf([200 0], [140 203 30]);
[Y,T] = step(sys);
figure(2)
subplot(1,2,1)
plot(T,Y)
title("Theoretical Step Response")
xlabel("Time (s)")
ylabel("V_{o} (V)")

subplot(1,2,2)
title("Numerical Step Response")
xlabel("Time (s)")
ylabel("V_{o} (V)")
stepFunction = (1: T >= 0)