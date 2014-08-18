%AM_example
time=.33; Ts=1/10000;                         % sampling interval and time
t=0:Ts:time; lent=length(t);                  % define a "time" vector
phi=0; gem=0;
fc=1000; c=cos(2*pi*fc*t);                    % define carrier at freq fc
fm=20; w=-10/lent*[1:lent]+cos(2*pi*fm*t);     % create "message" > -1
v=c.*w;                                     % modulate with large carrier
d=cos(2*pi*(fc+gem)*t+phi);
vv=c.*d;
fbe=[0 0.05 0.1 1]; damps=[1 1 0 0]; fl=50;  % low pass filter design
b=firpm(fl,fbe,damps);                        % impulse response of LPF
envv=2*filter(b,1,vv);   % find envelope
figure(1);
subplot(5,1,1);
plot(t,w);
subplot(5,1,2);
plot(t,c);
subplot(5,1,3);
plot(t,vv);
subplot(5,1,4);
plot(b);
subplot(5,1,5);
plot(t,envv);