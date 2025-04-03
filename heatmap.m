% Empirical Contagion Risk Data Analysis

% Initialize Matlab
close all;
clc;
clear;

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


%% Step 2: Obtain Empirical estimate of CRVaR(q);
% Rolling window of 1000 observation
roll = 1000 - 1; % we lose the first roll-1 result

q = 0.90:0.001:0.999; % confidence levels with increment 0.1%

tic
crvar1 = ones(size(q,2),size(x1,1)-roll);
for i = 1:size(x1,1)-roll
    result = crvar2(x1(i:roll+i),x2(i:roll+i),q);
    crvar1(:,i) = result;
end
toc

% columns: different dates (-> further in time)
% rows: different q values (^ lower q)

%% Step 3: Generate Heatmap 

% Get x-axis
times = data.Date(roll+1:end);  % datetime array

% This command will configure the axes for use with datetime

% Then delete the line created by the plot command.
delete(plot(times(1), q(1)));

% Now hold is required, because otherwise the axes will be reset by the
% image command.
hold on

% Now you can convert from datetime to numerics using ruler2num
x = ruler2num(times, gca().XAxis);

% Now pass the double data to imagesc.
im=imagesc(x,q,crvar1);

% Finally, because hold was on, you need to manually set the limits (which
% is normally done for you by imagesc) and turn on the box. I ommited
% flipping the YDir becuse you seem to want that set to 'normal' anyway.
axis tight
box on
hold off

% Labels and Titles
%title('CRVaR(q) FTSE100 vs S\&P500','Interpreter','LaTex','FontSize',22)
xlabel('Date','Interpreter','LaTex','FontSize',22);
ylabel('Confidence Level $q$','Interpreter','LaTex','FontSize',22);

colorbar
colormap(turbo)
%% Line Graph
figure
hold on
tic
for k = 1:size(crvar1,1)
    plot(times, crvar1(k,:))
end
toc
title('CRVaR(q) FTSE100 vs S\&P500','Interpreter','LaTex','FontSize',22)
xlabel('Date','Interpreter','LaTex','FontSize',16);
ylabel('CRVaR(q)','Interpreter','LaTex','FontSize',16);
hold off


















