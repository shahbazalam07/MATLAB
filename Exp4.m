close all;clear all;clc;
x=50:1:50; %Spatial Axis
c=3e8;
w=1e8; %radian freq
T=2*pi/w;
beta=w/c;
lambda=2*pi/beta;
t=[0 T/4 T/2 3*T/4 ];
for k=1:length(t)
    E(k,:)=50*cos(w*t(k)+beta*x);
    figure(1); subplot(length(t),1,k);
    plot(x,E(k,:));
    title(['Time shift is',num2str(t(k)),'when T=' ,num2str(T)]);
    xlabel('distance');
end
T,beta,lambda
disp('Conclusion-Form the Plot it is clear that the wave is movingin -x direction');