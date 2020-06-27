% %根据lr进行判决
% function decoded_bit = decide(current_lr)
% if(current_lr >= 1)
%     decoded_bit = 0;
% elseif(current_lr <1)
%     decoded_bit = 1;
%     elseif(isnan(current_lr))
%         decoded_bit = NaN;
% else
%     error('Unexpected likelihood ratio');
% end
% end

function decoded_bit = decide(current_lr)
if(current_lr == 0)
    decoded_bit = 1;
elseif(current_lr == Inf)
    decoded_bit = 0;
elseif(current_lr == 1)
    decoded_bit = nan;
else
    error('Unexpected likelihood ratio')
end
end