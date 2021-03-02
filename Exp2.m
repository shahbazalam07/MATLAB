close all;clear all;clc;
f=1e9; %Frequency given
fs=10*f;Ts=1/fs;%Sampling frequency and sampling period
c=3e8;%velocity of light
lambda=c/f;
t=0:Ts:1e-8;
z=t;
w=2*pi*f;
beta=2*pi/lambda;
E=cos(w*t-beta*z);
H=cos(w*t-beta*z);
figure(1);
plot3(t,H,z);
hold on;
plot3(t,H,z);
hold off;
title('Horizontal polarization');
figure(2);
plot3(cos(w*t-beta*z),t,-sin(w*t-beta*z));
title('Circular Polarization')

