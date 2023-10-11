% Master1 CORO 
% Classical Control
% exercise 1 of lab1

clear all, close all, clc

disp('section 1.1')
disp('')

k=1;

% ----- 変更箇所 ----- %
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

% ----- 変更箇所 ----- 

%{
----- tf関数の説明-----

sys = tf(num, den)

sys は定義された伝達関数を表すシステムオブジェクトです。
num は伝達関数の分子の係数を、den は伝達関数の分母の係数を表すベクトルや配列です。
具体的な説明は以下の通りです：

num: 伝達関数の分子の係数を表すベクトルや配列です。
例えば、伝達関数 G(s) = 3s^2 + 2s + 1 の場合、分子の係数ベクトルは [3, 2, 1] になります。

den: 伝達関数の分母の係数を表すベクトルや配列です。
例えば、伝達関数 G(s) = 3s^2 + 2s + 1 の場合、分母の係数ベクトルは [1, 2, 3] になります。
分母の係数ベクトルは通常、1次の項から始まり、最高次の項で終わります。

以下は具体的な例です：

伝達関数 G(s) = 3s^2 + 2s + 1 を定義する例
numerator = [3];
denominator = [1, 2, 3];
sys = tf(numerator, denominator);

このコードは、伝達関数 G(s) = 3s^2 + 2s + 1 を定義し、sys というシステムオブジェクトに格納します。
このシステムオブジェクトを使用して、伝達関数の特性や応答を分析できます。

%}

f1=figure(1);
set(f1,'position',[1   462   504   343])
subplot(211)
step(G1,G2,G3,G4);
legend('G1','G2','G3','G4')
subplot(212)
pzmap(G1,G2,G3,G4)
legend('G1','G2','G3','G4')

S1 = stepinfo(G1,'SettlingTimeThreshold',0.05);
S2 = stepinfo(G2,'SettlingTimeThreshold',0.05);
S3 = stepinfo(G3,'SettlingTimeThreshold',0.05);
S4 = stepinfo(G4,'SettlingTimeThreshold',0.05);
disp(['5% settling time of G1 (T1=1) :',num2str(S1.SettlingTime)])
disp(['5% settling time of G2 (T2=5) :',num2str(S2.SettlingTime)])
disp(['5% settling time of G3 (T3=10) :',num2str(S3.SettlingTime)])
disp(['5% settling time of G4 (T4=50) :',num2str(S4.SettlingTime)])

%%
