function ind = findByFile(obj, filename)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    thesefiles = cellstr(get(obj, 'FileName'));
    match = dependencies.compare_filenames(thesefiles, filename);
    ind = find(match);
end % function