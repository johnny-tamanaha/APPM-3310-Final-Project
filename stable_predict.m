function [x_predicted, lower, upper] = stable_predict(year)
% Find x_predicted for lineary predicted ISC matrix and e vector
    diff = stability();
    all_years = diff(:, 2);
    stable_years = zeros(21, 1);
    for i = 1:21
        if all_years(i, 1) < 300000
            stable_years(i, 1) = 1;
        end
    end
    stable_years = string(diff(logical(stable_years)));
    ISC_container = containers.Map;
    e_container = containers.Map;
    for i = 1:size(stable_years)
        [ISC, e] = data_extract(stable_years(i));
        ISC_container(stable_years(i)) = ISC;
        e_container(stable_years(i)) = e;
    end
    ISC_predicted = zeros(15, 15);
    e_predicted = zeros(15, 1);
    [n, ~] = size(stable_years);
    x1 = zeros(n, 1);
    y1 = zeros(n, 1);
    x2 = zeros(n, 1);
    y2 = zeros(n, 1);
    for i = 1:15
        for j = 1:15
            for k = 1:size(stable_years)
                ISC = ISC_container(stable_years(k));
                x1(k, 1) = str2double(stable_years(k));
                y1(k, 1) = ISC(i, j);
            end
            lmod1 = fitlm(x1, y1);
            coef1 = lmod1.Coefficients.Estimate;
            ISC_predicted(i, j) = coef1(1, 1) + coef1(2, 1)*year;
        end
        for k = 1:size(stable_years)
            e = e_container(stable_years(k));
            x2(k, 1) = str2double(stable_years(k));
            y2(k, 1) = e(i, 1);
        end
        lmod2 = fitlm(x2, y2);
        coef2 = lmod2.Coefficients.Estimate;
        e_predicted(i, 1) = coef2(1, 1) + coef2(2, 1)*year;
    end
    x_predicted = ISC_predicted\e_predicted;  
    
    [ISC_2008, ~] = data_extract('2008');
    [ISC_2009, ~] = data_extract('2009');
    lower = ISC_2009\e_predicted;
    upper = ISC_2008\e_predicted;
end

