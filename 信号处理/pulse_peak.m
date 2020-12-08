% 输入：
% data 是脉搏信号，列向量
% sr 是 sample rate，采样率
% m 是选择输出波峰还是波谷

% 输出：
% s 是波峰或波谷
% k 是波峰位置或波谷位置

% 示例：
% 如果输入：[s,k] = pulse_peak(data,40,1)
% 意为输出采样率为40的脉搏信号的波峰


function [s,k] = pulse_peak(data,sr,m)

% 只能测100以下心率，100以上要调参数，可能需要迭代，效果可能不好
srr = sr * 0.6; % 0.6 为经验参数，可以改


srr = round(srr);
switch m
    case 1    % 求波峰
        [s,k] = findpeaks(data,'minpeakdistance',srr);
    case 2    % 求波谷
        data1 = -data;
        [s,k] = findpeaks(data1,'minpeakdistance',srr);
        s = -s;
    otherwise
        disp('请输入1或2')
end


