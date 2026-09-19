page 70535 "Allocation Card"
{
    PageType = Card;
    SourceTable = 70062;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Code; Rec.Code)
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Total Allocated Quantity"; Rec."Total Allocated Quantity")
                {
                }
                field("Total Available Quantity"; Rec."Total Available Quantity")
                {
                }
                field("Item Description"; Rec."Item Description")
                {
                }
            }
            part(Line; 70534)
            {
                SubPageLink = "Document No." = FIELD(Code);
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        IF Rec."Total Allocated Quantity" <> 0 THEN
            Rec.VALIDATE("Total Allocated Quantity");
    end;

    trigger OnOpenPage()
    begin

        IF Rec."Total Allocated Quantity" <> 0 THEN
            Rec.VALIDATE("Total Allocated Quantity");
            
    end;
}

