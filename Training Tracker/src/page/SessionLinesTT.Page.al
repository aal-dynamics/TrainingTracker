page 70004 DYGSessionLinesTT
{
    ApplicationArea = All;
    AutoSplitKey = true;
    Caption = 'Exercises', Comment = 'de-DE=Übungen';
    PageType = ListPart;
    SourceTable = DYGSessionLineTT;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Exercise Code"; Rec.ExerciseCode) { }
                field("Exercise Name"; Rec.ExerciseName) { Editable = false; }
                field(Repetitions; Rec.Repetitions) { }
                field(Weight; Rec.Weight) { }
                field(WorkLoad; Rec.WorkLoad) { Editable = false; }
                field(Notes; Rec.Notes) { }
            }
        }
    }
}
