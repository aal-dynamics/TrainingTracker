page 70006 ALFPlanLinesTT
{
    ApplicationArea = All;
    AutoSplitKey = true;
    Caption = 'Training Plan Lines', Comment = 'de-DE=Trainingsplan Zeilen';
    PageType = ListPart;
    SourceTable = ALFPlanLineTT;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field(ExerciseCode; Rec.ExerciseCode) { }
                field(ExerciseName; Rec.ExerciseName) { Editable = false; }
                field(ExerciseGroup; Rec.ExerciseGroup) { }
                field(Sets; Rec.Rounds) { }
                field(Repetitions; Rec.Repetitions) { }
                field(Weight; Rec.Weight) { }
            }
        }
    }
}
