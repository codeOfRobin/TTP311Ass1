function ret=lvRHS(t,y)
    % set up ret in correct form (i.e. a column vector)
    ret = zeros(2,1);
    % extract current values of V and P
    S = y(1);
    C = y(2);
    % return updates
    ret(1) =0.1*C-5*S*(0.1-C);
    ret(2) = 5*S*(0.1-C)-(0.1+1)*C;