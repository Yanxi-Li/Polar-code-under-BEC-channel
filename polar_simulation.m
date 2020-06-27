%用于polar码系统仿真 Polar码构造-编码-BEC信道-译码
function [decoded_output,decoded_output_message,y,x,u]=polar_simulation(N,K,u_a,e)
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