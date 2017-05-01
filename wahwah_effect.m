function [ yb, input_fs ] = wahwah_effect( input_x, input_fs, damp, minf, maxf, Fw)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


%%%%%%% EFFECT COEFFICIENTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% damping factor
% lower the damping factor the smaller the pass band
%damp = 0.05;

% min and max centre cutoff frequency of variable bandpass filter
%minf=500;
%maxf=3000;

% wah frequency, how many Hz per second are cycled through
%Fw = 2000; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% change in centre frequency per sample (Hz)
%delta=0.1;
delta = Fw/input_fs;
%0.1 => at 44100 samples per second should mean  4.41kHz Fc shift per sec

% create triangle wave of centre frequency values
Fc=minf:delta:maxf;
while(length(Fc) < length(input_x) )
    Fc= [ Fc (maxf:-delta:minf) ];
    Fc= [ Fc (minf:delta:maxf) ];
end

% trim tri wave to size of input
Fc = Fc(1:length(input_x));

% difference equation coefficients
F1 = 2*sin((pi*Fc(1))/input_fs);  % must be recalculated each time Fc changes
Q1 = 2*damp;                % this dictates size of the pass bands


yh=zeros(size(input_x));          % create emptly out vectors
yb=zeros(size(input_x));
yl=zeros(size(input_x));

% first sample, to avoid referencing of negative signals
yh(1) = input_x(1);
yb(1) = F1*yh(1);
yl(1) = F1*yb(1);

% apply difference equation to the sample
for n=2:length(input_x),
    
    yh(n) = input_x(n) - yl(n-1) - Q1*yb(n-1);
    yb(n) = F1*yh(n) + yb(n-1);
    yl(n) = F1*yb(n) + yl(n-1);
    F1 = 2*sin((pi*Fc(n))/input_fs);
end

%normaliseaudio
maxyb = max(abs(yb));
yb = yb/maxyb;


end

