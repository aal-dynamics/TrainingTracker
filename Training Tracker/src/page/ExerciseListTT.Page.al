page 70000 ALFExerciseListTT
{
    ApplicationArea = All;
    Caption = 'Exercises', Comment = 'de-DE=Übungen';
    CardPageId = ALFExerciseCardTT;
    PageType = List;
    SourceTable = ALFExerciseTT;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Exercises)
            {
                field("Code"; Rec.Code) { }
                field(Name; Rec.Name) { }
                field(Category; Rec.Category) { Width = 20; }
                field(Description; Rec.Description) { }
                field(EachSide; Rec.EachSide) { }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(TrainingSessions)
            {
                Caption = 'Training Sessions', Comment = 'de-DE=Trainingseinheiten';
                Image = WorkCenter;
                RunObject = page ALFSessionListTT;
                ToolTip = 'Öffnet die Liste aller Trainingseinheiten.';
            }
        }
        area(Promoted)
        {
            actionref(TrainingSessions_Promoted; TrainingSessions) { }
        }
    }
}
