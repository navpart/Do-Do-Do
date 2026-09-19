page 50125 "Non-Capitalized Assets"
{
    ApplicationArea = All;
    CardPageID = "Non-Capitalized Asset";
    Editable = false;
    PageType = List;
    SourceTable = "Non-Capitalized Asset";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("FA Location Code"; Rec."FA Location Code")
                {
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                }
                field("Acquisition Date"; Rec."Acquisition Date")
                {
                }
                field("Acquisition Cost"; Rec."Acquisition Cost")
                {
                }
                field("Voucher No."; Rec."Voucher No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

