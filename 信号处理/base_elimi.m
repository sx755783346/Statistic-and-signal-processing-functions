



% 输入：
% data 输入信号
% wname 小波名称，如db2、sym6、sym8等,一般多循环设为sym8
% k 分解层数，一般多循环设为7-9


% 输出：
% processed_data 滤波后数据
% recon 各频率分段重构系数：每一列为一个重构
% base_line 基线，也就是小波最低频分量


function [processed_data,recon,base_line] = base_elimi(data,wname,k)



[C,L]=wavedec(data,k,wname); % 对data进行多尺度/级分解，小波基为用户输入的wname

recon = [];

for i = 1 : k     % 自动给变量赋名和赋值
    D = wrcoef('d',C,L,wname,i);   % 各组高频分量的重构
    eval(['D',num2str(i),'=','D',';']);
    recon = [recon,D];
end

base_line = wrcoef('a',C,L,wname,k); % 最后一组低频分量的重构；
processed_data = data - base_line;








