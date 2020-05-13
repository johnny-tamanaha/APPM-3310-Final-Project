function [x_proj, x_pinv] = solve_singular(A, b)
%Show all 3 solutions to the imcompatible system Ax=b
    x_proj = projection(A, b);
    x_pinv = pinverse(A, b);
end

