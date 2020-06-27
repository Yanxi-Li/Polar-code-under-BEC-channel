%采用递归方法计算巴氏参数
function Z=Z_Bhattacharyya(i,N,e)%输入码长N和信息位长K,擦除概率e
%递归初始化
if(i==1&&N==1)
    Z=e;
else
%递归
if(mod(i,2)==0)  %i是偶数
    Z=Z_Bhattacharyya(i/2,N/2,e).^2;
else   %i是奇数
    Z=2*Z_Bhattacharyya((i+1)/2,N/2,e)-Z_Bhattacharyya((i+1)/2,N/2,e).^2;
end
end
    