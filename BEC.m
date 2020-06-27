%BEC信道 擦除概率为e，即发送码以概率e被擦除
function y=BEC(x,e)
l=length(x); 
%生成码元索引矩阵
%码元以概率e被擦除，被擦除的码元在索引矩阵中的相应位置置1，不被擦除的码元置0；
index=rand(1,l); 
for i=1:l
    if(index(i)<e)  %index(i)<e的概率是e，也就是index(i)以e的概率被置1，即该位所对应的码元以e的概率被擦除
        index(i)=1;
    else
        index(i)=0;
    end
end
index=find(index==1);%获得被擦除码元的位置索引
x(:,index)=NaN;  %根据码元索引矩阵，将被擦除的码元变为NaN，不被擦除的码元保持不变
y=x;