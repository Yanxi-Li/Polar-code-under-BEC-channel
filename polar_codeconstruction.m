%polar�빹�죬���ð��ϲ�����ѡȡ��Ϣ�����ŵ�
function A=polar_codeconstruction(N,K,e) %�����볤N����Ϣλ��K,��������e
I=zeros(1,N);
for i=1:N
    I(i)=1-Z_Bhattacharyya(i,N,e); %������Ѻ�ÿ�������ŵ�����
end
[~,index]=sort(I,'descend'); %����
A=sort(index(1:K));  %ѡȡ��Ϣ������K�������ŵ����д�����Ϣ���أ����ഫ�䶳�����