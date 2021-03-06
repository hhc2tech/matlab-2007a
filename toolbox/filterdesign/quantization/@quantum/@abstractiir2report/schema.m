function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'abstractiir2report', pk.findclass('abstractiirreport'));
    set(c, 'Description', 'abstract');
    % 11 12
    findclass(pk, 'abstractlog');
    % 13 14
    p = schema.prop(c, 'States', 'quantum.abstractlog');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
end % function
