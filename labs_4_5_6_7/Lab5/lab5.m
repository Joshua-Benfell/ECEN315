clear
close all

sys = tf([0,0,0,0,360.030121478794], [1,11.5758154704500,84.2362155121299,470.992803495151,1178.09505338830])%From Lab 3
sys =  sys * 1/4 * 0.228 * 180/pi

kp = 0.38;
ki = 1.87;
kd = -0.04;
%ki = 2.81;
%I = tf([1 ki/kp], 1);
%G = tf(1, [1 0]);pi/180
s = tf('s');
%compensated = kp * I * G * sys;
compensated = (kd * s + kp + ki/s) * sys;
feedbackSys = feedback(compensated,1);
%figure(1)
%t = 0.01: 0.01: 10;
%pzmap(feedbackSys)
figure(4)
step(20 * feedbackSys);
figure(5)
bode(sys)
hold on
bode(compensated)
bode((0.1*s + kp) * sys);
hold off
legend("Uncompensated", "PD Compensated K_D = -0.1", "PD Compensated K_p = 0.1")
%hold on 
%step(20 * pi/180 * sys)
%hold off1/
%figure(2)
figure(1)
rlocus(sys)
hold on
rlocus(compensated)
legend("Uncompensated", "PD Compensated")
hold off
figure(3)
rlocus(feedbackSys)

