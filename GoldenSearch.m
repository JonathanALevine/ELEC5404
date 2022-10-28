function [n1, n2, n3, n4] = GoldenSearch(n1, n2, Phi)
    % Step 1: Initialization
    n3 = n2 - 0.618*(n2-n1);
    n4 = n1 + 0.618*(n2-n1);
    % Step 2:
    max_iteration = 100;
    for iteration = 1:max_iteration
        if Phi(n3) < Phi(n4)
            n2 = n4;
        else
            n1 = n3;
        end
        n3 = n2 - 0.618*(n2-n1);
        n4 = n1 + 0.618*(n2-n1);
        if abs(n1-n2) < 1e-5
            break
        end
    end
    % Step 3: Solution is any one of the following
    n1; n2; n3; n4;
    return
end