page 70001 DYGExerciseCardTT
{
    ApplicationArea = All;
    Caption = 'Exercise', Comment = 'de-DE=Übung';
    PageType = Card;
    SourceTable = DYGExerciseTT;
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
            }
        }
    }
}
