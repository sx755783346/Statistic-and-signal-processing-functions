% % % 
% % clc;
% % clear;
% % close all;
% 
% 
% 
% % 
% s = y_list;
% Len = length(s);
% 
% % ����dwt���ֽ�
% 
% [ca1, cd1] = dwt(s, 'db1'); % dwt:1��С���ֽ⣬����db1С�����ֽ�,ca1��Ƶ��cd1��Ƶ
% a1 = upcoef('a', ca1, 'db1', 1, Len); % upcoef: ��һ�ع�,��ϵ���õ�����/��Ƶ�ź�,0-250HZ
% d1 = upcoef('d', cd1, 'db1', 1, Len); % upcoef: ��һ�ع�,��ϵ���õ�ϸ��/��Ƶ�ź�,250-500HZ
% s1 = a1 + d1; % �ع��źţ���1���ع��õ���s1��s��ȫһ��,0-500HZ
% 
% [ca2, cd2] = dwt(ca1, 'db1'); % dwt:1��С���ֽ⣬����db1С�����ֽ�,ca2��Ƶ��cd2��Ƶ
% a2 = upcoef('a', ca2, 'db1', 2, Len); % upcoef: ��һ�ع�,��ϵ���õ�����/��Ƶ�ź�,0-125HZ
% d2 = upcoef('d', cd2, 'db1', 2, Len); % upcoef: ��һ�ع�,��ϵ���õ�ϸ��/��Ƶ�ź�,125-250HZ
% s2 = a2 + d2; % �ع��ź�,��2���ع�, 0-250HZ
% 
% [ca3, cd3] = dwt(ca2, 'db1'); % dwt:1��С���ֽ⣬����db1С�����ֽ�,ca3��Ƶ��cd3��Ƶ
% a3 = upcoef('a', ca3, 'db1', 3, Len); % upcoef: ��һ�ع�,��ϵ���õ�����/��Ƶ�ź�,0-62.5HZ
% d3 = upcoef('d', cd3, 'db1', 3, Len); % upcoef: ��һ�ع�,��ϵ���õ�ϸ��/��Ƶ�ź�,62.5-125HZ
% s3 = a3 + d3; % �ع��ź�,��3���ع�, 0-125HZ
% 
% [ca4, cd4] = dwt(ca3, 'db1'); % dwt:1��С���ֽ⣬����db1С�����ֽ�,ca4��Ƶ��cd4��Ƶ
% a4 = upcoef('a', ca4, 'db1', 4, Len); % upcoef: ��һ�ع�,��ϵ���õ�����/��Ƶ�ź�,0-31.25HZ
% d4 = upcoef('d', cd4, 'db1', 4, Len); % upcoef: ��һ�ع�,��ϵ���õ�ϸ��/��Ƶ�ź�,31.25-62.5HZ
% s4 = a4 + d4; % �ع��ź�,��4���ع�, 0-62.5HZ
% 
% [ca5, cd5] = dwt(ca4, 'db1'); % dwt:1��С���ֽ⣬����db1С�����ֽ�,ca5��Ƶ��cd5��Ƶ
% a5 = upcoef('a', ca5, 'db1', 5, Len); % upcoef: ��һ�ع�,��ϵ���õ�����/��Ƶ�ź�,0-15.625HZ
% d5 = upcoef('d', cd5, 'db1', 5, Len); % upcoef: ��һ�ع�,��ϵ���õ�ϸ��/��Ƶ�ź�,15.625-31.25HZ
% s5 = a5 + d5; % �ع��ź�,��5���ع�,0-31.25HZ
% 
% % ��С���任ϵ��ͼ
% figure
% subplot(7,1,1);
% plot(y_list);title('Origin')
% subplot(7,1,2);
% plot(cd1);title('250-500HZ')
% subplot(7,1,3);
% plot(cd2);title('125-250HZ')
% subplot(7,1,4);
% plot(cd3);title('62.5-125HZ') 
% subplot(7,1,5);
% plot(cd4);title('31.25-62.5HZ')
% subplot(7,1,6);
% plot(cd5);title('15.625-31.25HZ')
% subplot(7,1,7);
% plot(ca5);title('0-15.625HZ')
% 
% % ��С���任�ع�ͼ
% figure
% subplot(7,1,1);
% plot(y_list);title('Origin')
% subplot(7,1,2);
% plot(d1);title('250-500HZ')
% subplot(7,1,3);
% plot(d2);title('125-250HZ')
% subplot(7,1,4);
% plot(d3);title('62.5-125HZ') 
% subplot(7,1,5);
% plot(d4);title('31.25-62.5HZ')
% subplot(7,1,6);
% plot(d5);title('15.625-31.25HZ')
% subplot(7,1,7); 
% plot(a5);title('0-15.625HZ')

clc; clear;

% �����Դ���һ��һά��ѹ�ź�, ȡǰ4096����
load leleccum;
s = leleccum(1:4096);

% ��߶�/���ֽ�:
% ����: wavedec
[C,L]=wavedec(s,3,'db1');

% ϵ����ȡ: ��ȡ�����任֮����ź�: С�����µĵ�Ƶϵ��(������Ϣ)�͸�Ƶϵ��(ϸ���ź�), ��"ʱ���С����"!
% ˵��: ϵ����ȡ�Ƕ༶�ֽ���ã�1���ֽ��оͷֳ�2�����֣�����Ҫ��ȡ��
% ����: appcoef��Ƶϵ����ȡ; detcoef��Ƶϵ����ȡ
cA3=appcoef(C,L,'db1',3);  % ��: 3��ʾ������
cD3=detcoef(C,L,3); 
cD2=detcoef(C,L,2);
cD1=detcoef(C,L,1); % 3����: �������ֱ�ʾ���ǲ���
figure(1)
% 4�����ֳ��Ȳ�һ����
subplot(2,2,1); plot(cA3); title('3���ֽ��е�Ƶ���Ʋ���'); grid on;  % ���� 1/2^3 = 1/8
xlabel('С����: ����������ʵ������');
subplot(2,2,2); plot(cD3); title('3���ֽ��и�Ƶϸ�ڲ���'); grid on;  % ���� 1/2^3 = 1/8
xlabel('С����: ����������ʵ������');
subplot(2,2,3); plot(cD2); title('2���ֽ��и�Ƶϸ�ڲ���'); grid on;  % ���� 1/2^2 = 1/4
xlabel('С����: ����������ʵ������');
subplot(2,2,4); plot(cD1); title('1���ֽ��и�Ƶϸ�ڲ���'); grid on;  % ���� 1/2^1 = 1/2
xlabel('С����: ����������ʵ������');


% �༶�ع�ϵ��: ��С����ԭ���źŸ�Ƶ���ֵ����ź�, ����"С�����ʱ��"��
% ����: wrcoef�ع�����ϵ��  ������a�ǵ�Ƶ, d�Ǹ�Ƶ
A3=wrcoef('a',C,L,'db1',3); % ��
D3=wrcoef('d',C,L,'db1',3);
D2=wrcoef('d',C,L,'db1',2);
D1=wrcoef('d',C,L,'db1',1); % 3����
figure(2)
subplot(2,2,1); plot(A3); title('ԭʼ�ź��еĵ�Ƶ�źųɷ�'); grid on;
xlabel('������'); ylabel('���');
subplot(2,2,2); plot(D3); title('ԭʼ�ź��еĸ�Ƶ�źųɷ�1'); grid on;
xlabel('������'); ylabel('���');
subplot(2,2,3); plot(D2); title('ԭʼ�ź��еĸ�Ƶ�źųɷ�2'); grid on;
xlabel('������'); ylabel('���');
subplot(2,2,4); plot(D1); title('ԭʼ�ź��еĸ�Ƶ�źųɷ�3'); grid on;
xlabel('������'); ylabel('���');


% �ع�ԭʼ�ź�: �˲��󵥴��Ļָ�ԭʼ�ź�
% ����: waverec
s_rec = waverec(C,L,'db1');
figure(3);
subplot(1,2,1); plot(s); title('ԭʼ�ź�'); grid on;
xlabel('������'); ylabel('���');
subplot(1,2,2); plot(s_rec); title('�ع�ԭʼ�ź�'); grid on;
xlabel('������'); ylabel('���');
