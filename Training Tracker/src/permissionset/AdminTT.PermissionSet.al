permissionset 70000 ALFAdminTT
{
    Assignable = true;
    Caption = 'ALF Training Tracker Admin', Comment = 'de-DE=ALF Training Tracker Admin', Locked = true;
    Permissions = table ALFExerciseTT = X,
        tabledata ALFExerciseTT = RIMD,
        table ALFPlanLineTT = X,
        tabledata ALFPlanLineTT = RIMD,
        table ALFPlanTT = X,
        tabledata ALFPlanTT = RIMD,
        table ALFSessionLineTT = X,
        tabledata ALFSessionLineTT = RIMD,
        table ALFSessionTT = X,
        tabledata ALFSessionTT = RIMD,
        table ALFTrainingTrackerCueTT = X,
        tabledata ALFTrainingTrackerCueTT = RIMD,
        codeunit ALFCreateSessionFromPlanTT = X,
        page ALFDateInputDialogTT = X,
        page ALFExerciseCardTT = X,
        page ALFExerciseListTT = X,
        page ALFPlanCardTT = X,
        page ALFPlanLinesTT = X,
        page ALFPlanListTT = X,
        page ALFSessionCardTT = X,
        page ALFSessionLinesTT = X,
        page ALFSessionListTT = X,
        page ALFTrainingTrackerCuesTT = X,
        page ALFTrainingTrackerRCTT = X;
}