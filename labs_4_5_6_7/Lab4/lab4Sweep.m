clear
close all
time = 10;
simFile = 'lab4';
input = 'lab4/Subsystem';
figure(1)
hold on
load_system(simFile);
txt = cell(length(5:5:45), 1);
allStepInfo= cell(length(5:5:45), 1);
for i = 5:5:45
    txt{i/5} = strcat("Input Angle: ", num2str(i));
    set_param(input, 'angle', num2str(i))
    sim(simFile, time);
    plot(tout, pendulumStepResponse)
    allStepInfo{i/5} = stepinfo(pendulumStepResponse,tout)
end
hold off
legend(txt)
title('Step Repsonse for Various Input Angles')
ylabel('Angular Displacement')
xlabel('Time (s)')
figure(2)
title('Step Repsonse with and without error for set point of 20^o')
legend('No Error', 'Error');
ylabel('Angular Displacement')
xlabel('Time (s)')