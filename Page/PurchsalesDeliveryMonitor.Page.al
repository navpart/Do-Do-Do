page 50401 "Purch/sales-Delivery Monitor"
{
    PageType = Card;
    SourceTable = "Purch/Sales-Delivery Monitor";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Month; Rec.Month)
                {
                }
                field("Chassis No."; Rec."Chassis No.")
                {
                }
                field("Model Code"; Rec."Model Code")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Key No."; Rec."Key No.")
                {
                }
                field("Colour Name"; Rec."Colour Name")
                {
                }
                field("PO No."; Rec."PO No.")
                {
                }
                field(Purchased; Rec.Purchased)
                {
                }
                field("Purch. Rcpt. No."; Rec."Purch. Rcpt. No.")
                {
                }
                field(Sold; Rec.Sold)
                {
                }
                field("Sales Rcpt. No."; Rec."Sales Rcpt. No.")
                {
                }
                field(Delivered; Rec.Delivered)
                {
                }
            }
        }
    }

    actions
    {
    }
}

