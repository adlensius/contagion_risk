%% Step 1: Import Data

% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 3);

% Specify sheet and range
opts.Sheet = "Return";
opts.DataRange = "A2:C8312"; % FTSE: 8239, NI: 8312

% Specify column names and types
opts.VariableNames = ["Date", "SP", "NI"];
opts.VariableTypes = ["datetime", "double", "double"];

% Specify variable properties
opts = setvaropts(opts, "Date", "InputFormat", "");

% Import the data
data = readtable("CLEANED S&P500 vs NI225.xlsx", opts, "UseExcel", false);

% Clear temporary variables
clear opts

% Get array of negative log return for each stock
x1 = data.SP; % Primary risk
x2 = data.NI; % Reference risk

%% obtain unit frechet

% get cdf
[f1,m1] = ecdf(x1);
f1(1) = 1/size(x1,1);
f1(size(f1,1)) = f1(size(f1,1)-1);

new1 = ones(size(x1,1),1);
for i = 1:size(x1,1)
    for k = 1:size(m1,1)
        if x1(i) - m1(k) == 0
            new1(i) = -1/log(f1(k));
        end
    end
end

[f2,m2] = ecdf(x2);
f2(1) = 1/size(x2,1);
f2(size(f2,1)) = f2(size(f2,1)-1);

new2 = ones(size(x2,1),1);
for i = 1:size(x2,1)
    for k = 1:size(m2,1)
        if x2(i) - m2(k) == 0
            new2(i) = -1/log(f2(k));
        end
    end
end











