clear
clf
figure(1)
subplot(1,2,1)
hold on
aVals = [1 2 4 8];
Legend = cell(length(aVals), 1);
StepInfo = cell(length(aVals), 1);
i = 1;
for a = aVals
   sys = tf(a, [1 4 a]);
   step(sys)
   StepInfo{i} = stepinfo(sys);
   Legend{i} = strcat(num2str(a), 'V Step');
   i = i + 1;
   damp(sys)
end
hold off
legend(Legend)

subplot(1,2,2)
hold on
for a = aVals
   sys = tf(a, [1 4 a]);
   pzmap(sys)
end
legend(Legend)