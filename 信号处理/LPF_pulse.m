% y Ϊ�����ź�
function d = LPF_pulse (y)

Hd = LPF_25Hz; %�����˲���,Hd������LPF_25Hz�˲����ĸ������
d = filter(Hd,y); %ͨ��filter�������ź�y�������ΪHd���˲���������ź�d
figure (1);
plot(d); %����ͨ���˲������ź�d�Ĳ���

