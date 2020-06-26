clear
close all
time = 10;
simFile = 'lab6_sec_5__PID';
PIDSystem = 'lab6_sec_5__PID/CompensatedSystem';
load_system(simFile);
set_param(PIDSystem, 'Kp', '0.505');
set_param(PIDSystem, 'Ki', '0');
set_param(PIDSystem, 'Kd', '0');
figure(1)
hold on
range = -0.3:0.1:0.3;
txt = cell(length(range), 1);
allStepInfo= cell(length(range), 1);
count = 1;
for i = range
    txt{count} = strcat("K_d: ", num2str(i));
    set_param(PIDSystem, 'Kd', num2str(i));
    sim(simFile, time);
    plot(tout, pendulumStepResponse);
    allStepInfo{count} = stepinfo(pendulumStepResponse,tout);
    count = count + 1;    
end

hold off
legend(txt)
title('Step Response to various K_d Values and Input of 20^o')
ylabel('Angular Displacement')
xlabel('Time (s)')
