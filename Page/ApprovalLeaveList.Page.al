page 50609 "Approval Leave List"
{
    ApplicationArea = All;
    CardPageID = "Leave Request Card";
    PageType = List;
    Editable = false;
    SourceTable = "Leave Request3";
    SourceTableView = WHERE("Send for Approval" = CONST(true),
                            Approved2 = CONST(false),
                            Treated = CONST(false),
                            "MD Leave Approval" = CONST(false),
                            Reject = CONST(false),
                            "HOD HR/ADMIN" = CONST(false),
                            "Date Filter" = FILTER('01/01/23..'));

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
                field("Employee Name"; EmpREc.GetFullName(Rec."Employee No."))
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

