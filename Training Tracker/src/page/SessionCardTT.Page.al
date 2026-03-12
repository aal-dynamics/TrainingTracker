page 70003 ALFSessionCardTT
{
    ApplicationArea = All;
    Caption = 'Training Session', Comment = 'de-DE=Trainingseinheit';
    DelayedInsert = true;
    PageType = Card;
    SourceTable = ALFSessionTT;
    UsageCategory = Tasks;

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
                    trigger OnDrillDown()
                    var
                        SessionLine: Record ALFSessionLineTT;
                    begin
                        SessionLine.SetRange(SessionDate, Rec.Date);
                        Page.Run(Page::ALFSessionLinesTT, SessionLine);
                    end;
                }
            }
            part(Lines; ALFSessionLinesTT)
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
                RunObject = page ALFExerciseListTT;
                ToolTip = 'Öffnet den Übungskatalog.', Comment = 'de-DE=Öffnet den Übungskatalog.';
            }
            action(TrainingPlans)
            {
                Caption = 'Training Plans', Comment = 'de-DE=Trainingspläne';
                Image = Template;
                RunObject = page ALFPlanListTT;
                ToolTip = 'Opens the list of training plans.', Comment = 'de-DE=Öffnet die Liste der Trainingspläne.';
            }
        }
        area(Processing)
        {
            action(CopyFromPlan)
            {
                Caption = 'Copy from Training Plan', Comment = 'de-DE=Aus Trainingsplan kopieren';
                Image = Copy;
                ToolTip = 'Copies the exercises from a training plan into this session.', Comment = 'de-DE=Kopiert die Übungen eines Trainingsplans in diese Trainingseinheit.';

                trigger OnAction()
                var
                    ALFCreateSessionFromPlanTT: Codeunit ALFCreateSessionFromPlanTT;
                begin
                    ALFCreateSessionFromPlanTT.CreateSessionFromPlan(Rec, false);

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
