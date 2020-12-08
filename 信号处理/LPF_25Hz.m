function Hd = LPF_25Hz
%LPF_25HZ Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.6 and Signal Processing Toolbox 8.2.
% Generated on: 19-Oct-2020 14:28:53

% FIR Window Lowpass filter designed using the FIR1 function.

% All frequency values are in Hz.
Fs = 1000;  % Sampling Frequency

N    = 7;        % Order
Fc   = 25;       % Cutoff Frequency
flag = 'scale';  % Sampling Flag

% Create the window vector for the design algorithm.
win = hamming(N+1);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Fc/(Fs/2), 'low', win, flag);
Hd = dfilt.dffir(b);

% [EOF]
