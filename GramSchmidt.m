% Source: https://github.com/radusqrt/numerical-methods/blob/master/matlab/qr/GramSchmidt.m
% https://ocw.cs.pub.ro/courses/_media/mn/laboratoare/lab_mn_03.pdf
% function which implements the Gram Schmidt algorithm
function GramSchmidt()
    % call the function which reads the data
    [m, n, A, b] = read_data();
    
    % if the matrix is square, use the modified Gram Schmidt algorithm
    if m == n
      % start timer
      tic;
      n = length(A);
      Q = zeros(n);
      R = zeros(n);
      for i = 1:n
        R(i,i) = norm(A(:,i));
        Q(:,i) = A(:,i) / R(i,i);
        for j = i+1:n
          R(i,j) = Q(:,i)' * A(:,j);
          A(:,j) = A(:,j) - Q(:,i) * R(i,j);
        end
      end
    % if the matrix in not square, use the original Gram Schmidt algorithm
    else
      % start timer
      tic;
      [m n] = size(A);
      Q = [];
      % iterate through every column for calculating the orthogonal matrix Q
      for k = 1 : n
      % initialize q with the current column from A and keep a copy of it
          q = A(1 : m, k);
          temp = q;
          for j = 1 : k-1
              % calculate the scalar product
              sp = sum(temp .* Q(:, j));
              % create orthogonal vectors
              q = q - sp * Q(1 : m, j);
          end
    
          % normalize the vector
          q = q / norm(q);
          % add it to the matrix
          Q = [Q q];
          R = Q' * A;
      end
    end
    
    % stop time - it will be the time for computing the Q and R matrices
    QR_computing_time = toc
    % start time again
    tic;

    % solve the system
    % A * x = b => Q * R * x = b => R * x = transpose(Q) * b
    x = SST(R, Q' * b);

    % stop time - it will be the time for computing
    % the x solutions column vector
    X_computing_time = toc
    disp("Total execution time:")
    Total_time = QR_computing_time + X_computing_time

    % print the x results column vector
    print_data(x);
end

