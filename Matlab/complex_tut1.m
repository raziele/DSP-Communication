clear all; close all; clc;

%% Part 1: complex exponential

t=0:0.01:5;
y=5*exp(-(j*2*pi*t));
figure(1)
subplot(2,2,1);
plot3(t,real(y),imag(y));
grid
xlabel('t'),ylabel('Re(y)'),zlabel('Im(y)');
title('3-D plot of complex exp');

subplot(2,2,3),plot(t,real(y)),xlabel('t'),ylabel('Mag'),title('Re(y(t))');

subplot(2,2,4),plot(t,imag(y)),xlabel('t'),ylabel('Angle'),title('Im(y(t))');

%% Part 2: Double-Sided DFT

fs=128;
N=1024;
t=0:1/fs:((N-1)/fs);
x=3+6*cos(8*pi*t+2)+j*8*sin(8*pi*t+3)-j*6*sin(30*pi*t+1);
figure(2)
subplot(2,1,1)
plot(t,x);
subplot(2,1,2)
fplot('x',[0,1]);
xlabel('Time'),ylabel('signal in time domain');

figure(3)
xf1=abs(fft(x))/N;
xf=fftshift(xf1);
P=xf.*xf;
f=linspace(0,fs,N);
f3=[-fs/2:fs/2:1024];
f2=linspace(-fs/2,fs/2,1024);
plot(f2,xf);grid;
xlabel('Freq(Hz)'),ylabel('Double-sided amplitude spectrum');
