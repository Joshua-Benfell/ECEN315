clear
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

sys = tf(numerator , [sSqCoef sCoef coef3]);
stepCoefs = [1 2 3 4 5 6];
step(stepCoefs.*sys);
[Y, T] = step(stepCoefs.*sys);
ylabel("\omega_m");

stepResponseInfo = stepinfo(stepCoefs.*sys,'RiseTimeThreshold',[0 1-exp(-1)]) %RiseTimeThreshold changes this to find time between 0% and 63% which is the time constant
%Not sure about this method for time constant

steadyStateGain = [stepResponseInfo(1:6).Peak] ./ stepCoefs %Not sure about this method
%units of steady state gains rad/Vs