page 70176 "Item List TCSC"
{
    PageType = List;
    SourceTable = "Item";
    ApplicationArea = All;
    CardPageId = "Item Card";
    SourceTableView = SORTING("No.") WHERE("Location Filter" = FILTER('120ISO'));
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
                field("Retail Price"; Rec."Retail Price")
                {
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                }
                field("Transfer Cost"; Rec."Transfer Cost")
                {
                }
                field(Inventory; Rec.Inventory)
                {
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.SetRange("Location Filter", '120ISO');
    end;
}



