table 70000 DYGExerciseTT
{
    Caption = 'Exercise', Comment = 'de-DE=Übung';
    DataClassification = CustomerContent;
    DrillDownPageId = DYGExerciseListTT;
    LookupPageId = DYGExerciseListTT;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code', Comment = 'de-DE=Code';
            NotBlank = true;
            ToolTip = 'Specifies the unique code of the exercise.', Comment = 'de-DE=Eindeutiger Code der Übung.';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name', Comment = 'de-DE=Name';
            NotBlank = true;
            ToolTip = 'Specifies the name of the exercise.', Comment = 'de-DE=Name der Übung.';
        }
        field(3; Category; Enum DYGExerciseCategoryTT)
        {
            Caption = 'Category', Comment = 'de-DE=Kategorie';
            ToolTip = 'Specifies the muscle group or category.', Comment = 'de-DE=Muskelgruppe / Kategorie.';
        }
        field(4; Description; Text[250])
        {
            Caption = 'Description', Comment = 'de-DE=Beschreibung';
            ToolTip = 'Specifies an optional description of the exercise.', Comment = 'de-DE=Optionale Beschreibung der Übung.';
        }
        field(5; EachSide; Boolean)
        {
            Caption = 'Each Side', Comment = 'de-DE=Jede Seite';
            ToolTip = 'Indicates if the exercise should be performed on each side.', Comment = 'de-DE=Gibt an, ob die Übung für jede Seite ausgeführt werden soll.';
        }
    }

    keys
    {
        key(PK; Code) { Clustered = true; }
        key(Name; Name) { }
        key(Category; Category) { }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Code, Category, Name) { }
        fieldgroup(Brick; Code, Category, Name) { }
    }
}
