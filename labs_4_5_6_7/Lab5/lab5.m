clear

sys = tf([0,0,0,0,360.030121478794], [1,11.5758154704500,84.2362155121299,470.992803495151,1178.09505338830])%From Lab 3
sys =  sys * 1/4 * 0.228

kp = 0.5;
kd = -0.5;
%ki = 2.81;
%I = tf([1 ki/kp], 1);
%G = tf(1, [1 0]);pi/180
s = tf('s');
%compensated = kp * I * G * sys;
compensated = (s*kd + kp) * sys;
feedbackSys = feedback(compensated,1);
%figure(1)
%t = 0.01: 0.01: 10;
%pzmap(feedbackSys)
%step(20 * feedbackSys * pi/180 )
%hold on 
%step(20 * pi/180 * sys)
%hold off1/
%figure(2)
figure(1)
rlocus(sys)
figure(2)
rlocus(compensated)
figure(3)
rlocus(feedbackSys)

