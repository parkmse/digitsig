% Lab01 Analog-to-digital converting\

% sampling
fs = 100; % 샘플링 주파수 (최대 주팟구의 100배, 부드러운 형태로 그래프가 그려짐, 샘플링 주파수가 높을수록 표현되는 주파수의 폭이 커짐)
fi = 5; % 아날로그 신호의 최대 주파수 설정.(2Hz) //// fi의 값이 fs의 1/2보다 더 작아야함.
delta = 1/fs; % 샘플링 주기(간격).

x = 0:delta:1; % x 영역의 범위(101개의 값이 만들어짐(x=벡터값))
fx = cos(2*pi*fi*x); % 2 x 3.14(matlab에 저장되어있는수) x 최대주파수 x x(벡터) /// 최소 : -1, 최대 = +1 
%cos값을 fx에 저장할때 양자화가 되고 정수값이 아닌 8byte로 구성되어있는 double값인 실수를 저장하는 값으로 저장,
%소숫점15자리까지는 보장.(--> 거의 원본)
figure(1); % 그래프 그리는 함수
plot(x, fx, 'b.-'); % b-: 그래프 옵션(파란색 실선), blue(color), r: red, k: black .- :점 실선, .: 점들의 위치//// 그래프 함수 그리는 함수
axis([0, 1, -1.1, 1.1]); % 범위 지정 함수 (0<x<1, -1.1<y<1.1)
title('cos 함수'); % 제목 부여 함수

% Quantization // 실수 값들을 정수로 변환하는 작업
qbit = 8; % 양자화 비트수(적어질수록 거칠게 표현됌,계단파 형태의 모양, 높을수록 원본에 근접해짐.) 8bit의 양자화
maxval = 2^(qbit-1)-1; % ex) 6bit --> -31 ~ +31 // qbit -> 음수부터 양수까지
fxq = round(maxval*fx); % round(정수로 만들어주는 함수), maxval*fx 최댓값 지정 

figure(2);
stem(x, fxq, '.'); %막대기를 그려주는 함수

% Inverse quantization (양자화 복원)
fxr = fxq/maxval; % 정수를 최대값으로 나눠줌
fxe = fx - fxr; % 원래의 값 - 복원된 값(오류 함수값), 오류 판단 여부
errpow = mean(fxe.^2); % 오류 에너지의 power 계산 // mean--> 평균 계산 함수 fxe^2: (벡터x벡터)라 문제가 있을 수 있음. fxe.^2을 해줘야함. 
% error power는 qbit에 따라서 변동될 수 있음.

figure(1); % 복원된 값이랑 비교
plot(x, fx, 'b-', x, fxr, 'r-'); %fx-> fiqure 1
axis([0, 1, -1.1, 1.1]);
title(['cos 함수, 주파수=',num2str(fi)]); % num2str-> fi라는 함수에 텍스트가 나오게 해주는 함수

figure(3);
stem(x, fxe, '.');
title(['Error 함수, 파워=',num2str(errpow*1000)]); %mm단위.





% help plot --> plot에 대한 함수를 알고싶다면 사용(명령창에)
% help round --> round """" ~ (이것도 명령창에)
% doc ceil --> 바로 설명창으로 넘어감
% fs, fi등을 변경해가면서 각 샘플링된 값들의 옵션을 찾아볼 수 있겠음./ ADC를 이해하고 옵션을 바꿔가면서 어떤 특성을 가지고 있는지 이해해야함.
% ex) fs, fi가 얼마나 바뀌어야 cos파의 형태로 나올까 --> 샘플 갯수가 최소한 10배는 되어야 cos형태가 나옴.
% digital data를 다루는 첫번째 : ADC

