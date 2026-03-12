page 70001 ALFExerciseCardTT
{
    ApplicationArea = All;
    Caption = 'Exercise', Comment = 'de-DE=Übung';
    PageType = Card;
    SourceTable = ALFExerciseTT;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General', Comment = 'de-DE=Allgemein';

                field("Code"; Rec.Code) { }
                field(Name; Rec.Name) { }
                field(Category; Rec.Category) { }
                field(Description; Rec.Description) { MultiLine = true; }
                field(EachSide; Rec.EachSide) { }
            }
        }
    }
}
