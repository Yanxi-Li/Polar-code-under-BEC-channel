%polar码构造，采用巴氏参数，选取信息比特信道
function A=polar_codeconstruction(N,K,e) %输入码长N和信息位长K,擦除概率e
I=zeros(1,N);
for i=1:N
    I(i)=1-Z_Bhattacharyya(i,N,e); %计算分裂后每个比特信道容量
end
[~,index]=sort(I,'descend'); %排序
A=sort(index(1:K));  %选取信息量最大的K个比特信道进行传输信息比特，其余传输冻结比特