function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    package = findpackage('dfilt');
    parent = findclass(package, 'dffir');
    % 12 13
    thisclass = schema.class(package, 'dfsymfir', parent);
end % function
