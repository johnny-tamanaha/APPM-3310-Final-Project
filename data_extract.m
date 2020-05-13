function [ISC, e] = data_extract(sheet1)
% Read Data
% sheet1: string of desired year

    % Read xlsx file with the given sheet
    [numData1, ~, ~] = xlsread('IOUse_After_Redefinitions_PRO_1997-2018_Sector.xlsx', sheet1);
    numData1(isnan(numData1)) = 0;
    C = numData1(1:15, 1:15);
    xprime = numData1(1:15, 28);
    e = numData1(1:15, 27);
    
    % Caluclate the simplified consumption matrix for the predictor data
    SC = zeros(15);
    for i=1:15
        for j=1:15
            SC(i, j) = C(i, j)/xprime(j, 1);
        end
    end
    
    % Calculate I - SC 
    ISC = eye(15) - SC;
    
end