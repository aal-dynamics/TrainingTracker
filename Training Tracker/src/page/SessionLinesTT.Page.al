page 70004 ALFSessionLinesTT
{
    ApplicationArea = All;
    AutoSplitKey = true;
    Caption = 'Exercises', Comment = 'de-DE=Übungen';
    PageType = ListPart;
    SourceTable = ALFSessionLineTT;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field(ExerciseCode; Rec.ExerciseCode) { Visible = false; }
                field(ExerciseName; Rec.ExerciseName) { Editable = false; }
                field(Weight; Rec.Weight) { }
                field(Repetitions; Rec.Repetitions) { }
                field(WorkLoad; Rec.WorkLoad)
                {
                    Editable = false;
                    Visible = false;
                }
                field(Notes; Rec.Notes) { Visible = false; }
            }
        }
    }
}
