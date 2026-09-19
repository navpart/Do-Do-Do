page 70204 "Generate LPO"
{
    ApplicationArea = All;
    CardPageID = "LPP Card";
    PageType = List;
    SourceTable = "Local Part Purchase Register";
    SourceTableView = WHERE("Genarate LPO" = CONST(true),
                            GenaratePayment = CONST(false));

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
                field(Date; Rec.Date)
                {
                }
            }
        }
    }

    actions
    {
    }
}

