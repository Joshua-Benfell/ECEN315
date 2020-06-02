k=0.2;
T=0.8;

sys = tf(1, [1 5 20])
sys1 = tf(1, [1 20])

linearSystemAnalyzer(sys)