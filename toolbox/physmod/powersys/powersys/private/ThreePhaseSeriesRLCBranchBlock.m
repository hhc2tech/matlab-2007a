function [sps, Multimeter] = ThreePhaseSeriesRLCBranchBlock(nl, sps, Multimeter)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    idx = nl.filter_type('Three-Phase Series RLC Branch');
    for i=1.0:length(idx)
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        [R, L, C] = getSPSmaskvalues(block, {'Resistance','Inductance','Capacitance'});
        BranchType = get_param(block, 'BranchType');
        switch BranchType
        case 'R'
            L = 0.0;
            C = Inf;
        case 'L'
            R = 0.0;
            C = Inf;
        case 'C'
            L = 0.0;
            R = 0.0;
        case 'RL'
            C = Inf;
        case 'RC'
            L = 0.0;
        case 'LC'
            R = 0.0;
        end % switch
        blocinit(block, cellhorzcat(R, L, C));
        if eq(C, Inf)
            C = 0.0;
        end % if
        nodes = nl.block_nodes(block);
        sps.rlc(plus(end, 1.0):plus(end, 3.0), 1.0:6.0) = vertcat(horzcat(nodes(1.0), nodes(4.0), 0.0, R, mtimes(L, 1000.0), mtimes(C, 1e+06)), horzcat(nodes(2.0), nodes(5.0), 0.0, R, mtimes(L, 1000.0), mtimes(C, 1e+06)), horzcat(nodes(3.0), nodes(6.0), 0.0, R, mtimes(L, 1000.0), mtimes(C, 1e+06)));
        % 39 41
        sps.rlcnames{plus(end, 1.0)} = horzcat('phase_A: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('phase_B: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('phase_C: ', BlockNom);
        Multimeter = BlockMeasurements(block, sps.rlc, Multimeter);
    end % for
