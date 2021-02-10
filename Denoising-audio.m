clc;
clear all;
close all;

[x,f]=audioread('preamble10.wav');
N=length(x);
p1=(1/N)*sum(x.^2);
x1=(1/sqrt(p1))*x;
p2=(1/N)*sum(x1.^2);
n1=awgn(x1,0);
order=3;
mo=zeros(N,1);
d=ceil(order/2);
g=floor(order/2);
%median filtering
for i=d:N-d
    a=zeros(order,1);
    count=1;
    for k=-g:1:g
        a(count)=n1(i+k);
        count=count+1;
    end
    med=sort(a);
    mo(i)=med((order-1)/2);
end
subplot(311),plot(x1),title('originl audio');
subplot(312),plot(n1),title('noisy audio');
subplot(313),plot(mo),title('median filtered output');
%mean filtering
meanout=zeros(N,1);
mask=ones(order,1);
for i=d:N-d
    sum=0;
    for p=-g:1:g
        sum=sum+n1(i+p)*mask(p+d);
    end
    meanout(i)=(sum/order);
end
figure
subplot(311),plot(x1),title('originl audio');
subplot(312),plot(n1),title('noisy audio');
subplot(313),plot(meanout),title('mean filtered output');
%weighted mean
for i=d:N-d
    sum1=0;
    add=0;
    for j=1:order
        sum1=sum1+(2^(j-1))*(n1(j)+n1(order+1-j));
    end
    wo(i)=sum1-(2^(order-1)*n1(i));
    for j=1:order
        add=add+2*(2^(j-1));
    end
    ad(i)=add-(2^(order));
    wo1(i)=wo(i)/ad(i);
end
figure
subplot(311),plot(x1),title('originl audio');
subplot(312),plot(n1),title('noisy audio');
subplot(313),plot(wo1),title('weighted mean filtered output');





