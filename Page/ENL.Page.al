page 50550 ENL
{
    PageType = List;
    SourceTable = "Item Ledger Entry";
    SourceTableView = WHERE("Entry Type" = FILTER('Sale'),
                            "Source No." = FILTER('TDV01020'));
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Source No."; Rec."Source No.")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Serial No."; Rec."Serial No.")
                {
                }
                field("Chassis No."; Rec."Chassis No.")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Chasis Number"; Rec."Chasis Number")
                {
                }
            }
        }
    }

    actions
    {
    }
}

