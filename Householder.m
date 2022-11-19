% Source :https://github.com/radusqrt/numerical-methods/blob/master/matlab/qr/Householder.m
% function which implements the Householder algorithm
function Householder()
    % call the function which reads the data
    [m, n, A, b] = read_data();

    % start timer
    tic;
    
    n = length(b);
    Q = eye(n);

    % iterate through every step for creating the upper triangular matrix
    for p = 1 : (n - 1)
        % initialize vp with zeros
        vp = zeros(n, 1);
        % fill vp from i + 1 to n with the values from the p-th column of A
        vp((p + 1) : n) = A((p + 1) : n, p);
        % Calculate sigma and the p-th element of vp
        sigma_p = sign(A(p, p)) * norm(A(p : n, p));
        vp(p) = A(p, p) + sigma_p;
        % calculate the p-th step reflector
        Hp = eye(n) - 2 * vp * vp' / (vp' * vp);
        % remove elements under the p-th pivot in A
        A = Hp * A;
        Q = Hp * Q;
    end

    % Hn-1 * Hn-2 * ... * H2 * H1 * A = R
    % current Q = Hn-1 * Hn-2 * ... * H1, but for A = Q * R
    % => Q = inverse(current Q) = transpose(current Q)
    Q = Q';
    % A became an upper triangular matrix
    R = A;

    % stop time - it will be the time for computing the Q and R matrices
    QR_computing_time = toc
    % start time again
    tic;

    % Solve the upper triangular system
    % A * x = b <=> Q * R * x = b <=> R * x = transpose(Q) * b
    x = SST(R, Q' * b);
 
    % stop time - it will be the time for computing
    % the x solutions column vector
    X_computing_time = toc
    disp("Total execution time:")
    % time will be the sum of the two computing times
    Total_time = QR_computing_time + X_computing_time
    
    % print the x results column vector
    print_data(x);
end

