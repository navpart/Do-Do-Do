page 50107 "Expense Analysis Card"
{
    PageType = Card;
    SourceTable = "Expense Analysis Header";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("G/L Account No."; Rec."G/L Account No.")
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
            }
            group(Control1)
            {
                part("Current Year"; "Expense Analysis Subform 2")
                {
                    Caption = 'Current Year';
                    SubPageLink = "G/L Account No." = FIELD("G/L Account No.");
                }
                part("<Expense Analysis Subform>"; "Expense Analysis Subform 2")
                {
                    Caption = 'Previous Year';
                    SubPageLink = "G/L Account No." = FIELD("G/L Account No.");
                }
            }
        }
        area(factboxes)
        {
            systempart(Notes; Notes)
            {
            }
            systempart(Links; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Import Entries")
            {
                Image = ImplementCostChanges;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.ImportEntries;
                end;
            }
        }
    }
}

