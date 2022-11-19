% Profeanu Ioana, 323CA
% function used for generating the output files with the
% correct results
function MatlabSolver()
    % reads data from the input file
    fileID = fopen('../in/test5.in', 'r');
    dformatSpec = '%d';
    fformatSpec = '%f';
    m = fscanf(fileID, dformatSpec, [1 1]);
    n = fscanf(fileID, dformatSpec, [1 1]);
    A = fscanf(fileID, fformatSpec, [m n]);
    if m == n
      A = A';
    end
    b = fscanf(fileID, fformatSpec, [m 1]);

    % use Matlab linsolve to get the results of the equation system
    x = linsolve(A, b);

    fileID = fopen('../out/test5.out','w');
    fprintf(fileID,'%4.4f\n',x);
    fclose(fileID);
end

