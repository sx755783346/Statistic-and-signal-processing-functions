% ���룺
% data �������źţ�������
% sr �� sample rate��������
% m ��ѡ��������廹�ǲ���

% �����
% s �ǲ���򲨹�
% k �ǲ���λ�û򲨹�λ��

% ʾ����
% ������룺[s,k] = pulse_peak(data,40,1)
% ��Ϊ���������Ϊ40�������źŵĲ���


function [s,k] = pulse_peak(data,sr,m)

% ֻ�ܲ�100�������ʣ�100����Ҫ��������������Ҫ������Ч�����ܲ���
srr = sr * 0.6; % 0.6 Ϊ������������Ը�


srr = round(srr);
switch m
    case 1    % �󲨷�
        [s,k] = findpeaks(data,'minpeakdistance',srr);
    case 2    % �󲨹�
        data1 = -data;
        [s,k] = findpeaks(data1,'minpeakdistance',srr);
        s = -s;
    otherwise
        disp('������1��2')
end


