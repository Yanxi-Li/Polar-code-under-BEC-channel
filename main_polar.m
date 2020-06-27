%BEC信道
clear all; 
clc;
%仿真BER与擦除率的关系
% Code parameters
N = 1024; % Code length
K = 512; % Length of information bits
rate = K/N; % Code rate
cishu=50;%仿真次数
int=0; %标记是第int个e下的仿真
BER_e=zeros(1,length(0:0.1:0.5));
for e=0:0.1:0.5
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
title('Erasure probability VS BER');
plot(0:0.1:0.5,BER_e);
xlabel('Erasure probability');
ylabel('BER');

%%
%仿真BER与码率的关系
% Code parameters
N = 1024; % Code length
e=0.5;
cishu=50;%仿真次数
int=0; %标记是第int个rate下的仿真
BER_r=zeros(1,length(0:0.1:e));
for rate=0:0.1:e
    int=int+1;
    BER_current=zeros(1,cishu);
    K = round(rate*N); % Length of information bits
for count=1:cishu
u_a=round(rand(1,K));%信息码
[decoded_output,decoded_output_message,y,x,u]=polar_simulation(N,K,u_a,e);
BER_current(count)=length(find((decoded_output_message-u_a)~=0));
end
BER_r(int)=sum(BER_current)/count/K;
end
figure(2)
title('Rate VS BER');
plot(0:0.1:e,BER_r);
hold on;
plot([1-e,1-e],[0,1]);
axis([0 1 0 1]);
xlabel('Rate ');
ylabel('BER');