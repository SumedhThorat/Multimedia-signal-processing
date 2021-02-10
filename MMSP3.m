clc;close all;clear all;
[x,f]=audioread('preamble10.wav');
info=audioinfo('preamble10.wav');
%sound(y,f);
N=info.BitsPerSample;
L=2^N;
M=max(x);
m=min(x);
d=(M-m)/L;
Q=(d^2)/12;
s=0;
for info=1:length(x)
 s=s+(x(info)^2);
end
S1=s/Q;
disp('SQNR of orinal signal');S=10*log10(S1)
U=300;
for info=1:length(x) 
 r(info)=(sign(x(info))/log(1+U))*log(1+(U*(abs(x(info)/M))));
 r2(info)=sign(x(info))*floor(128*r(info));
end
r1=r2/(2^7);
for info=1:length(x)
 s1(info)=sign(x(info))*((((U+1)^abs(r1(info)))-1)/U);
 s2(info)=ceil((2^15)*s1(info));
end
figure();
subplot(211);plot(x);title('original signal');
subplot(212);plot(s2);title('output signal');
%sound(s2,f)
M1=max(s2);
m1=min(s2);
d1=(M1-m1)/L;
Q1=(d1^2)/12;
p1=0;
for info=1:length(s2)
 p1=p1+(s2(info)^2);
end
S2=p1/Q1;
disp('SQNR of recovered signal');SS=10*log10(S2)