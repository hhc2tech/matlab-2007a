function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fmethod');
    parent = findclass(pk, 'abstracteqrip');
    c = schema.class(pk, 'eqripsbarbmag', parent);
    % 11 12
    p = schema.prop(c, 'Weights', 'double_vector');
end % function
