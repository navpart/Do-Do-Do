page 50160 "Dealer Online Menu"
{
    PageType = Card;
    ApplicationArea = All;
    layout
    {
    }

    actions
    {
        area(processing)
        {
            action("Stock List")
            {
                Caption = 'Stock List';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 50225;
                RunPageView = WHERE(Inventory = FILTER(> 0));
            }
            action("Place Order")
            {
                Caption = 'Place Order';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 50156;
            }
        }
    }
}

