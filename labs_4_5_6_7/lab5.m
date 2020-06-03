clear

sys = tf([0,0,0,0,360.030121478794], [1,11.5758154704500,84.2362155121299,470.992803495151,1178.09505338830])%From Lab 3
sys = 1/4 * sys * 180/pi;
feedbackSys = feedback(sys,1)
figure(1)
%pzmap(feedbackSys)
%step(feedbackSys)
hold on 
step(20*sys)
hold off
figure(2)
rlocus(sys)