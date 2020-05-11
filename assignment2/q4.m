clear
clf

a = 1;
b = 8;
k = 10.8e8;
J = 10.8e8;

%a
controller = tf([k k*a], [1 b]);
spacecraft = tf(1, [J 0 0]);
sys = feedback(controller * spacecraft, 1);

percentages = [1 0.8 0.5];
i = 1;
figure(1)
hold on
Legend = cell(length(percentages),1);
for p = percentages
    spacecraft = tf(1, [J*p 0 0]);
    sys = feedback(controller * spacecraft, 1);
    step(10 * sys)
    Legend{i} = strcat(num2str(p), ' of J');
    i = i + 1;
end
legend(Legend);
ylabel("Actual Altitude \theta(t)")