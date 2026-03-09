page 70003 DYGSessionCardTT
{
    ApplicationArea = All;
    Caption = 'Training Session', Comment = 'de-DE=Trainingseinheit';
    PageType = Card;
    SourceTable = DYGSessionTT;
    UsageCategory = Tasks;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General', Comment = 'de-DE=Allgemein';
                field("Date"; Rec.Date) { }
                field(Description; Rec.Description) { }
            }
            group(Statistics)
            {
                Caption = 'Statistics', Comment = 'de-DE=Statistik';
                field(TotalWorkLoad; Rec.TotalWorkLoad)
                {
                    Caption = 'Total Work Load', Comment = 'de-DE=Gesamte Arbeitsleistung';
                    ToolTip = 'Specifies Total work load of all exercises (Repetitions x Weight).', Comment = 'de-DE=Gesamte Arbeitsleistung aller Übungen (Wiederholungen x Gewicht).';

                    trigger OnDrillDown()
                    var
                        SessionLine: Record DYGSessionLineTT;
                    begin
                        SessionLine.SetRange(SessionDate, Rec.Date);
                        Page.Run(Page::DYGSessionLinesTT, SessionLine);
                    end;
                }
            }
            part(Lines; DYGSessionLinesTT)
            {
                Caption = 'Exercises', Comment = 'de-DE=Übungen';
                SubPageLink = SessionDate = field(Date);
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(Exercises)
            {
                Caption = 'Exercise Catalog', Comment = 'de-DE=Übungskatalog';
                Image = Item;
                RunObject = page DYGExerciseListTT;
                ToolTip = 'Öffnet den Übungskatalog.', Comment = 'de-DE=Öffnet den Übungskatalog.';
            }
            action(TrainingPlans)
            {
                Caption = 'Training Plans', Comment = 'de-DE=Trainingspläne';
                Image = Template;
                RunObject = page DYGPlanListTT;
                ToolTip = 'Opens the list of training plans.', Comment = 'de-DE=Öffnet die Liste der Trainingspläne.';
            }
        }
        area(Processing)
        {
            action(CopyFromPlan)
            {
                ApplicationArea = All;
                Caption = 'Copy from Training Plan', Comment = 'de-DE=Aus Trainingsplan kopieren';
                Image = Copy;
                ToolTip = 'Copies the exercises from a training plan into this session.', Comment = 'de-DE=Kopiert die Übungen eines Trainingsplans in diese Trainingseinheit.';

                trigger OnAction()
                var
                    DYGCreateSessionFromPlanTT: Codeunit DYGCreateSessionFromPlanTT;
                begin
                    // if Rec.Date = 0D then
                    //     Error('Please specify the session date first.');

                    // if Page.RunModal(Page::DYGPlanListTT, TrainingPlan) <> Action::LookupOK then
                    //     exit;

                    // PlanLine.SetRange(PlanCode, TrainingPlan.Code);
                    // if not PlanLine.FindSet() then
                    //     exit;

                    // SessionLine.SetRange(SessionDate, Rec.Date);
                    // if SessionLine.FindLast() then
                    //     LastLineNo := SessionLine.LineNo
                    // else
                    //     LastLineNo := 0;

                    // repeat
                    //     if PlanLine.Sets <= 0 then
                    //         PlanLine.Sets := 1;
                    //     for SetNo := 1 to PlanLine.Sets do begin
                    //         LastLineNo += 10000;
                    //         SessionLine.Init();
                    //         SessionLine.SessionDate := Rec.Date;
                    //         SessionLine.LineNo := LastLineNo;
                    //         SessionLine.ExerciseCode := PlanLine.ExerciseCode;
                    //         SessionLine.ExerciseName := PlanLine.ExerciseName;
                    //         SessionLine.Repetitions := PlanLine.Repetitions;
                    //         SessionLine.Weight := PlanLine.Weight;
                    //         SessionLine.Insert(true);
                    //     end;
                    // until PlanLine.Next() = 0;
                    DYGCreateSessionFromPlanTT.CreateSessionFromPlan(Rec, false);

                    CurrPage.Update(false);
                end;
            }
        }
        area(Promoted)
        {
            actionref(Exercises_Promoted; Exercises) { }
            actionref(CopyFromPlan_Promoted; CopyFromPlan) { }
        }
    }
}
