function registerModel(this, mdl)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    idx = this.createModelEntry(mdl);
    % 7 8
    this.modelInfo(idx).modelData.registered = true;
end % function