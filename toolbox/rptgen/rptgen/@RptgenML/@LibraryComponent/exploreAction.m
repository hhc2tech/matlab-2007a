function exploreAction(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    c = getCurrentComponent(RptgenML.Root);
    if not(isempty(c))
        acceptDrop(c, this);
    end % if
end % function