%polar码编码 其中u的列数等于N
function [x,G]=polar_encode(u,N)
n=log2(N);
F=[1 0;1 1];
Fn=F;
for i=1:n-1
    Fn=kron(Fn,F);
end
%x=mod(bitrevorder(u)*Fn,2); %x=u*B*Fn=u*G bitreorder(u)=u*B  
G=bitrevorder(Fn);%生成矩阵
x=mod(u*G,2);
