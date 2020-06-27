%BEC信道
clear all; 
clc;
%仿真BER与码长N的关系
% Code parameters
rate = 0.5; % 码率
cishu=10;%仿真次数
e=0.3; %擦除概率
int=0; %标记是第int个N下的仿真
BER_e=zeros(1,length(7:1:10));
for NN=7:1:10
    N = 2^NN; % 码长
    K = rate*N; % 信息码长
    int=int+1;
    BER_current=zeros(1,cishu);
for count=1:cishu
u_a=round(rand(1,K));%信息码
[decoded_output,decoded_output_message,y,x,u]=polar_simulation(N,K,u_a,e);
BER_current(count)=length(find((decoded_output_message-u_a)~=0));
end
BER_e(int)=sum(BER_current)/count/K;
end
figure(1)
title('length of N length VS BER');
plot(2.^(7:1:10),BER_e);
xlabel('length of N');
ylabel('BER');
xlim([2^7,2^10]);