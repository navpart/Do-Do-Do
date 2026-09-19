page 70130 "Procurement FactBox"
{
    ApplicationArea = All;
    Caption = 'e-Procurement Details';
    PageType = CardPart;
    SourceTable = "Procurement Header";

    layout
    {
        area(content)
        {
            field("No."; Rec."No.")
            {
            }
            field("LPO No."; Rec."LPO No.")
            {
            }
            field("Posted Payments"; Rec."Posted Payments")
            {
            }
            field("Payment No."; Rec."Payment No.")
            {
            }
        }
    }

    actions
    {
    }

    trigger OnFindRecord(Which: Text): Boolean
    begin
        IF Rec.FIND(Which) THEN BEGIN
            Rec.FILTERGROUP(4);
            // SETFILTER("No.",GetBillToCustomerNo);
            Rec.FILTERGROUP(0);
        END;

        EXIT(Rec.FIND(Which));
    end;
}

