%DDS exercise
%goal: to realize that:
%1. T_sweep affects the resolution between sampled bins
%2. t_dwell affects sinc width

clear all; close all; clc;

%% Parameters
time=5E-3; %period of time for the simulation
Fs=400E6; %DDS sampling frequency

DDS_period=2000; %the time DDS stays on each frequency displayed as [amount of clock bits] unit 
N=time*Fs; %simulation time displayed as [amount of clock bits] unit

freqV=linspace(-Fs/2,Fs/2,N); 
t=[0:1/Fs:(N-1)/Fs];

%% 
input_freq=[10E6:10E6:100E6];,Nfreq=length(input_freq);

t_dwell=DDS_period*(1/Fs);
T_sweep=t_dwell*Nfreq;
Resolution=1/T_sweep;
sinc_width=1/t_dwell;

f_temp=meshgrid(input_freq,ones(1,DDS_period));
f_tempV=reshape(f_temp,1,DDS_period*Nfreq);
fall=meshgrid(f_temp,ones(1,N/(DDS_period*Nfreq)))';
fallV=reshape(fall,1,N);

out=1*sin(2*pi*fallV.*t); %DDS output

figure(1)
subplot(2,1,1)
plot(t,out);
xlabel('time(sec)'),ylabel('amplitude [V]'),title('DDS output - time domain');
grid on;
subplot(2,1,2)
plot(freqV/1E6,20*log10(abs(fftshift(fft(out))))/N);
xlabel('frequency [Mhz]'),ylabel('Amplitude [dBm]'),title('DDS output spectrum');
grid on;