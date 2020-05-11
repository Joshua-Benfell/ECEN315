clear
clf

G = tf(6, [1 7 6 0]);
%C = pidtool(G, 'p');
%After manually tuning with pidtool, this value was the first that gave no
%overshoot.
%C = 0.252510468359574;
%C = 0.229638
C = 7.01;
figure(1)
subplot(1,2,1)
sys = feedback(C * G, 1)
step(sys, 200);
subplot(1,2,2)
pzmap(sys)
damp(sys)
