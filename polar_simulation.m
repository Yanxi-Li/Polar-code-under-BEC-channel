%����polar��ϵͳ���� Polar�빹��-����-BEC�ŵ�-����
function [decoded_output,decoded_output_message,y,x,u]=polar_simulation(N,K,u_a,e)
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