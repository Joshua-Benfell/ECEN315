clear
clf

G = tf(6, [1 7 6 0]);
C = [4, 5, 6, 7, 8];

Legend = cell(length(C), 1);
i = 1;
figure(1)
hold on
for a = C
   sys = feedback(series(a, G), 1);
   step(sys, 40);
   Legend{i} = strcat(num2str(a), 'V Step');
   i = i + 1;
end
hold off
legend(Legend)

figure(2)
subplot(1,2,1)
H = feedback(series(tf(1, [1 -1]),  G), 1);
step(H, 10);
title("Step Response with Controller $$C = +\frac{1}{s-1}$$",'interpreter','latex')
subplot(1,2,2);
pzmap(H);
