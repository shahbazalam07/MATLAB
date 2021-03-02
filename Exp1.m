close all;clear all;clc;
f=(0.1:0.01:2)*1e9;%Frequency range 0.1 to 2Ghz
w=2*pi*f;
mu=4*pi*1e-7;
sigcu=5.8e7;
sigal=3.7e7;
siggl=4.4e7;
sigsl=6.2e7;
sigma=[sigcu sigal siggl sigsl];
Deltacu=sqrt(2./(w*mu*sigcu));%Skin Depth of copper Freq

%Calculation of skin Depth of Four metal at 1GHz
for k=1:4;
    f0=1e9;w0=2*pi*f0;
    Delta(k)=sqrt(2./(w0*mu*sigma(k)));
end

figure(1);
plot(f,Deltacu);
title('Freq vs Skin Depth of Copper');
figure(2);
stem(sigma,Delta);
title('Skin Depth w.r.t Conductivity i.e Copper,Aluminium,Gold,Silver');
