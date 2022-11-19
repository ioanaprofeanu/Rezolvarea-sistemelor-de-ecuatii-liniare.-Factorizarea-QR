% function which prints the data to test.out
function print_data(x)    
    % display the x solutions matrix into the output file
    fileID = fopen('test.out','w');
    fprintf(fileID,'%4.4f\n',x);
    fclose(fileID);
end

