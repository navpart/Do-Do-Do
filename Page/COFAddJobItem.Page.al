page 50334 "COF Add. Job Item"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Customer Order Line";
    SourceTableView = WHERE("Additional Jobs" = filter(true));
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer Order Form No."; Rec."Customer Order Form No.")
                {
                    Visible = false;
                }
                field("Operation Code"; Rec."Operation Code")
                {
                }
                field("Line No."; Rec."Line No.")
                {
                }
                field("Line Type"; Rec."Line Type")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Variant; Rec.Variant)
                {
                    Visible = false;
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Available Quantity"; Rec."Available Quantity")
                {
                }
                field(Results; Rec.Results)
                {
                }
                field(Difference; Rec.Difference)
                {
                }
                field("Additional Jobs"; Rec."Additional Jobs")
                {
                }
                field("Stock Status"; Rec."Stock Status")
                {
                }
                field(Stock; Rec.Stock)
                {
                }
                field(EDA; Rec.EDA)
                {
                }
            }
        }
    }

    actions
    {
    }
}

