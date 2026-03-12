table 70005 ALFTrainingTrackerCueTT
{
    Caption = 'Training Tracker Cue', Comment = 'de-DE=Training Tracker Kachel';
    DataClassification = SystemMetadata;

    fields
    {
        field(1; PrimaryKey; Integer)
        {
            AllowInCustomizations = Never;
            Caption = 'Primary Key';
        }
        field(2; NoOfExercises; Integer)
        {
            CalcFormula = count(ALFExerciseTT);
            Caption = 'Exercises', Comment = 'de-DE=Übungen';
            Editable = false;
            FieldClass = FlowField;
            ToolTip = 'Specifies the total number of exercises.', Comment = 'de-DE=Gesamtanzahl der Übungen.';
        }
        field(3; NoOfPlans; Integer)
        {
            CalcFormula = count(ALFPlanTT);
            Caption = 'Training Plans', Comment = 'de-DE=Trainingspläne';
            Editable = false;
            FieldClass = FlowField;
            ToolTip = 'Specifies the total number of training plans.', Comment = 'de-DE=Gesamtanzahl der Trainingspläne.';
        }
    }

    keys
    {
        key(PK; PrimaryKey) { Clustered = true; }
    }

    fieldgroups
    {
        fieldgroup(DropDown; NoOfExercises, NoOfPlans) { }
        fieldgroup(Brick; NoOfExercises, NoOfPlans) { }
    }
}
