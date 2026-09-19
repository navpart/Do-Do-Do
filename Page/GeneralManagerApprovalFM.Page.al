page 70214 "General Manager Approval FM"
{
    CardPageID = "Air Online Order Card";
    Editable = false;
    PageType = List;
    ApplicationArea = All;

    SourceTable = "Air Online Header";
    SourceTableView = WHERE(Send = CONST(true),
                            HoDPartApproval = CONST(true),
                            ComplianceCheck = CONST(true),
                            HoDAuditApproval = CONST(true),
                            GMapproval = CONST(true),
                            MDapproval = CONST(false),
                            "Genarate FM" = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Requester Code"; Rec."Requester Code")
                {
                }
                field("Requester Name"; Rec."Requester Name")
                {
                }
                field("Department Code"; Rec."Department Code")
                {
                }
                field("Requester Department"; Rec."Requester Department")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Supplier's Name"; Rec."Supplier's Name")
                {
                }
                field("Profoma Invoice No:"; Rec."Profoma Invoice No:")
                {
                }
            }
        }
    }

    actions
    {
    }
}

