


function [processed_data,breath_freq,p_v,p,s,recon] = pre_process(data,times,wname,k,sr)

for i = 1 : times
    data = smooth(data);
end
s = data;
[processed_data,recon,base_line] = base_elimi(data,wname,k);

breath_freq = base_line;

[p_v,p]=pulse_peak(processed_data,sr,1);