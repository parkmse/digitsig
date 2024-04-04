function [fx, x] = sigHatTrain(range, delta)
% 이 함수는 삼각파 형태의 신호를 생성한다.
% [fx, x] = sighatTrain(range, delta)

if nargin == 1; delta = 0.01; end % range, delta의 갯수
if nargin == 0; delta = 0.01; range = 4; end 
% 입력 argument로 control (자동으로 argument 저장)

xu = -0.5:delta:0.5-delta; % 한 주기에 해당하는 정의역
fxu = 1-2*abs(xu); % 1-2|x| % 한 주기에 해당하는 함수



% 방법 1
x = -range:delta:range-delta;
len = length(x); %
lenxu = length(xu); % 한 주기의 샘플 수,크기  // x 기본단계의 unit 크기
%         len = lenxu*range*2;

ftri = zeros(1, len); % 초기값을 만드는 zeros /// ones 함수도 있음 -> help zeros (알려주세요)
for n=1:2*range
    ftri(1+(n-1)*lenxu:n*lenxu) = fxu; % n이 커저가면서 만들어짐. // free allocation -> c언어에서 메모리를 먼저 설정하는것과 유사
    % ftri = [ftri, fxu];
end
fx = ftri;

if nargout == 0
    plot(x,fx,'k-');
end

% matlab 은 sccipt를 함수형태로 function을 만들어서 활용할 수 있는 능력을 키워야함.
