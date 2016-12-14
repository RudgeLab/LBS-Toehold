A= xlsread ('posteriordataA.xlsx');
figure()

scatter(Iteration, K0)
hold on
scatter(Iteration,K1)
scatter(Iteration,K2)
scatter(Iteration,K3)
scatter(Iteration,K4)
scatter(Iteration,K5)
%legend('K1','K2','K3','K4','K5','K6')
legend('S1YC','S1YC+IPTG','S1YC+T LOW','S1YC+T LOW+ IPTG','S1YC+T HIGH','S1YC+T HIGH+ IPTG')
title('K vs Iteration')

ylabel('K')
xlabel('Iteration')
figure()
scatter(Likelihood,K0)
hold on
scatter(Likelihood,K2)
scatter(Likelihood,K4)
scatter(Likelihood,K1)
scatter(Likelihood,K3)
scatter(Likelihood,K5)
%legend('K1','K2','K3','K4','K5','K6')
legend('S1YC','S1YC+IPTG','S1YC+T LOW','S1YC+T LOW+ IPTG','S1YC+T HIGH','S1YC+T HIGH+ IPTG')
title('K vs likelihood')

ylabel('K')
xlabel('Likelihood')


figure()

scatter(Iteration, r0)
hold on
scatter(Iteration,r1)
scatter(Iteration,r2)
scatter(Iteration,r3)
scatter(Iteration,r4)
scatter(Iteration,r5)
%legend('R1','R2','R3','R4','R5','R6')
legend('S1YC','S1YC+IPTG','S1YC+T LOW','S1YC+T LOW+ IPTG','S1YC+T HIGH','S1YC+T HIGH+ IPTG')
title('R vs Iteration')

ylabel('R')
xlabel('Iteration')

figure()
scatter(Likelihood,r0)
hold on
scatter(Likelihood,r1)
scatter(Likelihood,r2)
scatter(Likelihood,r3)
scatter(Likelihood,r4)
scatter(Likelihood,r5)
%legend('R1','R2','R3','R4','R5','R6')
legend('S1YC','S1YC+IPTG','S1YC+T LOW','S1YC+T LOW+ IPTG','S1YC+T HIGH','S1YC+T HIGH+ IPTG')
title('R vs likelihood')

ylabel('R')
xlabel('Likelihood')


figure()
scatter(r0,K0)
hold on
scatter(r1,K1)
scatter(r2,K2)
scatter(r3,K3)
scatter(r4,K4)
scatter(r5,K5)
legend('S1YC','S1YC+IPTG','S1YC+T LOW','S1YC+T LOW+ IPTG','S1YC+T HIGH','S1YC+T HIGH+ IPTG')
title('K vs R')

ylabel('K')
xlabel('R')

figure()
histogram(r0)
figure()
histogram(r1)
figure()
histogram(r2)
figure()
histogram(r3)
figure()
histogram(r4)
figure()
histogram(r5)
%legend('S1YC','S1YC+IPTG','S1YC+T LOW','S1YC+T LOW+ IPTG','S1YC+T HIGH','S1YC+T HIGH+ IPTG')
title('R Distributions')

figure()
histogram(K0)
hold on
histogram(K1)
histogram(K2)
histogram(K3)
histogram(K4)
histogram(K5)
title('K Distributions')

legend('S1YC','S1YC+IPTG','S1YC+T LOW','S1YC+T LOW+ IPTG','S1YC+T HIGH','S1YC+T HIGH+ IPTG')

