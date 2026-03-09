page 70002 DYGSessionListTT
{
    ApplicationArea = All;
    Caption = 'Training Sessions', Comment = 'de-DE=Trainingseinheiten';
    CardPageId = DYGSessionCardTT;
    PageType = List;
    SourceTable = DYGSessionTT;
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
                    Caption = 'Total Work Load', Comment = 'de-DE=Gesamte Arbeitsleistung';
                    ToolTip = 'Total work load of all exercises in this session.', Comment = 'de-DE=Gesamte Arbeitsleistung aller Übungen in dieser Trainingseinheit.';

                    trigger OnDrillDown()
                    var
                        SessionLine: Record DYGSessionLineTT;
                    begin
                        SessionLine.SetRange(SessionDate, Rec.Date);
                        Page.Run(Page::DYGSessionLinesTT, SessionLine);
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
                ApplicationArea = All;
                Caption = 'New Training Session', Comment = 'de-DE=Neue Trainingseinheit';
                Image = New;
                ToolTip = 'Creates a new training session for today.', Comment = 'de-DE=Erstellt eine neue Trainingseinheit für heute.';

                trigger OnAction()
                var
                    Session: Record DYGSessionTT;
                    SessionCard: Page DYGSessionCardTT;
                begin
                    Session.Init();
                    Session.Date := Today();
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
                ApplicationArea = All;
                Caption = 'Exercise Catalog', Comment = 'de-DE=Übungskatalog';
                Image = Item;
                RunObject = page DYGExerciseListTT;
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
