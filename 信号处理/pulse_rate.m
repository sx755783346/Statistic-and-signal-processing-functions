% ���룺
% data ����������
% sr �ǲ���Ƶ��


% �����
% heart_rate ������

% ע�⣺����Ҫ20s���ϵ����ݲ��ܱȽ��ȶ�


% ʾ����
% ������룺heart_rate = pulse_rate(data,40)
% ��Ϊ���������Ϊ40�������źŵ�����



function heart_rate = pulse_rate(data,sr)

[s,locs] = pulse_peak(data,sr,1);

delta_time=diff(locs)/sr;
heart_rate = 60/mean(delta_time); %60/����һ��ƽ�����ĵ�ʱ��


