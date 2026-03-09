page 70000 DYGExerciseListTT
{
    ApplicationArea = All;
    Caption = 'Exercises', Comment = 'de-DE=Übungen';
    CardPageId = DYGExerciseCardTT;
    PageType = List;
    SourceTable = DYGExerciseTT;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Exercises)
            {
                field("Code"; Rec.Code) { }
                field(Name; Rec.Name) { }
                field(Category; Rec.Category) { }
                field(Description; Rec.Description) { }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(TrainingSessions)
            {
                ApplicationArea = All;
                Caption = 'Training Sessions', Comment = 'de-DE=Trainingseinheiten';
                Image = WorkCenter;
                RunObject = page DYGSessionListTT;
                ToolTip = 'Öffnet die Liste aller Trainingseinheiten.';
            }
        }
        area(Promoted)
        {
            actionref(TrainingSessions_Promoted; TrainingSessions) { }
        }
    }
}
