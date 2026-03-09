page 70007 DYGPlanCardTT
{
    ApplicationArea = All;
    Caption = 'Training Plan', Comment = 'de-DE=Trainingsplan';
    PageType = Card;
    SourceTable = DYGPlanTT;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General', Comment = 'de-DE=Allgemein';
                field("Code"; Rec.Code) { }
                field(Name; Rec.Name) { }
                field(Description; Rec.Description) { }
            }
            part(Lines; DYGPlanLinesTT)
            {
                Caption = 'Exercises', Comment = 'de-DE=Übungen';
                SubPageLink = PlanCode = field(Code);
            }
        }
    }
}
