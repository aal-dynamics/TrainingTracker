codeunit 70000 DYGCreateSessionFromPlanTT
{
    internal procedure CreateSessionFromPlan(var DYGSessionTT: Record DYGSessionTT; HideDialog: Boolean)
    var
        IsHandled: Boolean;
    begin
        if not ConfirmCreateSessionFromPlan(DYGSessionTT, HideDialog) then exit;
        OnBeforeCreateSessionFromPlan(DYGSessionTT, IsHandled);
        DoCreateSessionFromPlan(DYGSessionTT, IsHandled);
        OnAfterCreateSessionFromPlan(DYGSessionTT);
        AcknowledgeCreateSessionFromPlan(DYGSessionTT, HideDialog);
    end;

    local procedure DoCreateSessionFromPlan(var DYGSessionTT: Record DYGSessionTT; var IsHandled: Boolean)
    begin
        if IsHandled then
            exit;
    end;

    local procedure ConfirmCreateSessionFromPlan(var DYGSessionTT: Record DYGSessionTT; HideDialog: Boolean): Boolean
    var
        ConfirmManagement: Codeunit "Confirm Management";
        DefaultAnswer: Boolean;
        ConfirmQst: Label 'Are You Sure?';
    begin
        DefaultAnswer := false;

        if HideDialog then exit(DefaultAnswer);
        exit(ConfirmManagement.GetResponseOrDefault(ConfirmQst, DefaultAnswer));
    end;

    local procedure AcknowledgeCreateSessionFromPlan(var DYGSessionTT: Record DYGSessionTT; HideDialog: Boolean)
    var
        AcknowledgeMsg: Label 'You successfully executed "CreateSessionFromPlan".';
    begin
        if not GuiAllowed() or HideDialog then
            exit;
        Message(AcknowledgeMsg);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCreateSessionFromPlan(var DYGSessionTT: Record DYGSessionTT; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCreateSessionFromPlan(var DYGSessionTT: Record DYGSessionTT)
    begin
    end;
}