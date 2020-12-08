% y 为输入信号
function d = LPF_pulse (y)

Hd = LPF_25Hz; %引入滤波器,Hd包含了LPF_25Hz滤波器的各项参数
d = filter(Hd,y); %通过filter函数将信号y送入参数为Hd的滤波器，输出信号d
figure (1);
plot(d); %画出通过滤波器的信号d的波形

