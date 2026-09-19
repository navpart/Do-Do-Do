page 50119 "Expense Analysis List"
{
    CardPageID = "Expense Analysis Card";
    PageType = List;
    SourceTable = "Expense Analysis Header";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("G/L Account No."; Rec."G/L Account No.")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

