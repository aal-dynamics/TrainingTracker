permissionset 70000 DYGAdminTT
{
    Assignable = true;
    Caption = 'DYG Training Tracker Admin', Comment = 'de-DE=DYG Training Tracker Admin', Locked = true;
    Permissions = table DYGExerciseTT = X,
        tabledata DYGExerciseTT = RIMD,
        table DYGPlanLineTT = X,
        tabledata DYGPlanLineTT = RIMD,
        table DYGPlanTT = X,
        tabledata DYGPlanTT = RIMD,
        table DYGSessionLineTT = X,
        tabledata DYGSessionLineTT = RIMD,
        table DYGSessionTT = X,
        tabledata DYGSessionTT = RIMD,
        codeunit DYGCreateSessionFromPlanTT = X,
        page DYGExerciseCardTT = X,
        page DYGExerciseListTT = X,
        page DYGPlanCardTT = X,
        page DYGPlanLinesTT = X,
        page DYGPlanListTT = X,
        page DYGSessionCardTT = X,
        page DYGSessionLinesTT = X,
        page DYGSessionListTT = X;
}