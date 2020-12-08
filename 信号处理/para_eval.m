% 输入：
% PWV 是脉搏速度
% SBP 是舒张压
% DBP 是收缩压

% 输出：
% a、b 是估计方程的两个系数
% Rsquare 是拟合优度
% p 是t检验p值



function [a,b,Rsquare,p] = para_eval(PVW,SBP,DBP)


MBP = DBP+(SBP-DBP)/3;

k = polyfit(PVW,MBP,1);  %已有文献证明波速和平均血压是线性关系

a= k(1);
b= k(2);


SSR =(MBP - (a * PVW + b))^2;
SST = (MBP - mean(MBP))^2;


Rsquare = SSR/SST; 

[h,p,ci]=ttest2(x,y);   %只需要p值

