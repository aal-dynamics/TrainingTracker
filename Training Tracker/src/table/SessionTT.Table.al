table 70001 ALFSessionTT
{
    AllowInCustomizations = AsReadWrite;
    Caption = 'Training Session', Comment = 'de-DE=Trainingseinheit';
    DataClassification = CustomerContent;
    DrillDownPageId = ALFSessionListTT;
    Extensible = true;
    LookupPageId = ALFSessionListTT;

    fields
    {
        field(2; "Date"; Date)
        {
            Caption = 'Date', Comment = 'de-DE=Datum';
            NotBlank = true;
            ToolTip = 'Specifies the date of the training session.', Comment = 'de-DE=Datum der Trainingseinheit.';
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description', Comment = 'de-DE=Beschreibung';
            ToolTip = 'Specifies an optional description (e.g. leg day, push day).', Comment = 'de-DE=Optionale Beschreibung (z. B. Bein-Tag, Push-Tag).';
        }
        field(10; TotalWorkLoad; Decimal)
        {
            CalcFormula = sum(ALFSessionLineTT.WorkLoad where(SessionDate = field(Date)));
            Caption = 'Total Work Load', Comment = 'de-DE=Gesamte Arbeitsleistung';
            DecimalPlaces = 0 : 2;
            Editable = false;
            FieldClass = FlowField;
            ToolTip = 'Specifies the total work load of all exercises in this session.', Comment = 'de-DE=Gesamte Arbeitsleistung aller Übungen in dieser Trainingseinheit.';
        }
    }

    keys
    {
        key(PK; Date) { Clustered = true; }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Date, Description, TotalWorkLoad) { }
        fieldgroup(Brick; Date, Description, TotalWorkLoad) { }
    }

    trigger OnInsert()
    begin
        if Rec.Date = 0D then
            Rec.Date := Today();
    end;
}
