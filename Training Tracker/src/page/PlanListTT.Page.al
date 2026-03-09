page 70005 DYGPlanListTT
{
    ApplicationArea = All;
    Caption = 'Training Plans', Comment = 'de-DE=Trainingspläne';
    CardPageId = DYGPlanCardTT;
    PageType = List;
    SourceTable = DYGPlanTT;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(Plans)
            {
                field("Code"; Rec.Code) { }
                field(Name; Rec.Name) { }
                field(Description; Rec.Description) { }
            }
        }
    }
}
