page 50608 "Approved Leave List"
{
    ApplicationArea = All;
    CardPageID = "Leave Request Card";
    Editable = false;
    PageType = List;
    SourceTable = "Leave Request3";
    SourceTableView = WHERE(Approved2 = CONST(true),
                            Treated = CONST(false),
                            Reject = CONST(false),
                            "Entry Date" = FILTER('01/01/23..'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Request No."; Rec."Request No.")
                {
                }
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field("Empployee Name"; EmpREc.GetFullName(Rec."Employee No."))
                {
                    Caption = 'Employee Name';
                }
                field("Employee No."; Rec."Employee No.")
                {
                }
                field("Request Type"; Rec."Request Type")
                {
                    Visible = false;
                }
                field("Employment Date"; Rec."Employment Date")
                {
                }
                field("Global Dimension 1 code"; Rec."Global Dimension 1 code")
                {

                }
            }
        }
    }

    actions
    {
    }

    var
        EmpREc: Record 5200;
}

