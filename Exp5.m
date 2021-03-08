close all;clear all;clc;mu0=4*pi*1e-7;ep0=8.854e-12;
mu1=mu0;ep1=ep0;mu2=mu0;ep2=4*ep0;
v1=1/sqrt(mu1*ep1);
v2=1/sqrt(mu2*ep2);
beta1=50;
w1=beta1*v1;f1=0.5-w1/pi;Ts1=0.1/f1;
f2=1e8;
w2=2*pi*f2;Ts2=0.1/f2;
beta2=w2/v2;
disp('Radian frequency or omega of first wave) =');disp(w1);
t1=0:Ts1:10/f1-Ts1;t2=0:Ts2:10/f2-Ts2;
x=linspace(-1,1,length(t1));z=linspace(-1,1,length(t2));
[T1,X]=meshgrid(t1,x);[T2,X]=meshgrid(t2,z);
%Calculating and plotting Displacement Current
syms t d
E1=20*cos(w1*t-beta1*d);
E2=20*sin(w2*t-beta2*d);
Jd1= ep1*diff(E1,t);Jd1=subs(Jd1,{t,d},{T1,X});
Jd2=ep2*diff(E2,t);Jd2=subs(Jd2,{t,d},{T2,X});
figure(1);
mesh(T1,X,double(Jd1));title('Plot of Jd1');
figure(2);
mesh(T2,X,double(Jd2));title('Plot of Jd2');
%Calculating and plotting H field
syms x y z t
Ex=0;Ez=0;
Ey1=20*cos(w1*0-beta1*x);
Ey2=20*sin(w2*0-beta2*z);
E1=[Ex,Ey1,Ez];
E2=[Ex,Ey2,Ez];
U=[x y z];
L=1;
curlE1=curl(E1,U);
H1=double(subs(curlE1(3,1),{x},{linspace(-L,L,1e3)}))/-mu1;
curlE2=curl(E2,U);
H2=double(subs(curlE2(1,1),{z},{linspace(-L,L,1e3)}))/ -mu2;
%plotting of H 
x=linspace(-L,L,1e3);
z=linspace(-L,L,1e3);
figure(3);
subplot(211);plot(z,H1);title('Plot of H1');
subplot(212);plot(x,H2);title('Plot of H2');
