clear

sys = tf([0,0,0,0,360.030121478794], [1,11.5758154704500,84.2362155121299,470.992803495151,1178.09505338830])%From Lab 3
feedbackSys = feedback(sys,1)
pzmap(feedbackSys)
step(feedbackSys)
hold on 
step(sys)
hold off
rlocus(sys)