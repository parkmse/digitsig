% 디지털 영역에서의 미적분

% Sampling cos sin
fx = 100;
delta = 1/fx;
x = 0:delta*2*pi:2*pi;

ys = sin(x); % sin파 생성
yc = cos(x); % cos파 생성

figure(1);
plot(x,ys,'b-',x,yc,'r-');

diff(ys/yc); % 앞 뒤 두개 샘플의 차분을 구하는 함수
