page 70011 ALFDateInputDialogTT
{
    ApplicationArea = All;
    Caption = 'Select Date', Comment = 'de-DE=Datum auswählen';
    PageType = StandardDialog;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General', Comment = 'de-DE=Allgemein';

                field(SessionDate; SessionDate)
                {
                    Caption = 'Date', Comment = 'de-DE=Datum';
                    ToolTip = 'Specifies the date.', Comment = 'de-DE=Gibt das Datum an.';
                }
            }
        }
    }

    var
        SessionDate: Date;

    trigger OnOpenPage()
    begin
        if SessionDate = 0D then
            SessionDate := WorkDate();
    end;

    procedure SetDate(NewDate: Date)
    begin
        SessionDate := NewDate;
    end;

    procedure GetDate(): Date
    begin
        exit(SessionDate);
    end;
}
