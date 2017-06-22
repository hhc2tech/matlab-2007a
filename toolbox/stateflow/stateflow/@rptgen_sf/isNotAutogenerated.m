function tf = isNotAutogenerated(sfID)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    oIsa = sf('get', sfID.ID, '.isa');
    if eq(oIsa, 4.0) || eq(oIsa, 5.0) || eq(oIsa, 8.0) || eq(oIsa, 6.0)
        % 9 12
        % 10 12
        % 11 12
        tf = not(sf('get', sfID.ID, '.autogen.isAutoCreated'));
    else
        tf = true;
    end % if
end % function