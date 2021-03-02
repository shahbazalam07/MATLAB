close all;clear all;clc;
t=0:1e-3:0.1;
v=50*sin(1e3*t); %VOLTAGE GIVEN
s=5*(0.01)^2; %AREA OF PLATE 
d=3*(0.001);%Distance between plates in meters
ep0=8.854e-12;
ep=[1 1.5 2 2.5 3]*ep0;
for k=1:5
    Id(k,:)=(ep0*ep(k)*s/d)*diff(v);
    figure(1);subplot(5,1,k);
    plot(Id(k,:));
    title(sprintf('plot of Displacement Current where the value of permitivity is%d',ep(k)));
end