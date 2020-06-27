%������Ȼ��
function [LR,LR1,LR2]= compute_lr(y, u, N, j)
%������ŵ����𣬼�����ͼ���ұ�һ��
if(N==1)
    LR = initLR(y);
    return;
end
%�����ŵ����𣬸���j����ż�ԣ����ù�ʽ74��75�ݹ�
if(mod(j,2) == 1)  %�����������ʽ74
    u_odd = u(1:2:j-2);
    u_even = u(2:2:j-1);
    
    LR1 = compute_lr(y(1:N/2), mod(u_odd + u_even, 2), N/2, (j+1)/2);
    
    LR2 = compute_lr(y(N/2+1:N), u_even, N/2, (j+1)/2);
    
    % Use table decision for border cases (make diagram to understand)
    if((LR1 == 0 && LR2 == 0) || (isinf(LR1) && isinf(LR2)))
        LR = Inf;
    elseif((LR1 == 0 && isinf(LR2)) || (isinf(LR1) && LR2 == 0))
        LR = 0;
    elseif((LR1 == 1 && isinf(LR2)) || (isinf(LR1) && LR2 == 1))
        LR = 1;
    else
%          if(isinf(LR1) && isinf(LR2))
%             LR=1;
%          elseif((isinf(LR1) || isinf(LR2))&&((LR1==0)||(LR2==0)))
%              LR=0;
%          else
        LR = (LR1*LR2 + 1)/(LR1+LR2);
%          end
    end
else   %ż���������ʽ75
    u_odd = u(1:2:j-3);
    u_even = u(2:2:j-2);
    
    LR1 = compute_lr(y(1:N/2), mod(u_odd + u_even, 2), N/2, j/2);
    
    LR2 = compute_lr(y(N/2+1:N), u_even, N/2, j/2);
    
    if(u(j-1) == 0)  %ָ����
        LR = LR2 * LR1;
    else
%           if(isinf(LR1) && isinf(LR2))
%             LR=1;
%         else
        LR = LR2 / LR1;
%           end
    end
end

end
