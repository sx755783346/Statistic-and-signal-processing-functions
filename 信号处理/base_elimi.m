



% ���룺
% data �����ź�
% wname С�����ƣ���db2��sym6��sym8��,һ���ѭ����Ϊsym8
% k �ֽ������һ���ѭ����Ϊ7-9


% �����
% processed_data �˲�������
% recon ��Ƶ�ʷֶ��ع�ϵ����ÿһ��Ϊһ���ع�
% base_line ���ߣ�Ҳ����С�����Ƶ����


function [processed_data,recon,base_line] = base_elimi(data,wname,k)



[C,L]=wavedec(data,k,wname); % ��data���ж�߶�/���ֽ⣬С����Ϊ�û������wname

recon = [];

for i = 1 : k     % �Զ������������͸�ֵ
    D = wrcoef('d',C,L,wname,i);   % �����Ƶ�������ع�
    eval(['D',num2str(i),'=','D',';']);
    recon = [recon,D];
end

base_line = wrcoef('a',C,L,wname,k); % ���һ���Ƶ�������ع���
processed_data = data - base_line;








