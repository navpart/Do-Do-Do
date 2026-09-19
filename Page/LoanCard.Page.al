page 50024 "Loan Card."
{
    PageType = Card;
    SourceTable = "Loan.";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Loan ID"; Rec."Loan ID")
                {

                    trigger OnAssistEdit()
                    begin

                        IF Rec.AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Staff No."; Rec."Staff No.")
                {
                }
                field("Staff Name"; Rec."Staff Name")
                {
                }
                field("Loan Type"; Rec."Loan Type")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Loan ED Regular"; Rec."Loan ED Regular")
                {
                }
                field("Journal Batch"; Rec."Journal Batch")
                {
                }
                field("Loan Created"; Rec."Loan Created")
                {
                }
            }
            group(Posting)
            {
                Caption = 'Posting';
                field("Acct. Type"; Rec."Acct. Type")
                {
                }
                field("Acct. No."; Rec."Acct. No.")
                {
                }
                field("Loan Posting Date"; Rec."Loan Posting Date")
                {
                }
                field("Voucher No. for Loan"; Rec."Voucher No. for Loan")
                {
                }
                field("Counter Acct. Type"; Rec."Counter Acct. Type")
                {
                }
                field("Counter Acct. No."; Rec."Counter Acct. No.")
                {
                }
            }
            group(Status)
            {
                Caption = 'Status';
                field("Loan Amount"; Rec."Loan Amount")
                {
                }
                field("Number of Payments"; Rec."Number of Payments")
                {
                }
                field("Interest Percent"; Rec."Interest Percent")
                {
                }
                field(LPlusInt; Rec.LPlusInt)
                {
                    Caption = 'Principal+Interest';
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Monthly Repayment"; Rec."Monthly Repayment")
                {
                    Style = Standard;
                    StyleExpr = TRUE;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Cust Ldg Entry No"; Rec."Cust Ldg Entry No")
                {
                }
                field("Start Period"; Rec."Start Period")
                {
                }
                field("Open(Y/N)"; Rec."Open(Y/N)")
                {
                }
                field("Suspended(Y/N)"; Rec."Suspended(Y/N)")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Loan")
            {
                Caption = '&Loan';
                action("Create Staff &Customer Account")
                {
                    Caption = 'Create Staff &Customer Account';

                    trigger OnAction()
                    begin
                        employee.SETRANGE("No.", Rec."Staff No.");
                        //REPORT.RUN(REPORT::"Create Customer Acct. forStaff",FALSE,FALSE,employee);

                        MESSAGE('Staff Vendor Account Created');
                    end;
                }
            }
        }
        area(processing)
        {
            action("&Create Loan Gen. Journal")
            {
                Caption = '&Create Loan Gen. Journal';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.InserGlLine(TRUE);
                end;
            }
        }
    }

    var
        employee: Record 5200;
        gpc: Codeunit 50004;
        DefaultPostingGroup: Code[20];
}

