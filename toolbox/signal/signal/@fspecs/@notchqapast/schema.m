function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    c = schema.class(pk, 'notchqapast', pk.findclass('abstractpeaknotchq'));
    % 10 11
    p = schema.prop(c, 'Apass', 'double');
    set(p, 'FactoryValue', 1.0);
    % 13 14
    p = schema.prop(c, 'Astop', 'double');
    set(p, 'FactoryValue', 60.0);
end % function
