clear; clc;

gamma1 = 0.265; gamma2 = -0.995; gamma3 = 0.882;
gamma = [gamma1 gamma2 gamma3];
maxG = max(gamma);
epsilon = abs((0.1)./(maxG));
from = 0; to = 50;
tspan = [from,to];

%situation 1: (stable)
figure(1)
omega1 = 1; omega3 = epsilon; omega2 = omega3; 
startOmega = [omega1, omega2, omega3];
[t,y1] = ode45(@(t,o) func(t,o,gamma(1), gamma(2), gamma(3)), tspan, startOmega);
plot(t, y1(:,1),t,y1(:,2),t,y1(:,3));
legend('\omega_{1}','\omega_{2}','\omega_{3}')
title('1: Stable')
xlabel('time (seconds)')
ylabel('eigenvalues')

%situation 2: (unstable)
figure(2)
hold on
omega1 = epsilon; omega3 = epsilon; omega2 = 1; 
startOmega = [omega1, omega2, omega3];
[t,y2] = ode45(@(t,o) func(t,o,gamma(1), gamma(2), gamma(3)), tspan, startOmega);
plot(t, y2(:,1),t,y2(:,2),t,y2(:,3));
legend('\omega_{1}','\omega_{2}','\omega_{3}')
title('2: Unstable')
xlabel('time (seconds)')
ylabel('eigenvalues')

% eigenvalues stable
tempSize = size(y1(:,1));
loopSize = tempSize(1,1);
eigs1 = [];
times1 = [];
smallTime = (to)./(loopSize);
time = 0;
for i = 1:loopSize    
times1 = [times1, time];
omega1 = y1(i,1); omega2= y1(i,2); omega3 = y1(i,3);     
omega = [omega1, omega2, omega3];
J = [0,gamma(1).*omega(3), gamma(1).*omega(2);
     gamma(2).*omega(3), 0, gamma(2).*omega(1);
     gamma(3).*omega(2), gamma(3).*omega(1), 0];
E1 = eig(J);
realEig = real(E1);
maxE = max(realEig);
time = time + smallTime;
eigs1 = [eigs1, maxE];
end

figure(3)
plot(times1, eigs1);
xlabel('time (seconds)')
ylabel('maximal real eigenvalue')
title('Stable: eigenvalues')

%eigenvalues unstable
tempSize = size(y2(:,1));
loopSize = tempSize(1,1);
eigs2 = [];
times2 = [];
smallTime = (to)./(loopSize);
time = 0;
for j = 1:loopSize    
times2 = [times2, time];
omega1 = y2(j,1); omega2= y2(j,2); omega3 = y2(j,3);     
omega = [omega1, omega2, omega3];
J = [0,gamma(1).*omega(3), gamma(1).*omega(2);
     gamma(2).*omega(3), 0, gamma(2).*omega(1);
     gamma(3).*omega(2), gamma(3).*omega(1), 0];
E2 = eig(J);
realEig = real(E2);
maxE = max(realEig);
time = time + smallTime;
eigs2 = [eigs2, maxE];
end

figure(4)
plot(times2, eigs2);
xlabel('time (seconds)')
ylabel('maximal real eigenvalue')
title('Unstable: eigenvalues')

%% interference stable

gamma1 = 0.265; gamma2 = -0.995; gamma3 = 0.882;
gamma = [gamma1 gamma2 gamma3];
maxG = max(gamma);
epsilon = abs((0.1)./(maxG));
from = 0; to = 50;
tspan = [from,to];

%situation 1: (stable)
figure(1)
omega1 = 1; omega3 = epsilon; omega2 = omega3; 
startOmega = [omega1, omega2, omega3];
[t,y1] = ode45(@(t,o) func(t,o,gamma(1), gamma(2), gamma(3)), tspan, startOmega);
% plot(t, y1(:,1),t,y1(:,2),t,y1(:,3));
plot(t,y1(:,1), 'Color',[0.4940, 0.1840, 0.5560]);
hold on
plot(t,y1(:,2), 'Color',[0.9290, 0.6940, 0.1250]);
hold on
plot(t,y1(:,3), 'Color',[0, 0.4470, 0.7410]);
legend('\omega_{1}','\omega_{2}','\omega_{3}')
title('1: Stable')
xlabel('time (seconds)')
ylabel('eigenvalues')

%situation 1: (stable interfered)
hold on
omega1 = (1+0.1); omega3 = (epsilon + 0.1); omega2 = (omega3 - 0.1); 
startOmega = [omega1, omega2, omega3];
[t,y1] = ode45(@(t,o) func(t,o,gamma(1), gamma(2), gamma(3)), tspan, startOmega);
% plot(t, y1(:,1),t,y1(:,2),t,y1(:,3));
plot(t,y1(:,1), 'Color',[0.4940, 0.1840, 0.5560]);
hold on
plot(t,y1(:,2), 'Color',[0.9290, 0.6940, 0.1250]);
hold on
plot(t,y1(:,3), 'Color',[0, 0.4470, 0.7410]);
legend('\omega_{1}','\omega_{2}','\omega_{3}')
title('1: Stable interfered')
xlabel('time (seconds)')
ylabel('eigenvalues')

%eigenvalues stable
tempSize = size(y1(:,1));
loopSize = tempSize(1,1);
eigs1 = [];
times1 = [];
smallTime = (to)./(loopSize);
time = 0;
for i = 1:loopSize    
times1 = [times1, time];
omega1 = y1(i,1); omega2= y1(i,2); omega3 = y1(i,3);     
omega = [omega1, omega2, omega3];
J = [0,gamma(1).*omega(3), gamma(1).*omega(2);
     gamma(2).*omega(3), 0, gamma(2).*omega(1);
     gamma(3).*omega(2), gamma(3).*omega(1), 0];
E1 = eig(J);
realEig = real(E1);
maxE = max(realEig);
time = time + smallTime;
eigs1 = [eigs1, maxE];
end

% figure (2)
% plot(times1, eigs1);
% xlabel('time (seconds)')
% ylabel('maximal real eigenvalue')
% title('Stable: eigenvalues')

%eigenvalues stable interfered
tempSize = size(y1(:,1));
loopSize = tempSize(1,1);
eigs1 = [];
times1 = [];
smallTime = (to)./(loopSize);
time = 0;
for i = 1:loopSize    
times1 = [times1, time];
omega1 = y1(i,1); omega2= y1(i,2); omega3 = y1(i,3);     
omega = [omega1, omega2, omega3];
J = [0,gamma(1).*omega(3), gamma(1).*omega(2);
     gamma(2).*omega(3), 0, gamma(2).*omega(1);
     gamma(3).*omega(2), gamma(3).*omega(1), 0];
E1 = eig(J);
realEig = real(E1);
maxE = max(realEig);
time = time + smallTime;
eigs1 = [eigs1, maxE];
end

% figure(4)
% plot(times1, eigs1);
% xlabel('time (seconds)')
% ylabel('maximal real eigenvalue')
% title('Stable interfered: eigenvalues')

%% interference unstable

gamma1 = 0.265; gamma2 = -0.995; gamma3 = 0.882;
gamma = [gamma1 gamma2 gamma3];
maxG = max(gamma);
epsilon = abs((0.1)./(maxG));
from = 0; to = 50;
tspan = [from,to];

%situation 2: (unstable)
figure(1)
omega1 = epsilon; omega3 = epsilon; omega2 = 1; 
startOmega = [omega1, omega2, omega3];
[t,y2] = ode45(@(t,o) func(t,o,gamma(1), gamma(2), gamma(3)), tspan, startOmega);
% plot(t, y2(:,1),t,y2(:,2),t,y2(:,3));
plot(t,y2(:,1), 'Color',[0.8500, 0.3250, 0.0980]);
hold on
plot(t,y2(:,2), 'Color',[0.4940, 0.1840, 0.5560]);
hold on
plot(t,y2(:,3), 'Color',[0, 0.4470, 0.7410]);
legend('\omega_{1}','\omega_{2}','\omega_{3}')
title('2: Unstable')
xlabel('time (seconds)')
ylabel('eigenvalues')

%situation 2: (unstable intered)
hold on
omega1 = (epsilon-0.1); omega3 = (epsilon+0.1); omega2 = (1+0.1); 
% omega1 = (epsilon-0.05); omega3 = (1-0.3); omega2 = (epsilon+0.2); 
startOmega = [omega1, omega2, omega3];
[t,y2] = ode45(@(t,o) func(t,o,gamma(1), gamma(2), gamma(3)), tspan, startOmega);
% plot(t, y2(:,1),t,y2(:,2),t,y2(:,3));
plot(t,y2(:,1), 'Color',[0.8500, 0.3250, 0.0980]);
hold on
plot(t,y2(:,2), 'Color',[0.4940, 0.1840, 0.5560]);
hold on
plot(t,y2(:,3), 'Color',[0, 0.4470, 0.7410]);
legend('\omega_{1}','\omega_{2}','\omega_{3}')
title('2: Unstable interfered')
xlabel('time (seconds)')
ylabel('eigenvalues')

%eigenvalues unstable
tempSize = size(y2(:,1));
loopSize = tempSize(1,1);
eigs2 = [];
times2 = [];
smallTime = (to)./(loopSize);
time = 0;
for j = 1:loopSize    
times2 = [times2, time];
omega1 = y2(j,1); omega2= y2(j,2); omega3 = y2(j,3);     
omega = [omega1, omega2, omega3];
J = [0,gamma(1).*omega(3), gamma(1).*omega(2);
     gamma(2).*omega(3), 0, gamma(2).*omega(1);
     gamma(3).*omega(2), gamma(3).*omega(1), 0];
E2 = eig(J);
realEig = real(E2);
maxE = max(realEig);
time = time + smallTime;
eigs2 = [eigs2, maxE];
end

% figure(2)
% plot(times2, eigs2);
% xlabel('time (seconds)')
% ylabel('maximal real eigenvalue')
% title('Unstable: eigenvalues')

%eigenvalues interfered
tempSize = size(y2(:,1));
loopSize = tempSize(1,1);
eigs2 = [];
times2 = [];
smallTime = (to)./(loopSize);
time = 0;
for j = 1:loopSize    
times2 = [times2, time];
omega1 = y2(j,1); omega2= y2(j,2); omega3 = y2(j,3);     
omega = [omega1, omega2, omega3];
J = [0,gamma(1).*omega(3), gamma(1).*omega(2);
     gamma(2).*omega(3), 0, gamma(2).*omega(1);
     gamma(3).*omega(2), gamma(3).*omega(1), 0];
E2 = eig(J);
realEig = real(E2);
maxE = max(realEig);
time = time + smallTime;
eigs2 = [eigs2, maxE];
end

% figure(4)
% plot(times2, eigs2);
% xlabel('time (seconds)')
% ylabel('maximal real eigenvalue')
% title('Unstable interfered: eigenvalues')

% 1) show graphs
% 2) The eigenvalues represent the powers of exponential functions,
%    when the exponential has a positive eigenvalue, then its contribution
%    does not decay onto a fixed point, instead the contribution grows. 
%    Thus its unstable. Contrary, negative power (eigenvalue), the
%    contribution decays onto a fixed point, thus is stable.
% 3) the interference is magnified in the unstable version
%    the max points of the eigenvalues are prolonged