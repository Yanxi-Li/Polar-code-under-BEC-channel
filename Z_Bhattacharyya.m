%���õݹ鷽��������ϲ���
function Z=Z_Bhattacharyya(i,N,e)%�����볤N����Ϣλ��K,��������e
%�ݹ��ʼ��
if(i==1&&N==1)
    Z=e;
else
%�ݹ�
if(mod(i,2)==0)  %i��ż��
    Z=Z_Bhattacharyya(i/2,N/2,e).^2;
else   %i������
    Z=2*Z_Bhattacharyya((i+1)/2,N/2,e)-Z_Bhattacharyya((i+1)/2,N/2,e).^2;
end
end
    