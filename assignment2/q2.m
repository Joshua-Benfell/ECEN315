clear 
clf
%a
sys = tf(0.0425, [1 2.45 0]); % Angular Displacement
step(5 * sys, 10);
%Graph is pretty much a ramp
%This makes sense as the motor shaft will continue to spin while powered.
%If we were to plot between -180 and 180 we would see this loop around like
%a sawtooth wave
hold on
%b
%Angular Velocity, so have to differentiate the TF i.e. multiply by s
sys2 = tf(0.0425, [1 2.45]);
step(5 * sys2);
% steady state is 0.0867 rads/sec
legend("Angular Displacement TF", "Angular Velocity TF")
