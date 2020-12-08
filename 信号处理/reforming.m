% 此函数的作用是对齐两列数据的采样率；
% 注意：使用前需确保两列数据的时间间隔一致。

% a与b是列向量，为待压缩/插值的数据；
% c为指示量，确定要压缩（1）还是插值（2）；
% a1,b1为压缩/插值后的a和b。

% 示例：
% [a1,b1] = reforming (a,b,1)；
% 把a、b中采样率高的数据进行压缩（1），从而对齐采样率。


function [a1,b1] = reforming (a,b,c)

as = size(a,1);
bs = size(b,1);
cs = bs-as; %判别量

% 压缩的情况：c = 1
if c == 1 
    if cs > 0
        b1 = resample(b,as,bs);   % 从bs长度降到as长度
        a1 = a;
    else
        a1 = resample(a,bs,as);   % 从as长度降到bs长度
        b1 = b;
    end
end

% 插值的情况：c = 2
if c == 2 
    if cs > 0
        a1 = resample(a,bs,as);
        b1 = b;
    else
        b1 = resample(b,as,bs);
        a1 = a;
    end
end