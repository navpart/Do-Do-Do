page 70118 "Capex List"
{
    ApplicationArea = All;
    CardPageID = "Capex Card";
    PageType = List;
    Editable = false;
    SourceTable = "Procurement Header";
    SourceTableView = WHERE("Document Type" = CONST(Capex),
                            Send = filter(false),
                            Reject = filter(false),
                            Compliance = filter(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'Capex No.';
                }
                field(Date; Rec.Date)
                {
                }
                field("Requester Name"; Rec."Requester Name")
                {
                }
                field("Requester Department"; Rec."Requester Department")
                {
                }
            }
        }
    }

    actions
    {
    }
}

