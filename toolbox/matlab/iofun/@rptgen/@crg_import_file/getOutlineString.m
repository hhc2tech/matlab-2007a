function s = getOutlineString(c)
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
    fName = c.FileName;
    if isempty(fName)
        fName = '<None Specified>';
    end % if
    % 15 16
    s = sprintf('File - %s', fName);
end % function