page 50381 "FIFO Lists"
{
    Editable = false;
    PageType = List;
    SourceTable = "Item Ledger Entry";
    SourceTableView = SORTING("Purchase Date")
                      WHERE("Remaining Quantity" = FILTER(<> 0));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Purchase Date"; Rec."Purchase Date")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Serial No."; Rec."Serial No.")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Exterior Colour Name"; Rec."Exterior Colour Name")
                {
                }
                field("Exterior Colour Code"; Rec."Exterior Colour Code")
                {
                }
                field("Key No."; Rec."Key No.")
                {
                }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                    Caption = 'Quantity';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.SETCURRENTKEY("Purchase Date");
    end;
}

