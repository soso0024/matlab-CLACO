% Master1 CORO 
% Classical Control
% exercise 1 of lab1

% MATLABのコマンドで、一度にすべての変数をクリアし、すべてのプロットウィンドウを閉じてコマンドウィンドウをクリア
clear all, close all, clc

disp('section 3.2')
disp('---------------------------------------------')

num = 1;
den = [0.5, 1.5, 1];

G = tf(num, den);

c1 = -10;
c2 = -0.25;
c3 = -0.1;
c4 = 0.1;
c5 = 0.25;
c6 = 10;

cnum1 = [-1, c1];
cden1 = [0.5*c1, 1.5*c1, c1];
cnum2 = [-1, c2];
cden2 = [0.5*c2, 1.5*c2, c2];
cnum3 = [-1, c3];
cden3 = [0.5*c3, 1.5*c3, c3];
cnum4 = [-1, c4];
cden4 = [0.5*c4, 1.5*c4, c4];
cnum5 = [-1, c5];
cden5 = [0.5*c5, 1.5*c5, c5];
cnum6 = [-1, c6];
cden6 = [0.5*c6, 1.5*c6, c6];

Gc1 = tf(cnum1, cden1);
Gc2 = tf(cnum2, cden2);
Gc3 = tf(cnum3, cden3);
Gc4 = tf(cnum4, cden4);
Gc5 = tf(cnum5, cden5);
Gc6 = tf(cnum6, cden6);

f1=figure(1);
set(f1,'position',[1   462   504   343])
subplot(111)

% 位相リミットを0度から開始する（位相を合わせる）
opts = bodeoptions;
opts.PhaseMatching = 'on';

% bode(G, Gc1, Gc2, Gc3, Gc4, Gc5, Gc6, opts);
bode(G,'b',Gc1, 'rx', Gc2, 'gx', Gc3,'cx', Gc4,'c',Gc5,'g',Gc6,'r', opts);
legend('G(c)', 'Gc(s)[c=-10]', 'Gc(s)[c=-0.25]', 'Gc(s)[c=-0.1]', 'Gc(s)[c=0.1]', 'Gc(s)[c=0.25]', 'Gc(s)[c=10]')

% グラフのタイトルを追加
title('Bode Plot of G and Compensators');

% グラフの線種と色を調整
set(findall(gcf,'Type','line'),'Linewidth',1.5);  % 線の太さを整調

% ----- 👇ステップ応答の確認👇 ----- %
figure(2);
step(G, Gc1, Gc2, Gc3, Gc4, Gc5, Gc6, 6);
legend('G(c)', 'Gc(s)[c=-10]', 'Gc(s)[c=-0.25]', 'Gc(s)[c=-0.1]', 'Gc(s)[c=0.1]', 'Gc(s)[c=0.25]', 'Gc(s)[c=10]')

% グラフの線種と色を調整
set(findall(gcf,'Type','line'),'Linewidth',1.5);  % 線の太さを整調

S_G = stepinfo(G)
S_Gc1 = stepinfo(Gc1)
S_Gc2 = stepinfo(Gc2)
S_Gc3 = stepinfo(Gc3)
S_Gc4 = stepinfo(Gc4)
S_Gc5 = stepinfo(Gc5)
S_Gc6 = stepinfo(Gc6)

% ----- 👆ステップ応答の確認👆 ----- %

%{
----- 👇set関数の説明👇 -----
set(f1,'position',[1 462 504 343]) のコードは、MATLABにおいて図（Figure）の位置とサイズを設定しています。具体的に、f1 は図のハンドル（handle）を表し、'position' は図の位置とサイズを設定するためのプロパティです。

このコードの各部分について説明します：

f1：これはあらかじめ作成した図のハンドル（handle）を指します。このハンドルを使用して特定の図を操作できます。

'position'：図の位置とサイズを設定するプロパティを指定しています。

[1 462 504 343]：このベクトルは、図の位置とサイズをピクセル単位で指定しています。各要素の意味は次の通りです：

最初の要素（1）：図の左端のX座標位置を指定します。
2番目の要素（462）：図の上端のY座標位置を指定します。
3番目の要素（504）：図の幅を指定します。
4番目の要素（343）：図の高さを指定します。
このコードは、f1 で指定された図の位置とサイズを (1, 462) から始まり、幅が 504 ピクセルで高さが 343 ピクセルになるように設定しています。これにより、MATLABの図が指定された位置とサイズで表示されます。

このように図の位置とサイズを指定することで、グラフやプロットが画面上で適切に配置され、表示される範囲が制御できます。

%}