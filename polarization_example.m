%�ŵ�����ʾ��
N=1024;
e=0.5;
I=zeros(1,N);
for i=1:N
    I(i)=1-Z_Bhattacharyya(i,N,e); %������Ѻ�ÿ�������ŵ�����
end
figure(1)
scatter(1:1:N,I,'.');
xlabel('channel index');
ylabel('channel capacity');

