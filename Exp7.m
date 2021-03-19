close all;clear all;clc;
w=1e8; %Radian freq. given in the equation of H
c=3e8; %Velocity of light
N0=120*pi; %free space characteristic impedence
ep0=8.854e-12;
mu0=4*pi*1e-7;
ep1=2*ep0; %given
mu1=8*mu0; %given
beta0=w/c;
betal=w*sqrt(ep1*mu1); %Note:betal=4*beta0 as ep1=2*ep0&mu1=8*mu0;sqrt(16)=4.
N1=sqrt(mu1/ep1); %Note: N1=2*NO as ep1=2*ep0&mu1=8*mu0;sqrt(16)=4.
Hi0=10; %given, as H0=10cos(1e8t-beta*z);
Ei0=N0*Hi0; %from the relation N=E/H
t=0:1/w:1e-6;
z=linspace(0,100,length(t));x=z;y=z;
Ei=-Ei0*cos(w*t-beta0*z); %Note: z X x=-y,H has x component propagting in z,hence Ei has -y direction
%****Reflected wave ****
gamma =(N1-N0)/(N1+N0); %REFLECTION coeff
Er0=gamma*Ei0;Hr0=gamma*Hi0;
Er=-Er0*cos(w*t+beta0*z); %z=-z;reflected wave direction
Hr=-Hr0*cos(w*t+beta0*z); %z=-z reflected wave direction
%******Transmitted wave***8
tau=1+gamma; %transmission coeff
Et0=tau*Ei0;Ht0=tau*Hi0;
Et=-Et0*cos(w*t-betal*z);
Ht=-Ht0*cos(w*t-betal*z); 
Ei=-Ei0*cos(w*t-beta0*z);
Er=-Er0*cos(w*t+beta0*z);
Et=-Et0*cos(w*t-betal*z);
figure(1); subplot(211),plot3(x,Er,z); title('plot of Er');
subplot(212),plot3(Hr,y,z);title('plot of Hr');
figure(2); subplot(211),plot3(x,Et,z);
title('plot of Et'); subpost(212),plot3(Ht,y,z);
title('plot of Ht');


