page 70012 ALFTrainingTrackerCuesTT
{
    ApplicationArea = All;
    Caption = 'Training Tracker Activities', Comment = 'de-DE=Training Tracker Aktivitäten';
    Extensible = true;
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = ALFTrainingTrackerCueTT;

    layout
    {
        area(Content)
        {
            cuegroup(Training)
            {
                Caption = 'Training', Comment = 'de-DE=Training';

                field(NoOfExercises; Rec.NoOfExercises)
                {
                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::ALFExerciseListTT);
                    end;
                }
                field(NoOfPlans; Rec.NoOfPlans)
                {
                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::ALFPlanListTT);
                    end;
                }
            }
            cuegroup(QuickActions)
            {
                Caption = 'Quick Actions', Comment = 'de-DE=Schnellaktionen';

                actions
                {
                    action(NewSession)
                    {
                        Caption = 'New Training Session', Comment = 'de-DE=Neue Trainingseinheit';
                        Image = TileNew;
                        RunObject = page ALFSessionCardTT;
                        RunPageMode = Create;
                        ToolTip = 'Create a new training session.', Comment = 'de-DE=Neue Trainingseinheit erstellen.';
                    }
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get(0) then begin
            Rec.Init();
            Rec.Insert(false);
        end;
        Rec.CalcFields(NoOfExercises, NoOfPlans);
    end;
}
