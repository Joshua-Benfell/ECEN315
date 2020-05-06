%Script for ECEN315 Lab 2
clear
clf
R_a = 6.3; %Ohms
L_a = 0.797; %H
K_b = 0.0043; %Vs/rad
K_t = K_b; %Nm/A
D_m = 0.00000553; %Nms/rad
J_m = 0.00000241; %Kgm^2

numerator = K_t/(L_a*J_m);
sSqCoef = 1;
sCoef = (L_a * D_m + R_a * J_m)/(L_a * J_m);
coef3 = (R_a * D_m + K_t * K_b)/(L_a * J_m);

sys = tf(numerator , [sSqCoef sCoef coef3])
stepCoefs = [1 2 3 4 5 6];
steps = 6;

Legend = cell(steps, 1);

for i = 1:steps
   step(i * sys, 10)
   hold on
   Legend{i} = strcat(num2str(i), 'V Step');
end
hold off
ylabel("\omega_m (rad/s)");
xlabel("Time (s)");
title("Step Response of the Motor");
legend(Legend)

stepResponseInfo = stepinfo(stepCoefs.*sys)%, 'SettlingTimeThreshold', 0.000005); %Include this setting to know approx when oscillation ends

%units of steady state gains rad/Vs
Gain = numerator/coef3
steadyStateValue = Gain * stepCoefs

SettlingTime = [stepResponseInfo(1:6).SettlingTime] %The inductance of the motor is likely too high which is causing the critical damping/overdamping and thus quick settling time.
%steadyStateValue = [stepResponseInfo(1:6).Peak]
%steadyStateGain = [stepResponseInfo(1:6).Peak] ./ stepCoefs %Not sure about this method