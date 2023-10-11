%second order system
%section 2.1

clear all, close all, clc

disp('section 1.1')
disp(' ')

k=1;
qsita=0.4237;
wn1=1;wn2=2;wn3=5;wn4=10;

G1=tf(k*wn1^2,[1,2*qsita*wn1,wn1^2]);
G2=tf(k*wn2^2,[1,2*qsita*wn2,wn2^2]);
G3=tf(k*wn3^2,[1,2*qsita*wn3,wn3^2]);
G4=tf(k*wn4^2,[1,2*qsita*wn4,wn4^2]);

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
disp(['5% settling time of G1 (wn1=1) :',num2str(S1.SettlingTime)])
disp(['5% settling time of G2 (wn2=2) :',num2str(S2.SettlingTime)])
disp(['5% settling time of G3 (wn3=5) :',num2str(S3.SettlingTime)])
disp(['5% settling time of G4 (wn4=10) :',num2str(S4.SettlingTime)])
%% section 2.2

% disp('---------------------------------------------')
% disp('section 1.2')
% disp('')
% 
% k=1;
% qsita1=0.2;qsita2=0.4237;qsita3=0.707;qsita4=1;
% wn=1;
% 
% G1=tf(k*wn^2,[1,2*qsita1*wn,wn^2]);
% G2=tf(k*wn^2,[1,2*qsita2*wn,wn^2]);
% G3=tf(k*wn^2,[1,2*qsita3*wn,wn^2]);
% G4=tf(k*wn^2,[1,2*qsita4*wn,wn^2]);
% 
% f2=figure(2);hold on
% set(f2,'position',[507   462   504   343])
% subplot(211)
% step(G1,G2,G3,G4);
% legend('G1','G2','G3','G4')
% subplot(212)
% pzmap(G1,G2,G3,G4)
% legend('G1','G2','G3','G4')
% 
% S1 = stepinfo(G1,'SettlingTimeThreshold',0.05);
% S2 = stepinfo(G2,'SettlingTimeThreshold',0.05);
% S3 = stepinfo(G3,'SettlingTimeThreshold',0.05);
% S4 = stepinfo(G4,'SettlingTimeThreshold',0.05);
% disp(['5% settling time of G1 (ξ1=0.2) :',num2str(S1.SettlingTime)])
% disp(['5% settling time of G2 (ξ2=0.4237) :',num2str(S2.SettlingTime)])
% disp(['5% settling time of G3 (ξ3=0.707) :',num2str(S3.SettlingTime)])
% disp(['5% settling time of G4 (ξ4=1) :',num2str(S4.SettlingTime)])
% disp('---')
% 
% FOS1 = stepinfo(G1);
% FOS2 = stepinfo(G1);
% FOS3 = stepinfo(G1);
% FOS4 = stepinfo(G1);
% 
% disp(['the time of first overshoot of G1 (ξ1=0.2) :',num2str(FOS1.PeakTime)])
% disp(['the time of first overshoot of G2 (ξ2=0.4237) :',num2str(FOS2.PeakTime)])
% disp(['the time of first overshoot of G3 (ξ3=0.707) :',num2str(FOS3.PeakTime)])
% disp(['the time of first overshoot of G4 (ξ4=1) :',num2str(FOS4.PeakTime)])
% disp('---')
% 
% disp(['the percent overshoot of G1 (ξ1=0.2) :',num2str(FOS1.Overshoot)])
% disp(['the percent overshoot of G2 (ξ2=0.4237) :',num2str(FOS2.Overshoot)])
% disp(['the percent overshoot of G3 (ξ3=0.707) :',num2str(FOS3.Overshoot)])
% disp(['the percent overshoot of G4 (ξ4=1) :',num2str(FOS4.Overshoot)])
% 
% %% section 2.3
% 
% disp('---------------------------------------------')
% disp('section 2.3')
% disp('')
% 
% k1=1;k2=2;k3=5;k4=10;
% qsita=0.4237;
% wn=1;
% 
% G1=tf(k1*wn^2,[1,2*qsita*wn,wn^2]);
% G2=tf(k2*wn^2,[1,2*qsita*wn,wn^2]);
% G3=tf(k3*wn^2,[1,2*qsita*wn,wn^2]);
% G4=tf(k4*wn^2,[1,2*qsita*wn,wn^2]);
% 
% %T=5;
% 
% 
% f3=figure(3);hold on
% set(f3,'position',[1    52   504   343])
% subplot(111);
% step(G1,G2,G3,G4);
% %plot([0 T],[0 k1],'k')
% %plot([0 T],[0 k3],'k')
% %plot([0 T],[0 k4],'k')
% %plot([T T],[0 k4],':k')
% legend('G1','G2','G3','G4')
% 
% S1=stepinfo(G1);
% S2=stepinfo(G2);
% S3=stepinfo(G3);
% S4=stepinfo(G4);
% 
% disp(['Mp(%) of G1 (k1=1) :',num2str(S1.Overshoot)])
% disp(['Mp(%) of G2 (k2=2) :',num2str(S2.Overshoot)])
% disp(['Mp(%) of G3 (k3=5) :',num2str(S3.Overshoot)])
% disp(['Mp(%) of G4 (k4=10) :',num2str(S4.Overshoot)])
% disp('---')
% 
% disp(['5% Setting Time of G1 (k1=1) :',num2str(S1.SettlingTime)])
% disp(['5% Setting Time of G2 (k2=2) :',num2str(S2.SettlingTime)])
% disp(['5% Setting Time of G3 (k3=5) :',num2str(S3.SettlingTime)])
% disp(['5% Setting Time of G4 (k4=10) :',num2str(S4.SettlingTime)])
% 
% %% section 2.4
% 
% disp('---------------------------------------------')
% disp('section 2.4')
% disp('')
% 
% k=1;
% qsita=0.4237;
% wn1=1;wn2=2;wn3=5;wn4=10;
% 
% G1=tf(k*wn1^2,[1,2*qsita*wn1,wn1^2]);
% G2=tf(k*wn2^2,[1,2*qsita*wn2,wn2^2]);
% G3=tf(k*wn3^2,[1,2*qsita*wn3,wn3^2]);
% G4=tf(k*wn4^2,[1,2*qsita*wn4,wn4^2]);
% 
% f4=figure(4);
% set(f4,'position',[507   462   504   343])
% subplot(121)
% %bode(G1,G2,G3,G4);
% bodemag(G1,G2,G3,G4);
% legend('G1','G2','G3','G4')
% subplot(122)
% step(G1,G2,G3,G4)
% legend('G1','G2','G3','G4')
% 
% wc1=bandwidth(G1);
% wc2=bandwidth(G2);
% wc3=bandwidth(G3);
% wc4=bandwidth(G4);
% 
% S1 = stepinfo(G1,'SettlingTimeThreshold',0.05);
% S2 = stepinfo(G2,'SettlingTimeThreshold',0.05);
% S3 = stepinfo(G3,'SettlingTimeThreshold',0.05);
% S4 = stepinfo(G4,'SettlingTimeThreshold',0.05);
% 
% disp(['Bandwith of G1 (wn1=1) :',num2str(wc1)])
% disp(['Bandwith of G2 (wn2=2) :',num2str(wc2)])
% disp(['Bandwith of G3 (wn3=5) :',num2str(wc3)])
% disp(['Bandwith of G4 (wn4=10) :',num2str(wc4)])
% disp(' ')
% disp(['5% settling time of G1 (wn1=1) :',num2str(S1.SettlingTime)])
% disp(['5% settling time of G2 (wn2=2) :',num2str(S2.SettlingTime)])
% disp(['5% settling time of G3 (wn3=5) :',num2str(S3.SettlingTime)])
% disp(['5% settling time of G4 (wn4=10) :',num2str(S4.SettlingTime)])
% disp(' ')




