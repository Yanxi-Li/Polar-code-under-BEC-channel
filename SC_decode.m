function  [decoded_output,decoded_output_message]=SC_decode(y,N,Ac,A)
% BLOCKLENGTH = length(received_output);

% Put frozen bits in a 1 x BLOCKLENGTH vector, at positions A_c, for easier
% access
% frozen_bits_expanded = nan(1,BLOCKLENGTH);
% frozen_bits_expanded(A_c) = frozen_bits;

% Decode bit by bit in a naive way (not reusing previous results)
decoded_output = nan(1, N);
for j = 1:N
    if(ismember(j,Ac))
        % If the bit is frozen, we don't need to compute anything直接输出冻结比特
        decoded_output(j) = 0;
    else
        % To decode, first compute the likelihood ratio using the previously
        % decoded bits
        [current_lr LR1 LR2] = compute_lr(y, decoded_output( 1:j-1), N, j);
        
        % Then decide according to the lr
        decoded_output(j) = decide(current_lr);
        
        % If we cannot recover (erasure), we stop decoding
        if(isnan(decoded_output(j)))
            break;
        end
    end
end

% Only return the information bits
decoded_output_message = decoded_output(A);

end
