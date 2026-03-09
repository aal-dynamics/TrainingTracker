table 70002 DYGSessionLineTT
{
    Caption = 'Trainingseinheit Zeile';
    DataClassification = CustomerContent;

    fields
    {
        field(1; SessionDate; Date)
        {
            Caption = 'Session Entry No.', Comment = 'de-DE=Trainingseinheit Lfd. Nr.';
            TableRelation = DYGSessionTT.Date;
            ToolTip = 'Specifies the entry number of the training session.', Comment = 'de-DE=Lfd. Nr. der Trainingseinheit.';
        }
        field(2; LineNo; Integer)
        {
            Caption = 'Line No.', Comment = 'de-DE=Zeilennr.';
            ToolTip = 'Specifies the line number.', Comment = 'de-DE=Zeilennummer.';
        }
        field(3; ExerciseCode; Code[20])
        {
            Caption = 'Exercise Code', Comment = 'de-DE=Übungscode';
            TableRelation = DYGExerciseTT.Code;
            ToolTip = 'Specifies the code of the exercise.', Comment = 'de-DE=Code der Übung.';

            trigger OnValidate()
            var
                Exercise: Record DYGExerciseTT;
            begin
                if Rec.ExerciseCode <> '' then begin
                    Exercise.Get(Rec.ExerciseCode);
                    Rec.ExerciseName := Exercise.Name;
                end else
                    Rec.ExerciseName := '';
            end;
        }
        field(4; ExerciseName; Text[100])
        {
            Caption = 'Exercise Name', Comment = 'de-DE=Übungsname';
            ToolTip = 'Specifies the name of the exercise (filled automatically).', Comment = 'de-DE=Name der Übung (automatisch befüllt).';
        }
        field(6; Repetitions; Integer)
        {
            Caption = 'Repetitions', Comment = 'de-DE=Wiederholungen';
            MinValue = 0;
            ToolTip = 'Specifies the number of repetitions per set.', Comment = 'de-DE=Anzahl der Wiederholungen pro Satz.';

            trigger OnValidate()
            begin
                Rec.WorkLoad := Rec.Repetitions * Rec.Weight;
            end;
        }
        field(7; Weight; Decimal)
        {
            Caption = 'Weight (kg)', Comment = 'de-DE=Gewicht (kg)';
            DecimalPlaces = 0 : 2;
            MinValue = 0;
            ToolTip = 'Specifies the weight used in kilograms.', Comment = 'de-DE=Verwendetes Gewicht in Kilogramm.';

            trigger OnValidate()
            begin
                Rec.WorkLoad := Rec.Repetitions * Rec.Weight;
            end;
        }
        field(8; Notes; Text[250])
        {
            Caption = 'Notes', Comment = 'de-DE=Notizen';
            ToolTip = 'Specifies optional notes for this exercise.', Comment = 'de-DE=Optionale Notizen zu dieser Übung.';
        }
        field(9; WorkLoad; Decimal)
        {
            Caption = 'Work Load', Comment = 'de-DE=Arbeitsleistung';
            DecimalPlaces = 0 : 2;
            Editable = false;
            MinValue = 0;
            ToolTip = 'Specifies the work load (Repetitions x Weight).', Comment = 'de-DE=Arbeitsleistung (Wiederholungen x Gewicht).';
        }
    }

    keys
    {
        key(PK; SessionDate, LineNo) { Clustered = true; }
        key(SessionDate; SessionDate) { SumIndexFields = WorkLoad; }
    }

    fieldgroups
    {
        fieldgroup(DropDown; SessionDate, ExerciseCode, ExerciseName) { }
        fieldgroup(Brick; SessionDate, ExerciseCode, ExerciseName) { }
    }

    trigger OnModify()
    begin
        UpdateWorkLoad();
    end;

    local procedure UpdateWorkLoad()
    begin
        Rec.WorkLoad := Rec.Repetitions * Rec.Weight;
    end;
}
