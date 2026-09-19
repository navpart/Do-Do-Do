report 50129 "Leave Certificate-Rev2"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/LeaveCertificateRev2.rdl';

    dataset
    {
        dataitem(LeaveData; "Leave Plan Lines Rev 2")
        {
            CalcFields = "Total Leaves Due", "Total Compassionate", "Total Exam", "Total Others", "Total Consuming", "Total Annual", "Amount Paid";
            DataItemTableView = SORTING("Employee No.", "Leave Period", "Entry Type")
                                WHERE("Entry Type" = CONST(ACTUAL),
                                      Registered = CONST(true));
            RequestFilterFields = "Serial No", "Employee No.", "Leave Period", "Entry Type", "Leave Category";
            column(EmpName; EmpName)
            {
            }
            column(Designation; Designation)
            {
            }
            column(BCName; BCName)
            {
            }
            column(CSal; CSal)
            {
            }
            column(Leave_Plan_Lines_Rev_2__Employee_No__; "Employee No.")
            {
            }
            column(Date_Due_For_____LeaveDueto______Leave_; 'Date Due For ' + LeaveDueto + '  Leave')
            {
            }
            column(Leave_Plan_Lines_Rev_2__Leave_Period_; "Leave Period")
            {
            }
            column(LeaveOutStanding; LeaveOutStanding)
            {
            }
            column(LeaveDeductable; LeaveDeductable)
            {
            }
            column(LeaveDueto; LeaveDueto)
            {
            }
            column(DaysToCash; DaysToCash)
            {
            }
            column(RemainingAmount_LeavePlanLinesRev2; "Remaining Amount")
            {
            }
            column(Amount_Due___Amount_Paid_; "Amount Due" - "Amount Paid")
            {
            }
            column(LeaveBalance; LeaveBalance)
            {
            }
            column(ResumeDate; ResumeDate)
            {
            }
            column(ActualStartDate; "Actual Start Date")
            {
            }
            column(V1__; '1.')
            {
            }
            column(V2__; '2.')
            {
            }
            column(V3__; '3.')
            {
            }
            column(V4__; '4.')
            {
            }
            column(V5__; '5.')
            {
            }
            column(V6__; '6.')
            {
            }
            column(V7__; '7.')
            {
            }
            column(V8__; '8.')
            {
            }
            column(V9__; '9.')
            {
            }
            column(V10__; '10.')
            {
            }
            column(V13__; '13.')
            {
            }
            column(V12__; '12.')
            {
            }
            column(V11__; '11.')
            {
            }
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(SerialNo; "Serial No")
            {
            }
            column(DesignationCaption; DesignationCaptionLbl)
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(DepartmentCaption; DepartmentCaptionLbl)
            {
            }
            column(Present_SalaryCaption; Present_SalaryCaptionLbl)
            {
            }
            column(Staff_NumberCaption; Staff_NumberCaptionLbl)
            {
            }
            column(Outstanding_Leave_day__if_any_Caption; Outstanding_Leave_day__if_any_CaptionLbl)
            {
            }
            column(Number_of_days_deductable_from_LeaveCaption; Number_of_days_deductable_from_LeaveCaptionLbl)
            {
            }
            column(Due_toCaption; Due_toCaptionLbl)
            {
            }
            column(Number_of_days_commuted_to_cashCaption; Number_of_days_commuted_to_cashCaptionLbl)
            {
            }
            column(Balance_of_leave_to_be_enjoyedCaption; Balance_of_leave_to_be_enjoyedCaptionLbl)
            {
            }
            column(Date_Leave_StartCaption; Date_Leave_StartCaptionLbl)
            {
            }
            column(Date_to_report_back_to_workCaption; Date_to_report_back_to_workCaptionLbl)
            {
            }
            column(Amount_taken_as_leave_allowanceCaption; Amount_taken_as_leave_allowanceCaptionLbl)
            {
            }
            column(PleaseNote; PleaseNote)
            {
            }
            column(FinanceNote; FinanceNote)
            {
            }
            column(Yours_faithfully_Caption; Yours_faithfully_CaptionLbl)
            {
            }
            column(TOYOTA_NIGERIA_LIMITEDCaption; TOYOTA_NIGERIA_LIMITEDCaptionLbl)
            {
            }
            column(HEAD__ADMIN_HUMAN_RESOURCESCaption; HEAD__ADMIN_HUMAN_RESOURCESCaptionLbl)
            {
            }
            column(for_Caption; for_CaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Our_Ref__HRM_6Caption; Our_Ref__HRM_6CaptionLbl)
            {
            }
            column(LEAVE_CERTIFICATECaption; LEAVE_CERTIFICATECaptionLbl)
            {
            }
            column(Leave_NoCaption; Leave_NoCaptionLbl)
            {
            }
            column(EntryType; "Entry Type")
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF EmpRec.GET(LeaveData."Employee No.") THEN BEGIN
                    EmpName := EmpRec.FullName;
                    EmpGrp := EmpRec."Employee Group";
                    Designation := EmpRec.Designation;

                    IF Regrec.GET(LeaveData."Business Unit") THEN RegName := Regrec.Name;
                    IF EmpGrpRec.GET(EmpGrp) THEN BEGIN
                        EmpGrpRec.CALCFIELDS(EmpGrpRec."Net Pay Due");
                        // CSal := EmpGrpRec."Net Pay Due";
                    END;
                    ResumeDate := LeaveData."Actual End Date";
                    REPEAT
                        ResumeDate := ResumeDate + 1;
                    UNTIL (NOT (GenPCode.IsHoliday(ResumeDate)));

                    IF LCatrec.GET(LeaveData."Leave Category") THEN LeaveDueto := LCatrec.Description;
                    LeaveDeductable := "Actual Duration";

                    CALCFIELDS("Total Leaves Due");
                    LeaveOutStanding := "Total Leaves Due" - "Total Consuming" + "Actual Duration";
                    LeaveBalance := "Total Leaves Due" - "Total Consuming";

                END;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        EmpRec: Record 5200;
        Regrec: Record 220;
        RegName: Text[30];
        BCName: Text[30];
        CCName: Text[30];
        EmpName: Text[60];
        CSal: Decimal;
        EmpGrpRec: Record 50009;
        PayRec: Record 50070;
        EmpGrp: Code[10];
        ResumeDate: Date;
        WeekEndCheck: Integer;
        GenPCode: Codeunit 50004;
        Designation: Text[30];
        LeaveOutStanding: Integer;
        LeaveDueto: Text[100];
        LeaveDeductable: Integer;
        LeaveBalance: Integer;
        LeaveAllowance: Decimal;
        LCatrec: Record 50074;
        DaysToCash: Integer;
        DesignationCaptionLbl: Label 'Designation';
        NameCaptionLbl: Label 'Name';
        DepartmentCaptionLbl: Label 'Department';
        Present_SalaryCaptionLbl: Label 'Present Salary';
        Staff_NumberCaptionLbl: Label 'Staff Number';
        Outstanding_Leave_day__if_any_CaptionLbl: Label 'Outstanding Leave day (if any)';
        Number_of_days_deductable_from_LeaveCaptionLbl: Label 'Number of days deductable from Leave';
        Due_toCaptionLbl: Label 'Due to';
        Number_of_days_commuted_to_cashCaptionLbl: Label 'Number of days commuted to cash';
        Balance_of_leave_to_be_enjoyedCaptionLbl: Label 'Balance of leave to be enjoyed';
        Date_Leave_StartCaptionLbl: Label 'Date Leave Start';
        Date_to_report_back_to_workCaptionLbl: Label 'Date to report back to work';
        Amount_taken_as_leave_allowanceCaptionLbl: Label 'Amount taken as leave allowance';
        PleaseNote: Label 'Please note that failure to return to duty on the above date without accepted excuse will be treated as unauthorised absence.';
        FinanceNote: Label 'The Finance & Accounts Department to pay the sum stated on item 13 above on the next salary pay day.';
        Yours_faithfully_CaptionLbl: Label 'Yours faithfully;';
        TOYOTA_NIGERIA_LIMITEDCaptionLbl: Label 'TOYOTA NIGERIA LIMITED';
        HEAD__ADMIN_HUMAN_RESOURCESCaptionLbl: Label 'HEAD, ADMIN/HUMAN RESOURCES';
        for_CaptionLbl: Label 'for:';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Our_Ref__HRM_6CaptionLbl: Label 'Our Ref: HRM/6';
        LEAVE_CERTIFICATECaptionLbl: Label 'LEAVE CERTIFICATE';
        Leave_NoCaptionLbl: Label 'Leave No';
}

