page 70208 "Online Form Sub"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Air Online Order Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                }
                field("Order Type"; Rec."Order Type")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("Item No"; Rec."Item No")
                {
                }
                field("Item Name"; Rec."Item Name")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Amount (FCY)"; Rec."Amount (FCY)")
                {
                }
                field("Deposit Amount (LCY)"; Rec."Deposit Amount (LCY)")
                {
                }
                field("Incoming Document Entry No."; Rec."Incoming Document Entry No.")
                {

                }
                field(Preferred; Rec.Preferred)
                {
                }
                field(Authorisation; Rec.Authorisation)
                {
                }
                field("PIC of order approval"; Rec."PIC of order approval")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        IncomingDocument: Record 130;
}

