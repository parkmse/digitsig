% sin(2*pi*f*x+ceta)
% A(cos(2pifx+ceta)) //ceta = signal's dalay ,amplitude, frequency, phase
% 도플러 효과 : 물체의 delay를 계산해서 구현
% Acos(2pifx+ceta) // f는 x의 값에 의해서 결정 f0=5 -> f0 =10
% clear : memory remove & varience error
% clc : screen remove

% sampling frequency
sfq = 80;

% sampling period

delta = 1/sfq;
range = 2; %second

%prepare t
t= 0:delta:range;

freq0 = 4; % 440 HZ
amp0 = 1.0; % 보통 signal의 최댓값을 1로 지정 많이함.
ang0 = 0; 

% sin, cos 을 만들 때 중요한 parameter
fx0 = amp0*cos(2*pi*freq0*t+ang0); % t가 핵심벡터, 벡터가 하나만 있어어함.  % matlab : vector coding
%어떤변수가 벡터변수인지, scalar 변수인지  t가 루프됌. 출력은 벡터 
figure(1);
plot(t,fx0,'k-');
%sound(fx0,sfq);

freq1 = freq0*2;
amp1 = amp0;
ang1 = ang0;

N = length(t)-1; % t의 갯수 확인 fi = t !!! freq 0부터 1까지 t의 길이는 freq1과 freq0을 빼고 그 값을 n으로 나눈값을 범위화한거랑 똑같음
fdel =(freq1-freq0)/N;
fi = freq0:fdel:freq1;
fx1 = amp0*cos(2*pi*(fi.*t)+ang0); % fi와 t의 갯수는 같아야함

figure(2);
plot(t,fx1,'g-');

% signal generating
%  signal function 함수만 call하면 signal 이 딱 나오게. function을 만드는 작업
%y = 0:2*pi*sfq*(x):2*pi;
%yc = cos(x);
%figure(1);
%plot(y,yc,'b-');

