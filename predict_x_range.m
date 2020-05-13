function [years, actual, predictions] = predict_x_range(year)
% Compute prediction and actual x vector sums from year + 1 to 2018 using
% the ISC matrix from year
    years = string(year+1:2018);
    actual = zeros(1, 2018-year);
    predictions = zeros(1, 2018-year);
    for i = 1:(2018-year)
        [x, x_actual, ~] = predict_x_single(string(year), years(1, i));
        actual(1, i) = sum(x_actual);
        predictions(1, i) = sum(x);
    end
    years = year+1:2018;
end

