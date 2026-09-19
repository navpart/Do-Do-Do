page 70060 "Request For Quotes COF"
{
    CardPageID = "Request For Quote card";
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE(Compliance = CONST(false),
                            Send = CONST(false), "Document Type" = CONST(Opex), Reject = CONST(false));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Date; Rec.Date)
                {
                }
                field("No."; Rec."No.")
                {
                    Caption = 'Opex No.';
                }
                field("Requester Name"; Rec."Requester Name")
                {
                }
                field("Requester Department"; Rec."Requester Department")
                {
                }
                field("Head of Department"; Rec."Head of Department")
                {
                }
                field("Head of Audit"; Rec."Head of Audit")
                {
                }
                field("General Manager"; Rec."General Manager")
                {
                }
                field("Managing Director"; Rec."Managing Director")
                {
                }
            }
        }
    }

    actions
    {
    }
}

