function LR = initLR(y)
%LR初始化

        if(y==0)
         LR = inf;
        elseif (y==1)
              LR = 0;  
        elseif(isnan(y)) % Erasure
                LR = 1;
        else
              error('Unexpected value for y');
         end
   



