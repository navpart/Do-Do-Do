page 50134 "Monthly Vehicle Order"
{
    PageType = Card;
    SourceTable = "Monthly Vehicle Order";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Period Starting"; Rec."Period Starting")
                {
                }
                field("PO Number"; Rec."PO Number")
                {
                }
                field(Purchaser; Rec.Purchaser)
                {
                }
                field("Customer Gen Bus Posting Group"; Rec."Customer Gen Bus Posting Group")
                {
                }
                field(Customer; Rec.Customer)
                {
                }
                field("Line Vehicle Count"; Rec."Line Vehicle Count")
                {
                }
                field("Vehicle Count"; Rec."Vehicle Count")
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
                field("Exchange Rate"; Rec."Exchange Rate")
                {
                }
                field("PO Created"; Rec."PO Created")
                {
                }
                field("Posted Invoice No."; Rec."Posted Invoice No.")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        CurrPage.EDITABLE((NOT Rec."PO Created") AND (Rec."Posted Invoice No." = ''));
    end;

    var
        CustRec: Record 18;
}

