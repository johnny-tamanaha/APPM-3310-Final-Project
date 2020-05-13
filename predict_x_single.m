function [x, x_actual, diff] = predict_x_single(sheet1, sheet2)
% Read pro data

    % Read the predictor data and collect the comsumption matrix and total
    % demand
    [numData1, ~, ~] = xlsread('IOUse_After_Redefinitions_PRO_1997-2018_Sector.xlsx', sheet1);
    numData1(isnan(numData1)) = 0;
    C = numData1(1:15, 1:15);
    xprime = numData1(1:15, 28);
    
    % Read the response data and collect the external demand and total
    % demand
    [numData2, ~, ~] = xlsread('IOUse_After_Redefinitions_PRO_1997-2018_Sector.xlsx', sheet2);
    numData2(isnan(numData2)) = 0;
    e = numData2(1:15, 27);
    x_actual = numData2(1:15, 28);
    
    % Caluclate the simplified consumption matrix for the predictor data
    SC = zeros(15);
    for i=1:15
        for j=1:15
            SC(i, j) = C(i, j)/xprime(j, 1);
        end
    end
    
    % Find I-SC and use it to predict the total demand in the response year
    ISC = eye(15) - SC;
    
    % Prediction
    x = ISC\e;
    
    % Prediction error
    diff = sqrt(mean((x_actual-x).^2));
end

