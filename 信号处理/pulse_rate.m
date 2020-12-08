% 输入：
% data 是脉搏数据
% sr 是采样频率


% 输出：
% heart_rate 是心率

% 注意：至少要20s以上的数据才能比较稳定


% 示例：
% 如果输入：heart_rate = pulse_rate(data,40)
% 意为输出采样率为40的脉搏信号的心率



function heart_rate = pulse_rate(data,sr)

[s,locs] = pulse_peak(data,sr,1);

delta_time=diff(locs)/sr;
heart_rate = 60/mean(delta_time); %60/心跳一次平均消耗的时间


