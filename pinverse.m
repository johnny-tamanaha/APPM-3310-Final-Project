function [x] = pinverse(A, b)
% Find the pseudoinverse of A

    % Find singular value decomp of A (O(n^3))
    % SVD complexity
    [U, S, V] = svd(A);
    
    % Calculate pseudoinverse of A (O(n^3))
    % 2(n*n*n) operations
    [n, ~] = size(S);
    Sinv = zeros(n, n);
    for i = 1:n
        if S(i, i) > 0.00001
            Sinv(i, i) = 1/S(i,i);
        end
    end
    Ainv = mtimes(V, mtimes(Sinv, transpose(U)));
    
    % Solve singular lease squares (O(n^2))
    % n*n*1 operations
    x = mtimes(Ainv, b);
end

