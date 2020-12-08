% �˺����������Ƕ����������ݵĲ����ʣ�
% ע�⣺ʹ��ǰ��ȷ���������ݵ�ʱ����һ�¡�

% a��b����������Ϊ��ѹ��/��ֵ�����ݣ�
% cΪָʾ����ȷ��Ҫѹ����1�����ǲ�ֵ��2����
% a1,b1Ϊѹ��/��ֵ���a��b��

% ʾ����
% [a1,b1] = reforming (a,b,1)��
% ��a��b�в����ʸߵ����ݽ���ѹ����1�����Ӷ���������ʡ�


function [a1,b1] = reforming (a,b,c)

as = size(a,1);
bs = size(b,1);
cs = bs-as; %�б���

% ѹ���������c = 1
if c == 1 
    if cs > 0
        b1 = resample(b,as,bs);   % ��bs���Ƚ���as����
        a1 = a;
    else
        a1 = resample(a,bs,as);   % ��as���Ƚ���bs����
        b1 = b;
    end
end

% ��ֵ�������c = 2
if c == 2 
    if cs > 0
        a1 = resample(a,bs,as);
        b1 = b;
    else
        b1 = resample(b,as,bs);
        a1 = a;
    end
end