page 70002 ALFSessionListTT
{
    ApplicationArea = All;
    Caption = 'Training Sessions', Comment = 'de-DE=Trainingseinheiten';
    CardPageId = ALFSessionCardTT;
    PageType = List;
    SourceTable = ALFSessionTT;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Sessions)
            {
                field("Date"; Rec.Date) { }
                field(Description; Rec.Description) { }
                field(TotalWorkLoad; Rec.TotalWorkLoad)
                {
                    trigger OnDrillDown()
                    var
                        SessionLine: Record ALFSessionLineTT;
                    begin
                        SessionLine.SetRange(SessionDate, Rec.Date);
                        Page.Run(Page::ALFSessionLinesTT, SessionLine);
                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(NewSession)
            {
                Caption = 'New Training Session', Comment = 'de-DE=Neue Trainingseinheit';
                Image = New;
                ToolTip = 'Creates a new training session for today.', Comment = 'de-DE=Erstellt eine neue Trainingseinheit für heute.';

                trigger OnAction()
                var
                    Session: Record ALFSessionTT;
                    ALFDateInputDialogTT: Page ALFDateInputDialogTT;
                    SessionCard: Page ALFSessionCardTT;
                begin
                    if ALFDateInputDialogTT.RunModal() <> Action::LookupOK then
                        exit;

                    Session.Init();
                    Session.Date := ALFDateInputDialogTT.GetDate();
                    Session.Insert(true);

                    SessionCard.SetRecord(Session);
                    SessionCard.Run();
                end;
            }
        }
        area(Navigation)
        {
            action(Exercises)
            {
                Caption = 'Exercise Catalog', Comment = 'de-DE=Übungskatalog';
                Image = Item;
                RunObject = page ALFExerciseListTT;
                ToolTip = 'Opens the exercise catalog for managing exercises.', Comment = 'de-DE=Öffnet den Übungskatalog zum Verwalten der Übungen.';
            }
        }
        area(Promoted)
        {
            actionref(NewSession_Promoted; NewSession) { }
            actionref(Exercises_Promoted; Exercises) { }
        }
    }
}
