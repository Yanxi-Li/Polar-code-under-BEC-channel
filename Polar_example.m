%polar����-BEC�ŵ�-SC����example
clear all; 
clc;
% Code parameters
N = 8; % Code length
K = 4; % Length of information bits
rate = K/N; % Code rate
e=0.5;
u_a=round(rand(1,K));%��Ϣ��
%%
%polar simulation
%AA=A U Ac={0,1,2,...N}
AA=1:N; 
% polar�빹�� ѡȡ������õ�K�������ŵ�������Ϣλ������������λ
A = polar_codeconstruction(N, K, e); 
%���Ac
AA(:,A)=[];
Ac=AA;  
%%
u=zeros(1,N);
%��Ϣλ+����λ�����Դ����
u(:,A)=u_a;
%%
%����
[x,G]=polar_encode(u,N); 
%%
%ͨ��BEC�ŵ�
y=BEC(x,e);
%%
%SC����
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