page 70005 ALFPlanListTT
{
    ApplicationArea = All;
    Caption = 'Training Plans', Comment = 'de-DE=Trainingspläne';
    CardPageId = ALFPlanCardTT;
    PageType = List;
    SourceTable = ALFPlanTT;
    UsageCategory = Lists;

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
