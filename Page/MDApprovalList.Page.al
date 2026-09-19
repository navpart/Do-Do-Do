page 50607 "MD Approval List"
{
    ApplicationArea = All;
    CardPageID = "Leave Request Card";
    PageType = List;
    Editable = false;
    SourceTable = "Leave Request3";
    SourceTableView = WHERE("MD Leave Approval" = CONST(true),
                            Approved2 = CONST(false),
                            Treated = CONST(false),
                            Reject = CONST(false));

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
                    Caption = 'Department';
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

