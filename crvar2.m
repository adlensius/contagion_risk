% This function outputs a column vector of empirical contagion risk measure 
% based on different confidence level q

% Input: array1 : primary risk (array), array2: reference risk (array)
% q: confidence levels (array)

function result = crvar2(x1,x2,q)
    result = ones(size(q,2),1);
    quant1 = quantile(x1,q);
    quant2 = quantile(x2,q);

    for i = 1:size(q,2)
        q1 = quant1(i);
        q2 = quant2(i);
        denominator = 0;
        numerator = 0;
        for j = 1:size(x1,1)
            if x2(j) >  q2
                denominator = denominator + 1;
                if x1(j) > q1
                    numerator = numerator + (x1(j) - q1);
                end
            end
        end
        result(i) = numerator / denominator;
    end
    
    % result(end) = corresponds to highest q
