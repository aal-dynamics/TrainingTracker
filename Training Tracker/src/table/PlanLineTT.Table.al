table 70004 ALFPlanLineTT
{
    AllowInCustomizations = AsReadWrite;
    Caption = 'Training Plan Line', Comment = 'de-DE=Trainingsplan Zeile';
    DataClassification = CustomerContent;
    Extensible = true;
    Permissions =
        tabledata ALFExerciseTT = R,
        tabledata ALFPlanLineTT = RMD;

    fields
    {
        field(1; PlanCode; Code[20])
        {
            Caption = 'Plan Code', Comment = 'de-DE=Plancode';
            NotBlank = true;
            TableRelation = ALFPlanTT.Code;
            ToolTip = 'Specifies the code of the training plan.', Comment = 'de-DE=Code des Trainingsplans.';
            AllowInCustomizations = Never;
        }
        field(2; LineNo; Integer)
        {
            Caption = 'Line No.', Comment = 'de-DE=Zeilennr.';
            NotBlank = true;
            ToolTip = 'Specifies the line number.', Comment = 'de-DE=Zeilennummer.';
            AllowInCustomizations = Never;
        }
        field(3; ExerciseCode; Code[20])
        {
            Caption = 'Exercise Code', Comment = 'de-DE=Übungscode';
            TableRelation = ALFExerciseTT.Code;
            ToolTip = 'Specifies the code of the exercise.', Comment = 'de-DE=Code der Übung.';

            trigger OnValidate()
            var
                Exercise: Record ALFExerciseTT;
            begin
                Rec.ExerciseName := '';
                if Exercise.Get(Rec.ExerciseCode) then
                    Rec.ExerciseName := Exercise.Name;
            end;
        }
        field(4; ExerciseName; Text[100])
        {
            Caption = 'Exercise Name', Comment = 'de-DE=Übungsname';
            ToolTip = 'Specifies the name of the exercise (filled automatically).', Comment = 'de-DE=Name der Übung (automatisch befüllt).';
        }
        field(5; Rounds; Integer)
        {
            Caption = 'Rounds', Comment = 'de-DE=Runden';
            MinValue = 0;
            ToolTip = 'Specifies the number of rounds.', Comment = 'de-DE=Anzahl der Runden.';

            trigger OnValidate()
            begin
                this.SetRoundsForGroup(Rec.ExerciseGroup, Rec.Rounds);
                this.CopyRoundsFromGroup(Rec.ExerciseGroup, Rec.Rounds);
            end;
        }
        field(6; Repetitions; Integer)
        {
            Caption = 'Repetitions', Comment = 'de-DE=Wiederholungen';
            MinValue = 0;
            ToolTip = 'Specifies the number of repetitions per round.', Comment = 'de-DE=Anzahl der Wiederholungen pro Runde.';
        }
        field(7; Weight; Decimal)
        {
            Caption = 'Weight (kg)', Comment = 'de-DE=Gewicht (kg)';
            DecimalPlaces = 0 : 2;
            MinValue = 0;
            ToolTip = 'Specifies the weight used in kilograms.', Comment = 'de-DE=Verwendetes Gewicht in Kilogramm.';
        }
        field(8; ExerciseGroup; Code[10])
        {
            Caption = 'Exercise Group', Comment = 'de-DE=Übungsgruppe';
            ToolTip = 'Specifies an optional group for the exercise.', Comment = 'de-DE=Optionale Gruppierung der Übung.';

            trigger OnValidate()
            begin
                this.SetRoundsForGroup(Rec.ExerciseGroup, Rec.Rounds);
                this.CopyRoundsFromGroup(Rec.ExerciseGroup, Rec.Rounds);
            end;
        }
    }

    keys
    {
        key(PK; PlanCode, LineNo) { Clustered = true; }
        key(ALFKey2; ExerciseGroup) { }
    }

    fieldgroups
    {
        fieldgroup(DropDown; PlanCode, ExerciseCode, Rounds, Repetitions, Weight) { }
        fieldgroup(Brick; PlanCode, ExerciseCode, Rounds, Repetitions, Weight) { }
    }

    local procedure SetRoundsForGroup(Group: Code[10]; NoRounds: Integer)
    var
        ALFPlanLineTT: Record ALFPlanLineTT;
    begin
        if (Group = '') or (NoRounds = 0) then
            exit;

        ALFPlanLineTT.SetRange(PlanCode, Rec.PlanCode);
        ALFPlanLineTT.SetRange(ExerciseGroup, Group);
        ALFPlanLineTT.SetFilter(LineNo, '<>%1', Rec.LineNo);
        if ALFPlanLineTT.FindSet(true) then
            repeat
                if ALFPlanLineTT.Rounds <> NoRounds then begin
                    ALFPlanLineTT.Rounds := NoRounds;
                    ALFPlanLineTT.Modify(true);
                end;
            until ALFPlanLineTT.Next() = 0;
    end;

    local procedure CopyRoundsFromGroup(Group: Code[10]; NoRounds: Integer)
    var
        ALFPlanLineTT: Record ALFPlanLineTT;
    begin
        if Group = '' then
            exit;
        if NoRounds <> 0 then
            exit;

        ALFPlanLineTT.SetRange(PlanCode, Rec.PlanCode);
        ALFPlanLineTT.SetRange(ExerciseGroup, Group);
        ALFPlanLineTT.SetFilter(LineNo, '<>%1', Rec.LineNo);
        if ALFPlanLineTT.FindFirst() then
            Rec.Rounds := ALFPlanLineTT.Rounds;
    end;
}