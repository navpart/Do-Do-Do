page 70196 "HOD Audit Approval LPP"
{
    ApplicationArea = All;
    CardPageID = "LPP Card2";
    PageType = List;
    SourceTable = "Local Part Purchase Register";
    SourceTableView = WHERE(ComplianceCheck = CONST(true),
                            HoDAuditApproval = CONST(true),
                            "Procurement Approval" = CONST(false),
                            "MD Approval" = CONST(false),
                            "GM Approval" = CONST(false),
                            //"Order Type" = FILTER('<>Isolo Store'),
                            Rejected = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("LPP No."; Rec."LPP No.")
                {
                }
                field("Requester Name"; Rec."Requester Name")
                {
                }
                field("Requester Department"; Rec."Requester Department")
                {
                }
                field("Supplier's Name"; Rec."Supplier's Name")
                {
                }
                field("Justification for purchase"; Rec."Justification for purchase")
                {
                }
                field("Total Purchase Value"; Rec."Total Purchase Value")
                {
                }
            }
        }
    }

    actions
    {
    }
}

