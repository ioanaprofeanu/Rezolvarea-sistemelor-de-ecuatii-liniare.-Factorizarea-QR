% function which reads the data from test.in
function [m, n, A, b] = read_data()
  % open the input file and read the data
    fileID = fopen('test.in', 'r');
    dformatSpec = '%d';
    fformatSpec = '%f';
    % read the dimensions of the matrix
    m = fscanf(fileID, dformatSpec, [1 1]);
    n = fscanf(fileID, dformatSpec, [1 1]);
    % read the coefficient matrix
    A = fscanf(fileID, fformatSpec, [m n]);
    if m == n
      A = A';
    end
    % read the results matrix
    b = fscanf(fileID, fformatSpec, [m 1]);
    fclose(fileID);
end

