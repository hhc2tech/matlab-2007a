function [success, msg] = dlgCallback(obj, action, dlg)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    switch action
    case 'generate'
        applyFcn = @pDialogGenerate;
    case 'export'
        applyFcn = @pDialogExport;
    case 'choose'
        applyFcn = @pDialogChoose;
    case 'edit'
        applyFcn = @pDialogEdit;
    case 'compare'
        applyFcn = @pDialogCompare;
    end % switch
    % 37 38
    try
        [success, msg] = applyFcn(obj, 'apply', dlg);
    catch
        success = false;
        msg = sprintf('Error: %s\n', lasterr);
    end % try
end % function