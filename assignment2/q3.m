sys1 = tf(26, [1 3 16]);
sys2 = tf(0.4, [1 0.02 0.04]);
sys3 = tf(1.07e7, [1 1.6e3 1.07e7]);
linearSystemAnalyzer(sys1, sys2, sys3);

[wn1, zeta1] = damp(sys1)
[wn2, zeta2] = damp(sys2)
[wn3, zeta3] = damp(sys3)