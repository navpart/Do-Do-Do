pageextension 50023 "Purchases & Payables Setup Ext" extends "Purchases & Payables Setup"
{
    layout
    {
        addafter("Posted Prepmt. Cr. Memo Nos.")
        {
            field("LPP Nos."; Rec."LPP Nos.")
            {
                ApplicationArea = All;
            }
            field("LPO Nos."; Rec."LPO Nos.")
            {
                ApplicationArea = All;
            }

        }

        addafter("Default Accounts")
        {
            group(Emails)
            {
                field("MD's e-mail"; Rec."MD's e-mail")
                {
                    ApplicationArea = All;
                }
                field("GM's e-mail"; Rec."GM's e-mail")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Audit Dept. Approvers"; Rec."Audit Dept. Approvers")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("CC Audit Dept. Approvers"; Rec."CC Audit Dept. Approvers")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Account Dept. Approvers"; Rec."Account Dept. Approvers")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("CC Account Dept. Approvers"; Rec."CC Account Dept. Approvers")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }

            }
        }
    }
}
