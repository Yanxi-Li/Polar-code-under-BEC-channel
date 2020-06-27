%polar编码-BEC信道-SC译码example
clear all; 
clc;
% Code parameters
N = 8; % Code length
K = 4; % Length of information bits
rate = K/N; % Code rate
e=0.5;
u_a=round(rand(1,K));%信息码
%%
%polar simulation
%AA=A U Ac={0,1,2,...N}
AA=1:N; 
% polar码构造 选取质量最好的K个比特信道传输信息位，其它传冻结位
A = polar_codeconstruction(N, K, e); 
%获得Ac
AA(:,A)=[];
Ac=AA;  
%%
u=zeros(1,N);
%信息位+冻结位组成信源比特
u(:,A)=u_a;
%%
%编码
[x,G]=polar_encode(u,N); 
%%
%通过BEC信道
y=BEC(x,e);
%%
%SC译码
[decoded_output,decoded_output_message]=SC_decode(y,N,Ac,A);
%%
disp('message bit:');
disp(u_a);
disp('message bit position:');
disp(A);
disp('message+frozen bit:');
disp(u);
disp('encode:');
disp(x);
disp('-----pass through the BEC channel with error probability 0.5-----');
disp('receive code:');
disp(y);
disp('decode output:');
disp(decoded_output);
disp('decode message output:');
disp(decoded_output_message);
if((decoded_output_message-u_a)==0)
    disp('decode succeed');
else
    disp('decode failed');
end