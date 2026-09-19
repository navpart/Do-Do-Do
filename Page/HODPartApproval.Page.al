page 70194 "HOD Part Approval"
{
    Caption = 'HOD Approval';
    ApplicationArea = All;
    CardPageID = "LPP Card2";
    PageType = List;
    SourceTable = "Local Part Purchase Register";
    SourceTableView = WHERE(HoDPartApproval = CONST(true),
                            ComplianceCheck = CONST(false),
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
                field("RFQ No."; Rec."RFQ No.")
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

