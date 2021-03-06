function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'interp', pk.findclass('abstractmultirate'));
    % 10 13
    % 11 13
    % 12 13
    p = schema.prop(c, 'privInterpolationFactor', 'posint');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off', 'FactoryValue', 2.0, 'AccessFlags.Serialize', 'Off');
    % 15 17
    % 16 17
    p = schema.prop(c, 'InterpolationFactor', 'posint');
    set(p, 'SetFunction', @setinterpolationfactor, 'GetFunction', @getinterpolationfactor);
end % function
