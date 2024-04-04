% 주기 함수 -> 한 패턴이 반복되는 함수를 convolution 을 사용해 구현
% 주기 갯수를 선정하여 sin, cos 등등을 정의  ex) k개 // but unit function 의 경우 일정 패턴을
% 만들어야함 k개를 copy하면 되는데 이는 convolution이라고 정의  어떤 데이터를 가져와서 copy한다 ->
% convoltion으로 정의 
% 1주기를 만드는 법 -> 
% 삼각파 -> 수식 (1-|x|)
% 모든 signal 핵심 -> delta function
% 2개의 구형파를 convolution 하면 삼각파가 나옴
% -> 기초가 되는 삼각파를 반복해서 주기적으로 나오게 (convolution) -> 기초파와 delta function을
% convolution -> 주기를 가짐
% fundamental period function을 convolution 하면 주기함수가 생성됌

recsig = ones(1,5);        %(rectangular signal)  // 1 5개인 함수
trisig = conv(recsig,recsig); % 1이 5개인 함수 convolution - > 5+5-1=9개   => (k*n)-1개 (만들 수 있는 파의 갯수)
plot(trisig,'r.-');

qudsig = conv(trisig,recsig); % rectangular function의 convolution을 무한히 하면 gaussian function이 된다. 차수 = k // convol 1 -> 2차식 2-> 3차식
hold on;
plot(qudsig,'b.-');
hold off;

% delta train
delsig = zeros(1, 200); % fp가 10개 들어간다고 설정.
delsig(1:20:end) = 1; % fundamental period -> 20 

figure;
plot(delsig)

%periodical function
perisig = conv(qudsig,delsig);

figure;
plot(perisig) % 주기 함수를 convolution으로 얘기할 수 있다. 
% 역으로 추정해도 됌 -> convolution



