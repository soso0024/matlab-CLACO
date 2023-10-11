% Master1 CORO 
% Classical Control
% exercise 1 of lab1

clear all, close all, clc

disp('section 2.4')
disp('---------------------------------------------')

% ----- 変更箇所👇 ----- %

k=1;

% ξの値（ξ使えないから）
a = 0.4237;

wn1=1; wn2=2; wn3=5; wn4=10;

num1 = k * wn1^2;
den1 = [1, 2*a*wn1, wn1^2];
num2 = k * wn2^2;
den2 = [1, 2*a*wn2, wn2^2];
num3 = k * wn3^2;
den3 = [1, 2*a*wn3, wn3^2];
num4 = k * wn4^2;
den4 = [1, 2*a*wn4, wn4^2];

G1 = tf(num1, den1);
G2 = tf(num2, den2);
G3 = tf(num3, den3);
G4 = tf(num4, den4);

% ----- 変更箇所👆 ----- %


f1=figure(1);
set(f1,'position',[1    52   504   343])
subplot(121)
%bode(G1,G2,G3,G4);
bodemag(G1,G2,G3,G4);
legend('G1','G2','G3','G4')
subplot(122)
step(G1,G2,G3,G4)
legend('G1','G2','G3','G4')

wc1=bandwidth(G1);
wc2=bandwidth(G2);
wc3=bandwidth(G3);
wc4=bandwidth(G4);

S1 = stepinfo(G1,'SettlingTimeThreshold',0.05);
S2 = stepinfo(G2,'SettlingTimeThreshold',0.05);
S3 = stepinfo(G3,'SettlingTimeThreshold',0.05);
S4 = stepinfo(G4,'SettlingTimeThreshold',0.05);

disp(['Bandwith of G1 (T1=1) :',num2str(wc1)])
disp(['Bandwith of G2 (T2=5) :',num2str(wc2)])
disp(['Bandwith of G3 (T3=10) :',num2str(wc3)])
disp(['Bandwith of G4 (T4=50) :',num2str(wc4)])
disp(' ')
disp(['5% settling time of G1 (T1=1) :',num2str(S1.SettlingTime)])
disp(['5% settling time of G2 (T2=5) :',num2str(S2.SettlingTime)])
disp(['5% settling time of G3 (T3=10) :',num2str(S3.SettlingTime)])
disp(['5% settling time of G4 (T4=50) :',num2str(S4.SettlingTime)])
disp(' ')
