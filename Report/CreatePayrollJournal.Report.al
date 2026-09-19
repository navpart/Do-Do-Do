report 50059 "Create Payroll Journal"
{
    ProcessingOnly = true;
    ApplicationArea = All;

    dataset
    {
        dataitem(PayslipLines; "Payroll-Payslip Lines.")
        {
            DataItemTableView = SORTING("Posting Group", "Payroll Period", "Global Dimension 1 Code", "Global Dimension 2 Code", "Debit Acc. Type", "Debit Account", "Credit Acc. Type", "Credit Account", "Loan ID")
                                ORDER(Ascending);
            RequestFilterFields = "Payroll Period", "Employee No", "Posting Group", "Global Dimension 1 Code", "Global Dimension 2 Code";

            trigger OnAfterGetRecord()
            begin

                Payrec.GET("Employee No");    // Adam
                IF Payrec.Blocked THEN
                    CurrReport.SKIP;  // To enable the payroll to skip the blocked employees

                //ERROR(Payrec.Name+'('+Payrec."No."+') was blocked!!!'); //Added by Adam to skip Blocked Employees

                Window.UPDATE(2, "Global Dimension 1 Code");
                Window.UPDATE(3, "Global Dimension 2 Code");
                Window.UPDATE(4, "Employee No");
                Window.UPDATE(5, "E/D Code");
                InfoCounter := InfoCounter + 1;
                Window.UPDATE(6, InfoCounter);

                IF ("Debit Account" <> '') OR ("Credit Account" <> '') THEN BEGIN
                    NumOfRec := NumOfRec + 1;
                    IF (CurrentPeriod <> "Payroll Period") OR
                       (CurrBookDept <> "Global Dimension 1 Code") OR
                       (CurrBookProj <> "Global Dimension 2 Code") OR
                       (CurrDebAccType <> "Debit Acc. Type") OR
                       (CurrDebitAcc <> "Debit Account") OR
                       (CurrCredAccType <> "Credit Acc. Type") OR
                       (CurrCreditAcc <> "Credit Account") OR
                       (CurLoanid <> "Loan ID")
                    THEN BEGIN
                        IF NumOfRec = 1 THEN BEGIN
                            /* Check for the General Leadger Header record only when NumofRec = 1 */
                            GLHeader.Name := 'STANDARD';

                            IF NOT GLHeader.GET(GLedgerReq.Name) THEN BEGIN
                                GLHeader.INIT;
                                GLHeader.Name := 'STANDARD';
                                IF GLHeader.Name = '' THEN
                                    GLHeader.Description := 'Standard ledger'
                                ELSE
                                    GLHeader.Description := 'Salary General Ledger';
                                /*
                                 GLHeader.INSERT
                                */
                            END

                            ELSE
                                /* Get the consecutive number of the last GLedger record */
                                IF GLedgerLine.FIND('+') THEN
                                    ConsecutiveNo := GLedgerLine."Line No." + "PC&CConstant";

                            PRollPeriodRec.GET("Payroll Period");
                            IF PRollPeriodRec.Name = '' THEN
                                GLedgerText := GLedgerText + PRollPeriodRec."Period Code"
                            ELSE
                                GLedgerText := DELCHR(PRollPeriodRec.Name, '<>') + ', ' + GLedgerText;
                        END
                        ELSE
                            /*Insert into General ledger lines file */
                      ConsecutiveNo := SEndToGL('STANDARD', CurrDebitAcc, CurrCreditAcc,
                                                 BookingDate, '', GLedgerText, AmtToBook,
                                                 CurrBookDept, CurrBookProj, ConsecutiveNo,
                                                 VoucherNo, CurrDebAccType, CurrCredAccType, 'SALARY', CurLoanid);

                        /* Save values of the current Payroll Entry record */
                        CurrentPeriod := "Payroll Period";
                        CurrBookDept := "Global Dimension 1 Code";
                        CurrBookProj := "Global Dimension 2 Code";
                        CurrDebAccType := "Debit Acc. Type";
                        CurrDebitAcc := "Debit Account";
                        CurrCredAccType := "Credit Acc. Type";
                        CurrCreditAcc := "Credit Account";
                        CurLoanid := "Loan ID";
                        AmtToBook := Amount

                    END
                    ELSE
                        AmtToBook := AmtToBook + Amount;
                END;

                /*IF  MARK THEN BEGIN*/

                IF (LastPRollEntryRec."Payroll Period" = "Payroll Period") AND
                   (LastPRollEntryRec."Employee No" = "Employee No") AND
                   (LastPRollEntryRec."E/D Code" = "E/D Code")
                   THEN BEGIN
                    /* This is the last record. This means that the latest amount has not been
                    transfered to the General Ledger File*/
                    ConsecutiveNo := SEndToGL('STANDARD', CurrDebitAcc, CurrCreditAcc,
                                              BookingDate, '', GLedgerText, AmtToBook,
                                              CurrBookDept, CurrBookProj, ConsecutiveNo,
                                              VoucherNo, CurrDebAccType, CurrCredAccType, 'SALARY', CurLoanid);
                    MARK(FALSE)
                END;

            end;

            trigger OnPreDataItem()
            begin

                UserSetupRec.GET(USERID);
                //"Payroll-Payslip Lines.".SETRANGE("Posting Group",GPC.GetStoredGroup);
                IF UserSetupRec."Applicable HR Posting Group" <> '' THEN
                    SETFILTER("Posting Group", UserSetupRec."Applicable HR Posting Group");

                PRP := GETFILTER("Payroll Period");
                PRollPeriodRec.GET(PRP);
                IF PRollPeriodRec.Closed = TRUE THEN
                    IF NOT CONFIRM('The period is closed, do you really want to create the Payroll Journal again', TRUE) THEN
                        CurrReport.BREAK;



                SETFILTER(Amount, '<>0');
                IF COUNT = 0 THEN
                    ERROR('No Payroll Records satisfying this delimitations were found')
                ELSE BEGIN
                    LastPRollEntryRec.SETCURRENTKEY("Posting Group", "Payroll Period", "Global Dimension 1 Code",
                                "Global Dimension 2 Code", "Debit Acc. Type",
                                "Debit Account", "Credit Acc. Type",
                                "Credit Account", "Loan ID");
                    LastPRollEntryRec.COPYFILTERS(PayslipLines);
                    LastPRollEntryRec.FIND('+');
                    LastPRollEntryRec.MARK(TRUE)
                END;

                /* The following is a constant used by PC&C. When a user creates a new line
                  in the general ledger window, the line's Consecutive No is the value of the
                  last ledger line plus 10,000*/
                "PC&CConstant" := 12500;
                GLedgerText := 'Salaries';

                Window.OPEN('Total Number of Payroll Entry Lines   #1###\' +
                            'Current Budget Center #2####\' +
                            'Current Cost Center   #3####\' +
                            'Current Employee      #4####\' +
                            'Current E/D           #5####\' +
                            'Counter   #6###');

                Window.UPDATE(1, COUNT);
                InfoCounter := 0;

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Posting Date"; BookingDate)
                {
                    ApplicationArea = All;
                }
                field("Document No."; VoucherNo)
                {
                    ApplicationArea = All;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport()
    begin
        PRollPeriodRec.Closed := TRUE;
        PRollPeriodRec.MODIFY;
    end;

    trigger OnPreReport()
    begin

        /*WITH "Payroll Entry Lines" DO
          dbSELECTKEY ("Payroll Period", "Department Code", "Project Code",
                       "Debit Account", "Credit Account" );*/

        IF PayslipLines.GETFILTER("Payroll Period") = '' THEN
            ERROR('Period codes must be specified for the function');

        IF BookingDate = 0D THEN
            ERROR('Booking date must be specified for the function');
        /*
        IF CompName = '' THEN
          ERROR ('Company Name must be specified for the function');
        
        IF (GLedgerLine.CHANGECOMPANY(CompName) = FALSE) THEN
          ERROR ('Company Name specified is not correct');
         */

    end;

    var
        CurLoanid: Code[10];
        GLedgerReq: Record 80;
        GLHeader: Record 80;
        BookingDate: Date;
        GLedgerLine: Record 81;
        PRollPeriodRec: Record 50004;
        CurrentPeriod: Code[20];
        CurrBookDept: Code[10];
        CurrBookProj: Code[10];
        GLedgerText: Text[30];
        "PC&CConstant": Integer;
        ConsecutiveNo: Integer;
        NumOfRec: Integer;
        CurrDebitAcc: Code[20];
        CurrDebAccType: Enum "Gen. Journal Account Type";
        CurrCreditAcc: Code[20];
        CurrCredAccType: Enum "Gen. Journal Account Type";
        AmtToBook: Decimal;
        LastPRollEntryRec: Record 50006;
        VoucherNo: Code[10];
        DebugCode: Code[20];
        InfoCounter: Integer;
        Window: Dialog;
        CompName: Code[10];
        PRP: Text[10];
        Payrec: Record 5200;
        UserSetupRec: Record 91;

    procedure SEndToGL(GLLName: Text[30]; DebitAccNo: Code[20]; CreditAccNo: Code[20]; BookDate: Date; VouchNo: Text[30]; GLLtext: Text[30]; GLLAmount: Decimal; DeptCode: Code[10]; ProjCode: Code[10]; ConsNum: Integer; VoucherNum: Code[10]; DebAccType: Enum "Gen. Journal Account Type"; CredAccType: Enum "Gen. Journal Account Type"; BatchName: Code[10]; LoanIDEX: Code[10]): Integer
    begin
        IF (DebitAccNo <> '') AND (GLLAmount <> 0) THEN BEGIN
            GLedgerLine.INIT;
            GLedgerLine."Journal Template Name" := GLLName;
            /*BDC*/
            GLedgerLine."Journal Batch Name" := BatchName;
            GLedgerLine."Line No." := ConsNum;
            GLedgerLine."Account Type" := DebAccType;
            GLedgerLine."Account No." := DebitAccNo;
            GLedgerLine.VALIDATE(GLedgerLine."Account No.");
            GLedgerLine."Posting Date" := BookDate;
            GLedgerLine."Document No." := VoucherNum;
            GLedgerLine.Description := GLLtext;
            GLedgerLine.Amount := GLLAmount;
            GLedgerLine.VALIDATE(GLedgerLine.Amount);
            GLedgerLine."Shortcut Dimension 1 Code" := DeptCode;
            GLedgerLine."Shortcut Dimension 2 Code" := ProjCode;
            GLedgerLine."Loan ID" := LoanIDEX;
            GLedgerLine.Description := GLLtext;
            GLedgerLine.INSERT;
            ConsNum := ConsNum + "PC&CConstant";
        END;
        IF (CreditAccNo <> '') AND (GLLAmount <> 0) THEN BEGIN
            GLedgerLine.INIT;
            GLedgerLine."Journal Template Name" := GLLName;
            /*BDC*/
            GLedgerLine."Journal Batch Name" := BatchName;
            GLedgerLine."Account Type" := CredAccType;
            GLedgerLine."Account No." := CreditAccNo;
            GLedgerLine."Line No." := ConsNum;
            GLedgerLine.VALIDATE(GLedgerLine."Account No.");
            GLedgerLine."Posting Date" := BookDate;
            GLedgerLine."Document No." := VoucherNum;
            GLedgerLine.Description := GLLtext;
            GLedgerLine.Amount := -GLLAmount;
            GLedgerLine.VALIDATE(GLedgerLine.Amount);
            GLedgerLine."Shortcut Dimension 1 Code" := DeptCode;
            GLedgerLine."Shortcut Dimension 2 Code" := ProjCode;
            GLedgerLine."Loan ID" := LoanIDEX;

            GLedgerLine.Description := GLLtext;
            GLedgerLine.INSERT;
            ConsNum := ConsNum + "PC&CConstant";
        END;
        EXIT(ConsNum);

    end;
}

