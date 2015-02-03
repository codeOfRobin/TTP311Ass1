function ret=lvRHS(t,y)
    % set up ret in correct form (i.e. a column vector)
    ret = zeros(2,1);
    % extract current values of V and P
    V = y(1);
    P = y(2);
    % return updates
    ret(1) = 0.1 * V - 0.2 * V * P;
    ret(2) = 0.4 * P * V - 0.2 * P;