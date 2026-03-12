codeunit 70000 ALFCreateSessionFromPlanTT
{
    Permissions = tabledata ALFPlanLineTT = R,
                    tabledata ALFPlanTT = R,
                    tabledata ALFSessionLineTT = RIM,
                    tabledata ALFSessionTT = RIMD;

    internal procedure CreateSessionFromPlan(var ALFSessionTT: Record ALFSessionTT; HideDialog: Boolean)
    var
        IsHandled: Boolean;
    begin
        if not ConfirmCreateSessionFromPlan(HideDialog) then
            exit;
        OnBeforeCreateSessionFromPlan(ALFSessionTT, IsHandled);
        DoCreateSessionFromPlan(ALFSessionTT, IsHandled);
        OnAfterCreateSessionFromPlan(ALFSessionTT);
        AcknowledgeCreateSessionFromPlan(HideDialog);
    end;

    local procedure DoCreateSessionFromPlan(var ALFSessionTT: Record ALFSessionTT; IsHandled: Boolean)
    var
        ALFPlanLineTT: Record ALFPlanLineTT;
        ALFPlanTT: Record ALFPlanTT;
        ALFSessionLineTT: Record ALFSessionLineTT;
        ALFSessionTT2: Record ALFSessionTT;
        ALFSessionDateDialogTT: Page ALFDateInputDialogTT;
        LastLineNo: Integer;
    begin
        if IsHandled then
            exit;

        if ALFSessionTT.Date = 0D then begin
            if ALFSessionDateDialogTT.RunModal() <> Action::LookupOK then
                exit;
            ALFSessionTT.Date := ALFSessionDateDialogTT.GetDate();
            ALFSessionTT.Insert(true);
        end;

        if Page.RunModal(Page::ALFPlanListTT, ALFPlanTT) <> Action::LookupOK then
            exit;

        ALFPlanLineTT.SetCurrentKey(ExerciseGroup);
        ALFPlanLineTT.SetRange(PlanCode, ALFPlanTT.Code);
        if not ALFPlanLineTT.FindSet(false) then
            exit;

        ALFSessionLineTT.SetRange(SessionDate, ALFSessionTT.Date);
        if ALFSessionLineTT.FindLast() then
            LastLineNo := ALFSessionLineTT.LineNo;
        LastLineNo += 10000;

        repeat
            ALFSessionLineTT.Init();
            ALFSessionLineTT.SessionDate := ALFSessionTT.Date;
            ALFSessionLineTT.LineNo := LastLineNo;
            ALFSessionLineTT.ExerciseCode := ALFPlanLineTT.ExerciseCode;
            ALFSessionLineTT.ExerciseName := ALFPlanLineTT.ExerciseName;
            ALFSessionLineTT.Repetitions := ALFPlanLineTT.Repetitions;
            ALFSessionLineTT.Weight := ALFPlanLineTT.Weight;
            ALFSessionLineTT.Insert(true);
        until ALFPlanLineTT.Next() = 0;

        if ALFSessionTT2.Get(0D) then
            ALFSessionTT2.Delete(false);
    end;

    local procedure ConfirmCreateSessionFromPlan(HideDialog: Boolean): Boolean
    var
        ConfirmManagement: Codeunit "Confirm Management";
        DefaultAnswer: Boolean;
        ConfirmQst: Label 'Are You Sure?', Comment = 'de-DE=Sind Sie sicher?';
    begin
        DefaultAnswer := true;

        if not GuiAllowed() or HideDialog then
            exit(DefaultAnswer);
        exit(ConfirmManagement.GetResponseOrDefault(ConfirmQst, DefaultAnswer));
    end;

    local procedure AcknowledgeCreateSessionFromPlan(HideDialog: Boolean)
    var
        AcknowledgeMsg: Label 'You successfully executed "CreateSessionFromPlan".';
    begin
        if not GuiAllowed() or HideDialog then
            exit;
        Message(AcknowledgeMsg);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCreateSessionFromPlan(var ALFSessionTT: Record ALFSessionTT; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCreateSessionFromPlan(var ALFSessionTT: Record ALFSessionTT)
    begin
    end;
}