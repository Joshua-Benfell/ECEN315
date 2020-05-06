d0 = tf(1.0,[1 0 1]) %undamped
d1 = tf(1.0,[1 2 1]) %critically damped
d2 = tf(4.0,[1 2 4]) %under damped
d3 = tf(0.5,[1 2 0.5]) %over damped
T= [0: 0.01: 20];%set up the time increments
[y0,t]=step(d0,T);%step response over one second
[y1,t]=step(d1,T);%step response over one second
[y2,t]=step(d2,T);%step response over one second
[y3,t]=step(d3,T);%step response over one second
stept = 1 + 0*t; %graph to show step response
clf; %clear all graphs
figure(1)
 % put each graph on top of each other
plot(t,y0, 'r');
hold on
plot(t,y1,'k');
plot(t,y2,'g');
plot(t,y3,'b');
plot(t,stept,'m');
hold off
stf = feedback(series(1/25, tf(1,[4 0])),1)
figure(2)
subplot(1,2,1);
[x,t] =step(stf);
thy=1-exp(-0.01*t);
plot(t,x,t,thy,'*');
subplot(1,2,2);
bode(stf);