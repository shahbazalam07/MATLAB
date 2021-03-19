close all;clear all;clc;
ep0=8.854e-12;mu0=4*pi*1e-7; %free space parameter
epr=8;mur=2; % Medium param provided
ep=epr*ep0;
mu=mur*mu0;
w=1e8; %Radian frequency given in the eq of E
alpha=1/3; %given
sigma=2*alpha*sqrt(ep/mu);
theta=(sigma/(ep*mu));%theta=loss tangent
beta=w*sqrt(ep*mu)*(1+(theta^2)/8);
N=sqrt(mu/ep)*(1+j*0.5*sigma/(w*ep)); %Intrinsic or wave impedance
v=w/beta; %Wave velocity
t=linspace(0,1e-6,1e4);
z=linspace(0,1,1e4);
E=0.5*exp(-z/3).*sin(1e8*t-beta*z);
H=E/N;
figure(1);
plot3(t,E,z)
title('plot of E field');
figure(2);
plot3(t,z,H);
title('plot of a H field');
warning off
disp('Beta');disp(beta);
disp('Loss Tangent in Degree');disp(theta*180/pi);
disp('Intrinsic Impedance in Ohm');disp(N);
disp('Wave Velocity in m/s');disp(v);