% ���룺
% data1 ��ͨ��1�������źţ�������
% data1 ��ͨ��2�������źţ�������
% d ������������֮��ľ���
% sr �ǲ�����

% �����
% PWV �������ٶ�

% ʾ����
% ������룺PVW = pulse_wave_velocity(data1,data2,dist,sr)
% ��Ϊ���������Ϊ40�������źŵĲ���


function PVW = pulse_wave_velocity(data1,data2,d,sr)

[s1,k1] = pulse_peak(data1,sr,1);
[s2,k2] = pulse_peak(data2,sr,1);

PVW = mean(k2-k1)/d; % ʱ�����Ծ��룬�����ٶ�