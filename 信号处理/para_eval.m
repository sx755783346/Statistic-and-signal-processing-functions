% ���룺
% PWV �������ٶ�
% SBP ������ѹ
% DBP ������ѹ

% �����
% a��b �ǹ��Ʒ��̵�����ϵ��
% Rsquare ������Ŷ�
% p ��t����pֵ



function [a,b,Rsquare,p] = para_eval(PVW,SBP,DBP)


MBP = DBP+(SBP-DBP)/3;

k = polyfit(PVW,MBP,1);  %��������֤�����ٺ�ƽ��Ѫѹ�����Թ�ϵ

a= k(1);
b= k(2);


SSR =(MBP - (a * PVW + b))^2;
SST = (MBP - mean(MBP))^2;


Rsquare = SSR/SST; 

[h,p,ci]=ttest2(x,y);   %ֻ��Ҫpֵ

