page 50225 "Dealer Stock Availabilities"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Item";
    SourceTableView = WHERE("Inventory" = FILTER(> 0),
                            "Net Change" = FILTER(> 0));
    ApplicationArea = All;

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
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field("Date Filter"; Rec."Date Filter")
                {
                }
                field("Location Filter"; Rec."Location Filter")
                {
                }
                field(Inventory; Rec.Inventory)
                {

                    trigger OnDrillDown()
                    begin

                        ERROR('You Don''t Have Permision to Open Details');
                    end;
                }
                field("Net Change"; Rec."Net Change")
                {

                    trigger OnDrillDown()
                    begin

                        ERROR('You Don''t Have Permision to Open Details');
                    end;
                }
                field("Qty. on Purch. Order"; Rec."Qty. on Purch. Order")
                {

                    trigger OnDrillDown()
                    begin

                        ERROR('You Don''t Have Permision to Open Details');
                    end;
                }
                field("Qty. on Sales Order"; Rec."Qty. on Sales Order")
                {

                    trigger OnDrillDown()
                    begin

                        ERROR('You Don''t Have Permision to Open Details');
                    end;
                }
            }
        }
    }

    actions
    {
    }
}

