clear
time = 10;
simFile = 'lab6_sec_5__PID';
PIDSystem = 'lab6_sec_5__PID/CompensatedSystem';
load_system(simFile);
set_param(PIDSystem, 'Kp', '1');
%figure(1)
%hold on
%for i = 1:0.2:2
%    set_param(PIDSystem, 'Kp', num2str(i));
%    sim(simFile, time);
%    plot(tout, pendulumStepResponse);
%end
linearSystemAnalyzer(PIDSystem)