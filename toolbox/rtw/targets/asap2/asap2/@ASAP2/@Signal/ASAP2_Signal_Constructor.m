function h = ASAP2_Signal_Constructor(h, varargin)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    nargin = length(varargin);
    % 19 21
    % 20 21
    hSuperPackage = findpackage('Simulink');
    hSuperClass = findclass(hSuperPackage, 'Signal');
    if not(isempty(hSuperClass.methods)) && not(isempty(find(hSuperClass.methods, 'Name', 'Simulink_Signal_Constructor')))
        % 24 25
        h.Simulink_Signal_Constructor;
    end % if
end % function
