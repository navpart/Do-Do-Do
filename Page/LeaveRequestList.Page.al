page 50604 "Leave Request List"
{
    ApplicationArea = All;
    CardPageID = "Leave Request Card";
    PageType = List;
    Editable = false;
    SourceTable = "Leave Request3";
    SourceTableView = WHERE(Treated = CONST(false),
                            "Send for Approval" = CONST(false),
                            Reject = CONST(false),
                            "HOD HR/ADMIN" = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Request No."; Rec."Request No.")
                {
                    Editable = false;
                }
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field("Employee No."; Rec."Employee No.")
                {
                }
                field("Employee Name"; EmpREc.GetFullName(Rec."Employee No."))
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
                field("Requester Name"; Rec."Requester Name")
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

