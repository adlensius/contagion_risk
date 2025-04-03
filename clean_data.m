% Clean data
clear;
data = readmatrix("S&P500 vs CAC40.xlsx");

% Solve missing data
left_stock = data(:,1:2);
left_stock = rmmissing(left_stock);
right_stock = data(:,3:4);
right_stock = rmmissing(right_stock);
row = 1;
date = left_stock(1,1);
while date <= left_stock(end,1)
    diff = left_stock(row,1) - right_stock(row,1);
    if diff == 0 % no missing data
        row = row + 1;
        date = left_stock(row,1);
    elseif diff > 0 % missing data on left
        insert = [left_stock(row,1)-abs(diff) mean([left_stock(row-1,2) left_stock(row,2)])];
        left_stock = [left_stock(1:row-1,:); insert; left_stock(row:end,:)];
        row = row + 1;
        date = left_stock(row,1);
    elseif diff < 0 % missing data on right
        insert = [right_stock(row,1)-abs(diff) mean([right_stock(row-1,2) right_stock(row,2)])];
        right_stock = [right_stock(1:row-1,:); insert; right_stock(row:end,:)];
        row = row + 1;
        date = left_stock(row,1);
    end
end

        
    