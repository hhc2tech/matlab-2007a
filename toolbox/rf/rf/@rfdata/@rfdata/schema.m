function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    package = findpackage('rfbase');
    parent = findclass(package, 'rfbase');
    % 9 11
    % 10 11
    h = schema.class(findpackage('rfdata'), 'rfdata', parent);
end % function
