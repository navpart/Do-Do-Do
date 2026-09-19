page 70212 "Compliance Check FM"
{
    CardPageID = "Air Online Order Card";
    Editable = false;
    PageType = List;
    SourceTable = "Air Online Header";
    ApplicationArea = All;
    SourceTableView = WHERE(Send = CONST(true),
                            HoDPartApproval = CONST(true),
                            ComplianceCheck = CONST(true),
                            HoDAuditApproval = CONST(false));

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

