page 50172 "Requested Items"
{
    PageType = Card;
    SourceTable = "Parts Enquiry";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Part No"; Rec."Part No")
                {
                }
                field("Part Description"; Rec."Part Description")
                {
                }
                field("Quantity Demanded"; Rec."Quantity Demanded")
                {
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field("Quantity Supplied"; Rec."Quantity Supplied")
                {
                }
                field("Lost Quantity"; Rec."Lost Quantity")
                {
                }
                field("Inv No."; Rec."Inv No.")
                {
                }
                field("Entry No"; Rec."Entry No")
                {
                }
            }
        }
    }

    actions
    {
    }
}

