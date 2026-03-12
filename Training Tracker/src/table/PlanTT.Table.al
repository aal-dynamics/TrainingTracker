table 70003 ALFPlanTT
{
    AllowInCustomizations = AsReadWrite;
    Caption = 'Training Plan', Comment = 'de-DE=Trainingsplan';
    DataClassification = CustomerContent;
    DrillDownPageId = ALFPlanListTT;
    Extensible = true;
    LookupPageId = ALFPlanListTT;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code', Comment = 'de-DE=Code';
            NotBlank = true;
            ToolTip = 'Specifies the unique code of the training plan.', Comment = 'de-DE=Eindeutiger Code des Trainingsplans.';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name', Comment = 'de-DE=Name';
            NotBlank = true;
            ToolTip = 'Specifies the name of the training plan.', Comment = 'de-DE=Name des Trainingsplans.';
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description', Comment = 'de-DE=Beschreibung';
            ToolTip = 'Specifies an optional description of the training plan.', Comment = 'de-DE=Optionale Beschreibung des Trainingsplans.';
        }
    }

    keys
    {
        key(PK; Code) { Clustered = true; }
        key(Name; Name) { }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Code, Name) { }
        fieldgroup(Brick; Code, Name, Description) { }
    }
}
