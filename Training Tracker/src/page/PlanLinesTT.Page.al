page 70006 DYGPlanLinesTT
{
    ApplicationArea = All;
    AutoSplitKey = true;
    Caption = 'Training Plan Lines', Comment = 'de-DE=Trainingsplan Zeilen';
    PageType = ListPart;
    SourceTable = DYGPlanLineTT;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Exercise Code"; Rec.ExerciseCode) { }
                field("Exercise Name"; Rec.ExerciseName) { Editable = false; }
                field(Sets; Rec.Sets) { }
                field(Repetitions; Rec.Repetitions) { }
                field(Weight; Rec.Weight) { }
            }
        }
    }
}
