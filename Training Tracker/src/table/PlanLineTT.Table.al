table 70004 DYGPlanLineTT
{
    Caption = 'Training Plan Line', Comment = 'de-DE=Trainingsplan Zeile';
    DataClassification = CustomerContent;

    fields
    {
        field(1; PlanCode; Code[20])
        {
            Caption = 'Plan Code', Comment = 'de-DE=Plancode';
            TableRelation = DYGPlanTT.Code;
            ToolTip = 'Specifies the code of the training plan.', Comment = 'de-DE=Code des Trainingsplans.';
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
        field(5; Sets; Integer)
        {
            Caption = 'Sets', Comment = 'de-DE=Sätze';
            MinValue = 0;
            ToolTip = 'Specifies the number of sets.', Comment = 'de-DE=Anzahl der Sätze.';
        }
        field(6; Repetitions; Integer)
        {
            Caption = 'Repetitions', Comment = 'de-DE=Wiederholungen';
            MinValue = 0;
            ToolTip = 'Specifies the number of repetitions per set.', Comment = 'de-DE=Anzahl der Wiederholungen pro Satz.';
        }
        field(7; Weight; Decimal)
        {
            Caption = 'Weight (kg)', Comment = 'de-DE=Gewicht (kg)';
            DecimalPlaces = 0 : 2;
            MinValue = 0;
            ToolTip = 'Specifies the weight used in kilograms.', Comment = 'de-DE=Verwendetes Gewicht in Kilogramm.';
        }
    }

    keys
    {
        key(PK; PlanCode, LineNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; PlanCode, ExerciseCode, Sets, Repetitions, Weight) { }
        fieldgroup(Brick; PlanCode, ExerciseCode, Sets, Repetitions, Weight) { }
    }
}
