page 50096 "Leave Payment List Rev2"
{
    ApplicationArea = All;
    //CardPageID = "Actual Leave Card";
    PageType = ListPart;
    SourceTable = "Leave Payment Rev 2";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Leave Period"; Rec."Leave Period")
                {
                    Visible = false;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    Visible = false;
                }
                field("Document No"; Rec."Document No")
                {
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                }
                field("Payment Date"; Rec."Payment Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

