function [diff] = stability()
% check the stability of each years ISC matrix
    years_tail = string(1997:2017);
    years_head = string(1998:2018);
    diff = zeros(2017-1997, 1);
    for i = 1:2018-1997
        [x, x_actual, ~] = predict_x_single(years_tail(1, i), years_head(1, i));
        diff(i, 1) = sum(x) - sum(x_actual);  
    end
    years = 1997:2017;
    diff = horzcat(years', abs(round(diff, 0)));
end

