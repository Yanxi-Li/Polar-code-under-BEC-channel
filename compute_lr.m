%计算似然比
function [LR,LR1,LR2]= compute_lr(y, u, N, j)
%如果是信道级别，即译码图最右边一列
if(N==1)
    LR = initLR(y);
    return;
end
%不是信道级别，根据j的奇偶性，采用公式74、75递归
if(mod(j,2) == 1)  %奇数情况，公式74
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
else   %偶数情况，公式75
    u_odd = u(1:2:j-3);
    u_even = u(2:2:j-2);
    
    LR1 = compute_lr(y(1:N/2), mod(u_odd + u_even, 2), N/2, j/2);
    
    LR2 = compute_lr(y(N/2+1:N), u_even, N/2, j/2);
    
    if(u(j-1) == 0)  %指数项
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
