function varargout = drive_lossyplanetringblock(Mode, varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    switch lower(Mode)
    case 'mask'
        dr = get_param(0.0, 'DomainRegistry');
        dr.load('driveline_domain');
        % 15 17
        LossPower = varargin{1.0};
        LossTorque = varargin{2.0};
        % 18 22
        % 19 22
        % 20 22
        Icon.x1 = [-.7 -.5 -.5 -.2 -.2 -.5 -.5];
        Icon.y1 = [0.0 0.0 .2 .2 -.2 -.2 0.0];
        Icon.x2 = [-.2 0.0 0.0 .3 .3 .3];
        Icon.y2 = [0.0 0.0 .6 .6 .8 .4];
        Icon.x3 = [.3 .3];
        Icon.y3 = [.6 .6];
        Icon.x4 = [.2 .4];
        Icon.y4 = [.4 .4];
        Icon.x5 = [.2 .4];
        Icon.y5 = [.8 .8];
        Icon.x6 = [.2 .4];
        Icon.y6 = [.9 .9];
        Icon.x7 = [.3 .3 .65 .65];
        Icon.y7 = [.9 1.0 1.0 0.0];
        Icon.x8 = [.7 1.0];
        Icon.y8 = [0.0 0.0];
        Icon.x9 = [1.0 1.0 1.3 1.3 1.0 1.0];
        Icon.y9 = [0.0 .2 .2 -.2 -.2 0.0];
        Icon.x10 = [1.3 1.5];
        Icon.y10 = [0.0 0.0];
        Icon.x11 = [-.6 -.1];
        Icon.y11 = [-.2 -.2];
        Icon.x12 = [-.5 -.2];
        Icon.y12 = [-.25 -.25];
        Icon.x13 = [-.4 -.3];
        Icon.y13 = [-.31 -.31];
        Icon.x14 = [.9 1.4];
        Icon.y14 = [-.2 -.2];
        Icon.x15 = [1.0 1.3];
        Icon.y15 = [-.25 -.25];
        Icon.x16 = [1.1 1.2];
        Icon.y16 = [-.31 -.31];
        % 53 55
        Affordance.x1 = [-.4 .2];
        Affordance.y1 = [.85 .85];
        Affordance.x2 = [-.4 -.2];
        Affordance.y2 = [.85 .95];
        Affordance.x3 = [-.4 -.2];
        Affordance.y3 = [.85 .75];
        % 60 64
        % 61 64
        % 62 64
        Icon.LowerLeftx = -1.0;
        Icon.LowerLefty = -1.0;
        Icon.UpperRightx = 1.8;
        Icon.UpperRighty = 1.0;
        % 67 69
        varargout{1.0} = Icon;
        varargout{2.0} = Affordance;
        % 70 72
        PHandles = get_param(gcb, 'PortHandles');
        drive_set_param(PHandles.LConn(1.0), 'Tag', 'P');
        drive_set_param(PHandles.LConn(2.0), 'Tag', 'C');
        drive_set_param(PHandles.RConn, 'Tag', 'R');
        % 75 78
        % 76 78
        Name = eval('gcb');
        FullName = drive_gentag(Name);
        % 79 82
        % 80 82
        DriveSignal{1.0} = LossTorque;
        DriveSignal{2.0} = LossPower;
        % 83 85
        OutPosition{1.0} = [375.0 55.0 395.0 75.0];
        OutPosition{2.0} = [375.0 105.0 395.0 125.0];
        % 86 88
        FromPosition{1.0} = [270.0 51.0 310.0 79.0];
        FromPosition{2.0} = [270.0 101.0 310.0 129.0];
        % 89 91
        OutputNames{1.0} = 'T';
        OutputNames{2.0} = 'L';
        % 92 94
        FromNames{1.0} = 'Torque';
        FromNames{2.0} = 'Loss';
        % 95 97
        pCount = 0.0;
        for i=1.0:2.0
            FromName = FromNames{i};
            PortName = OutputNames{i};
            NewName = horzcat(Name, '/', PortName);
            Port = find_system(Name, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Name', PortName);
            if eq(DriveSignal{i}, 1.0)
                pCount = plus(pCount, 1.0);
                if isempty(Port)
                    NewBlock = add_block('built-in/Outport', NewName);
                    set_param(NewBlock, 'Port', num2str(pCount));
                    set_param(NewBlock, 'Position', OutPosition{i});
                    % 108 110
                    NewBlock = add_block('built-in/From', horzcat(Name, '/', FromName));
                    set_param(NewBlock, 'Position', FromPosition{i});
                    add_line(Name, horzcat(FromName, '/1'), horzcat(PortName, '/1'), 'autorouting', 'on');
                end
                set_param(horzcat(Name, '/', FromName), 'GotoTag', horzcat(FullName, FromName));
            else
                if not(isempty(Port))
                    delete_line(Name, horzcat(FromName, '/1'), horzcat(PortName, '/1'));
                    delete_block(NewName);
                    delete_block(horzcat(Name, '/', FromName));
                end
            end
        end % for
    case 'compile'
        Data = varargin{1.0};
        Data.block = DRIVE.DriveBlock;
        Data.block.type = 'DRIVELOSSYPLANETRING';
        Data.block.name = getfullname(Data.BlockHandle);
        Data.block.visibleName = drive_getvisibleblock(Data.BlockHandle);
        Data.block.flange = minus(Data.FlangeMap(Data.PortIndex), 1.0);
        Data.block.lossyPlanetRing = DRIVE.DriveLossyPlanetRing;
        % 130 132
        Ws = get_param(Data.BlockHandle, 'MaskWsVariables');
        Search = cellhorzcat(Ws.Name);
        % 133 135
        LinearizationFlag = Ws(strmatch('LinearizationFlag', Search, 'exact')).Value;
        if eq(LinearizationFlag, 1.0)
            Data.block.lossyPlanetRing.forceUnityEfficiency = true;
        else
            Data.block.lossyPlanetRing.forceUnityEfficiency = false;
        end
        LossTorque = Ws(strmatch('LossTorque', Search, 'exact')).Value;
        if LossTorque
            Data.block.lossyPlanetRing.lossTorque = true;
            From = find_system(Data.BlockHandle, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'BlockType', 'From');
            if gt(length(From), 1.0)
                if strcmp(get_param(From(1.0), 'Name'), 'Torque')
                    FromTorque = From(1.0);
                else
                    FromTorque = From(2.0);
                end
            else
                FromTorque = From;
            end
            Data.block.lossyPlanetRing.lossTorqueFlag = get_param(FromTorque, 'GotoTag');
            Data.SizesStructure.numDynamicOutputs = plus(Data.SizesStructure.numDynamicOutputs, 1.0);
        end
        % 156 158
        LossPower = Ws(strmatch('LossPower', Search, 'exact')).Value;
        if LossPower
            Data.block.lossyPlanetRing.lossPower = true;
            From = find_system(Data.BlockHandle, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'BlockType', 'From');
            if gt(length(From), 1.0)
                if strcmp(get_param(From(1.0), 'Name'), 'Loss')
                    FromPower = From(1.0);
                else
                    FromPower = From(2.0);
                end
            else
                FromPower = From;
            end
            Data.block.lossyPlanetRing.lossPowerFlag = get_param(FromPower, 'GotoTag');
            Data.SizesStructure.numDynamicOutputs = plus(Data.SizesStructure.numDynamicOutputs, 1.0);
        end
        % 173 175
        VelocityTolerance = Ws(strmatch('Tolerance', Search, 'exact')).Value;
        if isempty(VelocityTolerance)
            VelocityTolerance = 0.0;
        else
            if lt(VelocityTolerance, 0.0)
                VelocityTolerance = 0.0;
            end
        end
        Data.block.lossyPlanetRing.velocityTolerance = VelocityTolerance;
        DriveEfficiency = Ws(strmatch('Efficiency', Search, 'exact')).Value;
        if le(DriveEfficiency, 0.0) || gt(DriveEfficiency, 1.0)
            blockName = horzcat('''', regexprep(Data.block.name, '\n+', ' '), '''');
            error('physmod:drive:drive_lossyplanetringblock:InvalidEfficiency', horzcat('The efficiency specified in block:', blockName, ' must be in the interval (0,1]. Check and reset the efficiency.'));
            % 187 189
        end
        Data.block.lossyPlanetRing.efficiency = DriveEfficiency;
        % 190 192
        Ratio = Ws(strmatch('Ratio', Search, 'exact')).Value;
        Data.block.lossyPlanetRing.ratio = Ratio;
        % 193 196
        % 194 196
        Data.SizesStructure.numModes = plus(Data.SizesStructure.numModes, 1.0);
        Data.SizesStructure.numZeroCrossings = plus(Data.SizesStructure.numZeroCrossings, 1.0);
        % 197 199
        for i=1.0:length(Data.PortHandle)
            name = drive_get_param(Data.PortHandle(i), 'Tag');
            switch lower(name)
            case 'c'
                Data.block.lossyPlanetRing.carrierFlange = minus(i, 1.0);
            case 'p'
                Data.block.lossyPlanetRing.planetFlange = minus(i, 1.0);
            case 'r'
                Data.block.lossyPlanetRing.ringFlange = minus(i, 1.0);
            end
        end % for
        % 209 211
        varargout{1.0} = Data;
    end
end
