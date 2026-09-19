page 70141 "Closed Opex"
{
    ApplicationArea = All;
    CardPageID = "Opex Card";
    Editable = false;
    PageType = List;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE(Closed = CONST(true),
                            "Document Type" = CONST(Opex),
                            Reject = CONST(false));

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
                field("Department Code"; Rec."Department Code")
                {
                }
                field("Proposed Purchase Amount"; Rec."Proposed Purchase Amount")
                {
                }
                field("Purchase Justification"; Rec."Purchase Justification")
                {
                }
                field(TimeDate2; Rec.TimeDate2)
                {
                }
                field(TimeDate3; Rec.TimeDate3)
                {
                }
                field(TimeDate4; Rec.TimeDate4)
                {
                }
                field(TimeDate10; Rec.TimeDate10)
                {
                }
                field(TimeDate11; Rec.TimeDate11)
                {
                }
                field(TimeDate12; Rec.TimeDate12)
                {
                }
            }
        }
    }

    actions
    {
    }
}

