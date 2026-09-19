page 50538 "Product Grp List"
{
    PageType = List;
    SourceTable = "Product Grp";
    ApplicationArea = All;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item Category Code"; Rec."Item Category Code")
                {
                }
                field(Code; Rec.Code)
                {
                    Width = 15;
                }
                field(Description; Rec.Description)
                {
                }
                field("Warehouse Class Code"; Rec."Warehouse Class Code")
                {
                }
                field("Date Filter"; Rec."Date Filter")
                {
                }
                field("Global Dimension 1 Filter"; Rec."Global Dimension 1 Filter")
                {
                }
                field("Global Dimension 2 Filter"; Rec."Global Dimension 2 Filter")
                {
                }
                field("Location Filter"; Rec."Location Filter")
                {
                }
                field("Variant Filter"; Rec."Variant Filter")
                {
                }
                field("Item No. Filter"; Rec."Item No. Filter")
                {
                }
            }
        }
    }

    actions
    {
    }
}

