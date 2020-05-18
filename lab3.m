% MATLAB Code for Lab 3
% Finding Coefficients from un-driven Damped pendulum
clear
clf

m = 0.168; %kg
g = 9.81;  %m/s^2
d = 0.14; %m distance from pivot to cog
r = 0.165; %m length of pendulum arm
T = 0.97; %Period in seconds
f = 1/T; %freq
w = 2*pi*f; %angular frequency

data = readtable("Data.csv"); % load csv data

figure(1)
plot(data.Var1, data.Var2); % plot csv data
xlabel("Time (s)")
ylabel("y(t)")

positiveValues = abs(data.Var2); % make all peaks positive

[peaks, locs] = findpeaks(positiveValues); % find all peaks
peaksTable = table(data.Var1(locs), peaks); % convert to table

hold on
plot(peaksTable.Var1, peaksTable.peaks); % plot line connecting all peaks
hold off

%Fitting coefficients to the function
modelfun = @(b,x) b(1)*exp(-b(2).*x(:, 1)); % function to model
beta0 = [200, 1]; % initial Guesses
model = fitnlm(peaksTable, modelfun, beta0); % the non-linear model we get out
coefs = model.Coefficients{:, 'Estimate'}; % Coefficients we are looking for


A = coefs(1); % Our A coefficient
B = coefs(2); % Our B coefficient

J_p = (m*d*g) / (power(w,2)+power(B,2)) % moment of inertia we are looking for
c = 2 * B * J_p % damping coeff we are looking for

% Transfer Function

numerator = 1/J_p;
coefB = c/J_p;
coefC = (d*m*g)/J_p;

sys = tf(numerator, [1, coefB, coefC])
figure(2)
step(sys)


% Combined Transfer function
% Lab 2 Transfer Function
R_a = 6.3; %Ohms
L_a = 0.797; %H
K_b = 0.0043; %Vs/rad
K_t = K_b; %Nm/A
D_m = 0.00000553; %Nms/rad
J_m = 0.00000241; %Kgm^2

numeratorLab2 = K_t/(L_a*J_m);
coefALab2 = 1;
coefBLab2 = (L_a * D_m + R_a * J_m)/(L_a * J_m);
coefCLab2 = (R_a * D_m + K_t * K_b)/(L_a * J_m);

sysLab2 = tf(numeratorLab2 , [coefALab2 coefBLab2 coefCLab2]);
ylabel("\theta (rads)")

K_p = 0.0053;

sys3 = sysLab2 * sys * K_p * r
Leg = cell(3, 1);
figure(3)
hold on
for i = 3:5
    step(i * sys3);
    Leg{i-2} = strcat(num2str(i), 'V Step');
end
hold off
ylabel("\theta (rads)")
legend(Leg)

linearSystemAnalyzer(sys3 .* [3 4 5])

figure(4)
pzmap(sys3)


%Algebra
algFourth = J_p * J_m * L_a;
algNum = K_t * K_p * r / algFourth;
algThird = (J_m * J_p * R_a + J_p * D_m * L_a + J_m * L_a * c) / algFourth;
algSecond = (R_a * D_m * J_p + K_t * K_b * J_p + J_m * R_a * c + D_m * L_a * c + d * m * g * J_m * L_a) / algFourth;
algFirst = (R_a * D_m * c + K_t * K_b * c + d * m * g * J_m * R_a + d * m * g * D_m * L_a) / algFourth;
algZeroth = (d * m * g * R_a * D_m + d * m * g * K_t * K_b) / algFourth;

algSys = tf(algNum, [1 algThird algSecond algFirst algZeroth])
