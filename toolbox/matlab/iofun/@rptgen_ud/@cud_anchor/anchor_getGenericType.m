function gt = anchor_getGenericType(c)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    gt = c.UddType;
    if strcmp(gt, 'auto')
        adUD = rptgen_ud.appdata_ud;
        gt = adUD.getContextType(c, logical(1));
    end
end
