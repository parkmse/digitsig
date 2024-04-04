% 주기 함수를 생성하는 실습
% x축 -> - oo ~ + oo

% sampling
delta = 0.01;  % 함수 구현할 때의 delta (h) 값// 작은값  
               % sampling frequency = 1/delta
range = 5;
f0 = 1; % 기본주기 = 1;

% x 영역 설정
x = -range:delta:range-delta; % delta 만큼을 빼줘야함.

fc = (cos(2*pi*x)+1)/2;

figure(1);
plot(x,fc,'.b-');

w = 0.7; % w=0.99(1에 가까워질수록) delta값과 많이 닮아짐. 

% 사각펄스의 주기함수 ( cos 적당히 이용하면 됌)
%fr = (sign(fc)+1)/2;  % sign -> 부호를 mapping 해주는 function // (+1)/2 -> 범위 0~1까지로 지정
fr = fc >= w; % 논리 비교식 / fr 값이 0.5보다 크면 1 작으면 0을 할당 // 구현파의 폭을 결정
figure(2);
plot(x,fr,'r');

% % 삼각파 주기함수
% delta = 0.01; % --> 1주기에 100개의 샘플이 있다.
% xu = -0.5:delta:0.5-delta; % x는 unit한 값 (1 주기) // 0.5가 반복되면 겹치니까 delta만큼 빼줘야 주기가 나옴
% fxu = 1-2*abs(xu);  % 1-2|x|
% figure(3);
% plot(xu,fxu,'b-');
% 
% % 반복하는 roof (range 갯수만큼 : -5~+5 =10번)
% ftri =[]; % blank로 초기값 (default) 설정
% for n=1:10
%     ftri = [ftri, fxu];     % 누적해서 fxu를 붙임
% end
[ftri, x] = sigHatTrain(5, 0.01); % script function form 으로 함수를 만든것임.
figure(4);
stem(x,ftri,'.'); % x가 한 샘플이 많은 것임. --> 한 샘플 줄여야함.



