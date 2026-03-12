page 70010 ALFTrainingTrackerRCTT
{
    ApplicationArea = All;
    Caption = 'Training Tracker', Comment = 'de-DE=Training Tracker';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(Cues; ALFTrainingTrackerCuesTT) { }
        }
    }

    actions
    {
        area(Sections)
        {
            group(ALFTraining)
            {
                Caption = 'Training', Comment = 'de-DE=Training';

                action(ALFExercises)
                {
                    Caption = 'Exercises', Comment = 'de-DE=Übungen';
                    RunObject = page ALFExerciseListTT;
                    ToolTip = 'View and manage exercises.', Comment = 'de-DE=Übungen anzeigen und verwalten.';
                }
                action(ALFPlans)
                {
                    Caption = 'Plans', Comment = 'de-DE=Pläne';
                    RunObject = page ALFPlanListTT;
                    ToolTip = 'View and manage training plans.', Comment = 'de-DE=Trainingspläne anzeigen und verwalten.';
                }
                action(ALFSessions)
                {
                    Caption = 'Sessions', Comment = 'de-DE=Trainingseinheiten';
                    RunObject = page ALFSessionListTT;
                    ToolTip = 'View and manage training sessions.', Comment = 'de-DE=Trainingseinheiten anzeigen und verwalten.';
                }
            }
        }
        area(Embedding)
        {
            action(ALFExercisesEmbedded)
            {
                Caption = 'Exercises', Comment = 'de-DE=Übungen';
                RunObject = page ALFExerciseListTT;
                ToolTip = 'View and manage exercises.', Comment = 'de-DE=Übungen anzeigen und verwalten.';
            }

            action(ALFPlansEmbedded)
            {
                Caption = 'Plans', Comment = 'de-DE=Pläne';
                RunObject = page ALFPlanListTT;
                ToolTip = 'View and manage training plans.', Comment = 'de-DE=Trainingspläne anzeigen und verwalten.';
            }

            action(ALFSessionsEmbedded)
            {
                Caption = 'Sessions', Comment = 'de-DE=Trainingseinheiten';
                RunObject = page ALFSessionListTT;
                ToolTip = 'View and manage training sessions.', Comment = 'de-DE=Trainingseinheiten anzeigen und verwalten.';
            }
        }
        area(Creation)
        {
            action(ALFNewExercise)
            {
                Caption = 'New Exercise', Comment = 'de-DE=Neue Übung';
                RunObject = page ALFExerciseCardTT;
                RunPageMode = Create;
                ToolTip = 'Create a new exercise.', Comment = 'de-DE=Eine neue Übung erstellen.';
            }

            action(ALFNewPlan)
            {
                Caption = 'New Plan', Comment = 'de-DE=Neuer Plan';
                RunObject = page ALFPlanCardTT;
                RunPageMode = Create;
                ToolTip = 'Create a new training plan.', Comment = 'de-DE=Einen neuen Trainingsplan erstellen.';
            }

            action(ALFNewSession)
            {
                Caption = 'New Session', Comment = 'de-DE=Neue Trainingseinheit';
                RunObject = page ALFSessionCardTT;
                RunPageMode = Create;
                ToolTip = 'Create a new training session.', Comment = 'de-DE=Eine neue Trainingseinheit erstellen.';
            }
        }
    }
}
