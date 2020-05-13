function[x] = projection(A, b)
    % Get the minimized norm for the linear system Ax=b

    % LU factorization of of A (O(n^3))
    % gaussian elimination has complexity n^3
    [~, U, ~] = lu(A);
    % Size of A
    [m, n] = size(A);
    
    % Find the pivot columns of A (O(n^2))
    % n^2 conditional checks 
    pivot_columns = zeros(1, n);
    for row = 1:m
        for col = 1:n
            if U(row, col) > 0.00001
                pivot_columns(col) = 1;
                break
            end
        end
    end
    pivot_columns = logical(pivot_columns);
    
    % Create a matrix of a basis of img A
    A_basis = A(:, pivot_columns);
    % Find an orthonormal basis of img A (O(n^3))
    % QR decomposition using Householder transformation has complexity n^3
    [Q, ~] = qr(A_basis, 0);
    
    % Get the projection of b onto the image of A (O(n^2))
    % n+1 multiplications, 1 addition, n loops
    bhat = 0;
    [~, n] = size(Q);
    for col = 1:n
        bhat = bhat + dot(b, Q(:,col))*Q(:,col);
    end
    
    % Get a basis for the kernel of A (O(n^3))
    % SVD has complexity n^3
    ker_T = transpose(null(A));
    [n, ~] = size(ker_T);
    
    % Solve with extra constraints (O(n^3))
    % solve Ax=b is lu decomp + back elimination
    A = vertcat(A, ker_T);
    bhat = vertcat(bhat, zeros(n, 1));
    x = A\bhat;
end

