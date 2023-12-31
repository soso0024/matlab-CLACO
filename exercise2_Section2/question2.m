% Master1 CORO 
% Classical Control
% exercise 1 of lab1

clear all, close all, clc

disp('section 2.2')
disp('---------------------------------------------')

% ----- 変更箇所👇 ----- %

k=1;

% ξの値（ξ使えないから）
a1 = 0.2;
a2 = 0.4237;
a3 = 0.707;
a4 = 1;

wn=1;

num1 = k * wn^2;
den1 = [1, 2*a1*wn, wn^2];
num2 = k * wn^2;
den2 = [1, 2*a2*wn, wn^2];
num3 = k * wn^2;
den3 = [1, 2*a3*wn, wn^2];
num4 = k * wn^2;
den4 = [1, 2*a4*wn, wn^2];

G1 = tf(num1, den1);
G2 = tf(num2, den2);
G3 = tf(num3, den3);
G4 = tf(num4, den4);

f1=figure(1);

% 作成した図の位置とサイズを設定
set(f1,'position',[1   462   504   343])

subplot(211)

% step 関数を使用して、各制御システム G1、G2、G3、G4 のステップ応答を計算し、これらのステップ応答を同じ図にプロット
step(G1,G2,G3,G4);

legend('G1','G2','G3','G4')
subplot(212)
pzmap(G1,G2,G3,G4)
legend('G1','G2','G3','G4')

% ----- 変更箇所👆 ----- %

S1 = stepinfo(G1,'SettlingTimeThreshold',0.05);
S2 = stepinfo(G2,'SettlingTimeThreshold',0.05);
S3 = stepinfo(G3,'SettlingTimeThreshold',0.05);
S4 = stepinfo(G4,'SettlingTimeThreshold',0.05);

disp(['5% settling time of G1 (ξ1=1) :',num2str(S1.SettlingTime)])
disp(['5% settling time of G2 (ξ2=2) :',num2str(S2.SettlingTime)])
disp(['5% settling time of G3 (ξ3=5) :',num2str(S3.SettlingTime)])
disp(['5% settling time of G4 (ξ4=10) :',num2str(S4.SettlingTime)])
disp(' ')

% ----- 変更箇所👇 ----- %

% オーバーシュート：ステップ応答のピーク地と目標値の差
%              　オーバーシュートがない場合，この値は０
disp(['the percent overshoot of G1 (ξ1=0.2) :',num2str(S1.Overshoot)])
disp(['the percent overshoot of G2 (ξ2=0.4237) :',num2str(S2.Overshoot)])
disp(['the percent overshoot of G3 (ξ3=0.707) :',num2str(S3.Overshoot)])
disp(['the percent overshoot of G4 (ξ4=1) :',num2str(S4.Overshoot)])
disp(' ')

% ピーク時間：ステップ応答が最初にピーク値に到達する時間
disp(['the peak time of G1 (ξ1=0.2) :',num2str(S1.PeakTime)])
disp(['the peak time of G2 (ξ2=0.4237) :',num2str(S2.PeakTime)])
disp(['the peak time of G3 (ξ3=0.707) :',num2str(S3.PeakTime)])
disp(['the peak time of G4 (ξ4=1) :',num2str(S4.PeakTime)])

% ----- 変更箇所👆 ----- %

disp('---------------------------------------------')