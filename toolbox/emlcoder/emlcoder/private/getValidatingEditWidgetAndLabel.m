function [widget, widgetLbl] = getValidatingEditWidgetAndLabel(a_hSrc, a_Property, a_Visible, a_Enabled, a_Refresh, a_Name, a_ToolTip, a_TagPrefix, a_WidgetIdPrefix, a_PageName)
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
    widgetLbl = [];
    widgetLbl.Name = a_Name;
    widgetLbl.Type = 'text';
    widgetLbl.Tag = horzcat(a_TagPrefix, a_Property, 'Lbl');
    widgetLbl.Visible = a_Visible;
    widgetLbl.ToolTip = a_ToolTip;
    widgetLbl.WidgetId = horzcat(a_WidgetIdPrefix, a_Property, 'Lbl');
    % 32 34
    % 33 34
    widget = getValidatingEditWidget(a_hSrc, a_Property, a_Visible, a_Enabled, a_Refresh, '', a_ToolTip, a_TagPrefix, a_WidgetIdPrefix, a_PageName);
    % 35 47
    % 36 47
    % 37 47
    % 38 47
    % 39 47
    % 40 47
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    % 46 47
    widget.UserData.Name = a_Name;
end % function