% 输入：
% data1 是通道1的脉搏信号，列向量
% data1 是通道2的脉搏信号，列向量
% d 是两个传感器之间的距离
% sr 是采样率

% 输出：
% PWV 脉搏波速度

% 示例：
% 如果输入：PVW = pulse_wave_velocity(data1,data2,dist,sr)
% 意为输出采样率为40的脉搏信号的波峰


function PVW = pulse_wave_velocity(data1,data2,d,sr)

[s1,k1] = pulse_peak(data1,sr,1);
[s2,k2] = pulse_peak(data2,sr,1);

PVW = mean(k2-k1)/d; % 时间差除以距离，就是速度