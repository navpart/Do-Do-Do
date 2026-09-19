page 50058 "Leave Analysis Type  Matrix"
{
    Editable = false;
    PageType = Card;
    //SourceTable = Table2000000007;

    layout
    {
    }

    actions
    {
    }

    var
        EmployeeAbsence: Record 5207;
        //PeriodFormManagement: Codeunit 359;
        PeriodType: Option Day,Week,Month,Quarter,Year,"Accounting Period";
        AbsenceAmountType: Option "Balance at Date","Net Change";
        DeptFilter: Text[250];
        ProjFilter: Text[250];
        EmployeeNoFilter: Text[250];
        LeaveRosterSumm: Record 50078;
        LRoster: Record 50077;


    procedure MatrixUpdate(NewAbsenceType: Option "Absence to Date","Absence at Date"; NewPeriodType: Option Day,Week,Month,Quarter,Year,"Accounting Period"; NewDeptFilter: Text[250]; NewProjFilter: Text[250]; NewEmployeeNoFilter: Text[250])
    begin
    end;
}

