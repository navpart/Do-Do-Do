page 70012 "Payment/Receipt Bal. Line"
{
    ApplicationArea = All;
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Payment/Receipt Bal. Line.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Account Description"; Rec."Account Description")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Department Code"; Rec."Department Code")
                {
                }
                field("Branch Code"; Rec."Branch Code")
                {
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {

                }
                field("FA Posting Type"; Rec."FA Posting Type")
                {
                    Visible = false;
                }
                field("Transaction Description"; Rec."Transaction Description")
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
                field("Exchange Rate"; Rec."Exchange Rate")
                {
                }
                field("Credit Amount"; Rec."Credit Amount")
                {
                }
                field("Debit Amount"; Rec."Debit Amount")
                {
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                }
                field("Apply Entry"; Rec."Apply Entry")
                {
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                }
                field("Loan ID"; Rec."Loan ID")
                {
                    Visible = false;
                }
                field("Loan Type"; Rec."Loan Type")
                {
                    Visible = false;
                }
                field("Maintenance Code"; Rec."Maintenance Code")
                {
                    Visible = false;
                }
                field("Job Task code"; Rec."Job Task code")
                {
                    Visible = false;
                }
                field("Job Code"; Rec."Job Code")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Department Code" := headrec."Global Dimension 1 Code";
        Rec."Branch Code" := headrec."Global Dimension 2 Code";
        IF headrec."Multiple Account" THEN BEGIN
            Rec.VALIDATE("Account Type", headrec."Account Type");
            Rec.VALIDATE("Account No.", headrec."Account No.");
        END;
        IF headrec."Multiple Balance Account" THEN BEGIN
            Rec.VALIDATE("Account Type", headrec."Balance Account Type");
            Rec.VALIDATE("Account No.", headrec."Balance Account No.");
        END
    end;

    var
        headrec: Record 50103;

    local procedure OnActivateForm()
    begin
        headrec.GET(Rec.Type, Rec."Cash/Cheque", Rec."No.");
    end;
}

