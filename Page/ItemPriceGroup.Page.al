page 50150 "Item Price Group"
{
    PageType = List;
    SourceTable = "Item Price Group";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item Price Grp Code"; Rec."Item Price Grp Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Exchange Rate"; Rec."Exchange Rate")
                {
                    DecimalPlaces = 0 : 5;
                }
                field("Landing Cost %"; Rec."Landing Cost %")
                {
                    DecimalPlaces = 0 : 5;
                }
                field("Price Adjustment %"; Rec."Price Adjustment %")
                {
                    DecimalPlaces = 0 : 5;
                }
                field("Maximum Discount %"; Rec."Maximum Discount %")
                {
                    BlankZero = true;
                }
                field("Min Profit % After Discount"; Rec."Min Profit % After Discount")
                {
                    BlankZero = true;
                }
                field("MarkUp Profit % After Discount"; Rec."MarkUp Profit % After Discount")
                {
                    BlankZero = true;
                    Style = Standard;
                    StyleExpr = TRUE;
                }
                field("Profit % On Cost B4 Discount"; Rec."Profit % On Cost B4 Discount")
                {
                    BlankZero = true;
                    MultiLine = true;
                }
                field("MarkUp Profit % B4 Discount"; Rec."MarkUp Profit % B4 Discount")
                {
                    BlankZero = true;
                    MultiLine = true;
                    Style = Standard;
                    StyleExpr = TRUE;
                }
                field("Group Count"; Rec."Group Count")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ViewGroupItems)
            {
                Caption = 'View Group Items';
                Promoted = true;
                PromotedCategory = Process;
                Image = ItemGroup;
                ToolTip = 'Open the item list filtered to show items in this price group';

                trigger OnAction()
                var
                    Item: Record Item;
                begin
                    Item.SetRange("Item Price Group", Rec."Item Price Grp Code");
                    Page.Run(Page::"Item List", Item);
                end;
            }

            action(UpdateSellingPrice)
            {
                Caption = 'Update Item Selling Price';
                Promoted = true;
                PromotedCategory = Process;
                Image = UpdateUnitCost;

                trigger OnAction()
                begin
                    Rec.UpdateSellingPrice();
                end;
            }


            action("Update Item Profit %")
            {
                Caption = 'Update Item Profit %';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    ItemRec.SETCURRENTKEY(ItemRec."Item Price Group");
                    ItemRec.SETRANGE(ItemRec."Item Price Group", Rec."Item Price Grp Code");
                    ItemRec.SETRANGE(ItemRec."Block Price Group Update", FALSE); //added by santus
                    IF CONFIRM('Update Profit on Items for Group %2 to  %3 ?', TRUE, FALSE, Rec."Item Price Grp Code",
                                                                             Rec."MarkUp Profit % B4 Discount") THEN BEGIN
                        IF ItemRec.FIND('-') THEN BEGIN
                            ItemRec.MODIFYALL(ItemRec."Profit %", Rec."MarkUp Profit % B4 Discount", TRUE);
                            MESSAGE('Profit on Items for Group %1 have been Updated to %2', Rec."Item Price Grp Code", Rec."MarkUp Profit % B4 Discount");
                        END;
                    END;
                end;
            }
        }
    }

    var
        ItemRec: Record 27;
}

