function schema
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    package = findpackage('dfilt');
    parent = findclass(package, 'abstractlattice');
    % 13 14
    thisclass = schema.class(package, 'latticear', parent);
end % function