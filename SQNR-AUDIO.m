clc;
clear all;
close all;

[y,Fs]=audioread('taunt.wav','native');
%sound(y,Fs)
info= audioinfo('taunt.wav')
N=info.BitsPerSample;
sqnr=6.02*N+1.7609
l=length(y);
N1=N/2;
l1=2^N1;
for i=1:l
    step=(max(y)-min(y))/l1;
    y1(i)=floor(y(i));
end

%audiowrite('ChillingMusic.wav',y,Fs,'BitsPerSample',8);
% [y1,Fs1]=audioread('ChillingMusic.wav','native');
% info1= audioinfo('ChillingMusic.wav')
sqnr1=6.02*N1+1.7609

subplot(211),plot(y)
subplot(212),plot(y1)
