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
    hBasePackage = findpackage('PMDialogs');
    hBaseObj = hBasePackage.findclass('PmDropDown');
    hCreateInPackage = findpackage('NetworkEngine');
    % 14 16
    % 15 16
    hThisClass = schema.class(hCreateInPackage, 'PmNeDropDown', hBaseObj);
    % 17 19
    % 18 19
    schema.prop(hThisClass, 'hStateMgr', 'handle');
end % function
