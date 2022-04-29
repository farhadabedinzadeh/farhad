function Hd = preprocessing_filter
%PREPROCESSING_FILTER Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.8 and Signal Processing Toolbox 8.4.
% Generated on: 31-Jul-2021 13:41:56

% Equiripple Lowpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 174;  % Sampling Frequency

Fpass = 69;     % Passband Frequency
Fstop = 70;     % Stopband Frequency
Dpass = 0.1;    % Passband Ripple
Dstop = 0.001;  % Stopband Attenuation
dens  = 20;     % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]