% sinc() 함수

sp = 0.01; % 
sf = 1/sp; %sampling period 의 주파수 / 샘플수가 많아지면 더 부드러워짐.(샘플링 주파수를 높이면 아날로그 데이터를 디지털로 최대한 깨끗하게 가져올 수 있음.) / 1HZ짜리 데이터라고함.
x = -5:sp:5; % x의 간격 (sampling peirod: 0.1) 범위를 정하고 그래프를 그림. // x는 샘플위치.

% /// 샘플링이 된 과정.. 값들을 직선으로 연결하는 interpolation 작업을 해서 나타내어짐.

freq = 1; % sf의 2배가 넘어야하는데 최소 4배가 좋음
amp = 1;
theta = 0;

fx = amp*sin(2*freq*pi*x + theta)./x; %  --> sinc 함수 표현 
%벡터/벡터는 포인트 나누기로 .x를 해야함. matrix/matrix도 조심.

%fx = sin(1*pi*x); %pi는 고정숫자 // sin의 파형이 나오게 설정 (2pi를 넣는 이유는 0 부터 1까지 나타내기위함)
% Amplitued sin --> Asin(wx+a) //// A*sin(2*pi*f*x+a) <-- 이러한 방식을 선호함.
%(f: 주파수, 주파수를 바꾸려면 수식을 바꿔야함.)


figure(1); % sin파 
plot(x, fx, '.-'); % sin함수 지정

figure(2);
stem(x, fx,'.'); % .을 수직바 형태로 나타내어줌.// discrete 모양을 나타냄

