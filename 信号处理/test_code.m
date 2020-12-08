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
% % 采用dwt逐层分解
% 
% [ca1, cd1] = dwt(s, 'db1'); % dwt:1层小波分解，采用db1小波基分解,ca1低频，cd1高频
% a1 = upcoef('a', ca1, 'db1', 1, Len); % upcoef: 单一重构,从系数得到近似/低频信号,0-250HZ
% d1 = upcoef('d', cd1, 'db1', 1, Len); % upcoef: 单一重构,从系数得到细节/高频信号,250-500HZ
% s1 = a1 + d1; % 重构信号，第1层重构得到的s1和s完全一样,0-500HZ
% 
% [ca2, cd2] = dwt(ca1, 'db1'); % dwt:1层小波分解，采用db1小波基分解,ca2低频，cd2高频
% a2 = upcoef('a', ca2, 'db1', 2, Len); % upcoef: 单一重构,从系数得到近似/低频信号,0-125HZ
% d2 = upcoef('d', cd2, 'db1', 2, Len); % upcoef: 单一重构,从系数得到细节/高频信号,125-250HZ
% s2 = a2 + d2; % 重构信号,第2层重构, 0-250HZ
% 
% [ca3, cd3] = dwt(ca2, 'db1'); % dwt:1层小波分解，采用db1小波基分解,ca3低频，cd3高频
% a3 = upcoef('a', ca3, 'db1', 3, Len); % upcoef: 单一重构,从系数得到近似/低频信号,0-62.5HZ
% d3 = upcoef('d', cd3, 'db1', 3, Len); % upcoef: 单一重构,从系数得到细节/高频信号,62.5-125HZ
% s3 = a3 + d3; % 重构信号,第3层重构, 0-125HZ
% 
% [ca4, cd4] = dwt(ca3, 'db1'); % dwt:1层小波分解，采用db1小波基分解,ca4低频，cd4高频
% a4 = upcoef('a', ca4, 'db1', 4, Len); % upcoef: 单一重构,从系数得到近似/低频信号,0-31.25HZ
% d4 = upcoef('d', cd4, 'db1', 4, Len); % upcoef: 单一重构,从系数得到细节/高频信号,31.25-62.5HZ
% s4 = a4 + d4; % 重构信号,第4层重构, 0-62.5HZ
% 
% [ca5, cd5] = dwt(ca4, 'db1'); % dwt:1层小波分解，采用db1小波基分解,ca5低频，cd5高频
% a5 = upcoef('a', ca5, 'db1', 5, Len); % upcoef: 单一重构,从系数得到近似/低频信号,0-15.625HZ
% d5 = upcoef('d', cd5, 'db1', 5, Len); % upcoef: 单一重构,从系数得到细节/高频信号,15.625-31.25HZ
% s5 = a5 + d5; % 重构信号,第5层重构,0-31.25HZ
% 
% % 画小波变换系数图
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
% % 画小波变换重构图
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

% 导入自带的一个一维电压信号, 取前4096个点
load leleccum;
s = leleccum(1:4096);

% 多尺度/级分解:
% 命令: wavedec
[C,L]=wavedec(s,3,'db1');

% 系数提取: 提取经过变换之后的信号: 小波域下的低频系数(近似信息)和高频系数(细节信号), 即"时域→小波域"!
% 说明: 系数提取是多级分解才用！1级分解有就分成2个部分，不需要提取。
% 命令: appcoef低频系数提取; detcoef高频系数提取
cA3=appcoef(C,L,'db1',3);  % 低: 3表示第三层
cD3=detcoef(C,L,3); 
cD2=detcoef(C,L,2);
cD1=detcoef(C,L,1); % 3个高: 最后的数字表示的是层数
figure(1)
% 4个部分长度不一样！
subplot(2,2,1); plot(cA3); title('3级分解中低频近似部分'); grid on;  % 长度 1/2^3 = 1/8
xlabel('小波域: 横轴坐标无实际意义');
subplot(2,2,2); plot(cD3); title('3级分解中高频细节部分'); grid on;  % 长度 1/2^3 = 1/8
xlabel('小波域: 横轴坐标无实际意义');
subplot(2,2,3); plot(cD2); title('2级分解中高频细节部分'); grid on;  % 长度 1/2^2 = 1/4
xlabel('小波域: 横轴坐标无实际意义');
subplot(2,2,4); plot(cD1); title('1级分解中高频细节部分'); grid on;  % 长度 1/2^1 = 1/2
xlabel('小波域: 横轴坐标无实际意义');


% 多级重构系数: 从小波域还原出信号高频部分的子信号, 即从"小波域→时域"！
% 命令: wrcoef重构单层系数  参数中a是低频, d是高频
A3=wrcoef('a',C,L,'db1',3); % 低
D3=wrcoef('d',C,L,'db1',3);
D2=wrcoef('d',C,L,'db1',2);
D1=wrcoef('d',C,L,'db1',1); % 3个高
figure(2)
subplot(2,2,1); plot(A3); title('原始信号中的低频信号成分'); grid on;
xlabel('采样点'); ylabel('振幅');
subplot(2,2,2); plot(D3); title('原始信号中的高频信号成分1'); grid on;
xlabel('采样点'); ylabel('振幅');
subplot(2,2,3); plot(D2); title('原始信号中的高频信号成分2'); grid on;
xlabel('采样点'); ylabel('振幅');
subplot(2,2,4); plot(D1); title('原始信号中的高频信号成分3'); grid on;
xlabel('采样点'); ylabel('振幅');


% 重构原始信号: 滤波后单纯的恢复原始信号
% 命令: waverec
s_rec = waverec(C,L,'db1');
figure(3);
subplot(1,2,1); plot(s); title('原始信号'); grid on;
xlabel('采样点'); ylabel('振幅');
subplot(1,2,2); plot(s_rec); title('重构原始信号'); grid on;
xlabel('采样点'); ylabel('振幅');
