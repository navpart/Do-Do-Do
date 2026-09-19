page 50013 "Purchase Requisition."
{
    ApplicationArea = All;
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Purchase Requisition";
    UsageCategory = Lists;
    Caption = 'Dynamic Ordering System';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                /*  field("Line No"; Rec."Line No")
                 {
                 } */
                field("Item No."; Rec."Item No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("SSD Period"; Rec."SSD Period")
                {
                }
                field("SSS Period"; Rec."SSS Period")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Reorder Quantity"; Rec."Reorder Quantity")
                {
                    DecimalPlaces = 1 : 1;
                }
                field("Qty On Order"; Rec."Qty On Order")
                {
                }
                field("Stock On Hand"; Rec."Stock On Hand")
                {
                }
                field("Qty On Sales Order"; Rec."Qty On Sales Order")
                {
                }
                field("Ordered Qty"; Rec."Ordered Qty")
                {
                }
                field("SOQ (Demand)"; Rec."SOQ (Demand)")
                {
                }
                field("SOQ (Sales)"; Rec."SOQ (Sales)")
                {
                }
                field("SOQ (Lost Sales)"; Rec."SOQ (Lost Sales)")
                {
                }
                field(Supplier; Rec.Supplier)
                {
                }
                field("Ordered Date"; Rec."Ordered Date")
                {
                }
                field("Other Specification"; Rec."Other Specification")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field(Ordered; Rec.Ordered)
                {
                }
                field(Inventory; Rec.Inventory)
                {
                }
                field("MIP(Sales)"; Rec."MIP(Sales)")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("Lost Q'ty"; Rec."Lost Q'ty")
                {
                }
                field("Ceilling Code"; Rec."Ceilling Code")
                {
                }
                field("Abnormal Q'ty"; Rec."Abnormal Q'ty")
                {
                }
                field("Average Sales"; Rec."Average Sales")
                {
                }
                field("N - 1"; Rec."N - 1")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("N - 2"; Rec."N - 2")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("N - 3"; Rec."N - 3")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("N - 4"; Rec."N - 4")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("N - 5"; Rec."N - 5")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("N - 6"; Rec."N - 6")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("N - 7"; Rec."N - 7")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("N - 8"; Rec."N - 8")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("N - 9"; Rec."N - 9")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("N - 10"; Rec."N - 10")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("N - 11"; Rec."N - 11")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("N - 12"; Rec."N - 12")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("Total Sales Last 12M"; Rec."Total Sales Last 12M")
                {
                }
                field("Fr - 1"; Rec."Fr - 1")
                {
                }
                field("Fr - 2"; Rec."Fr - 2")
                {
                }
                field("Fr - 3"; Rec."Fr - 3")
                {
                }
                field("Fr - 4"; Rec."Fr - 4")
                {
                }
                field("Fr - 5"; Rec."Fr - 5")
                {
                }
                field("Fr - 6"; Rec."Fr - 6")
                {
                }
                field("Fr - 7"; Rec."Fr - 7")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("Fr - 8"; Rec."Fr - 8")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("Fr - 9"; Rec."Fr - 9")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("Fr - 10"; Rec."Fr - 10")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("Fr - 11"; Rec."Fr - 11")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("Fr - 12"; Rec."Fr - 12")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("MIP(Demand)"; Rec."MIP(Demand)")
                {
                }
                field("QD - 1"; Rec."QD - 1")
                {

                    trigger OnValidate()
                    begin
                        Rec."QD - Total" := Rec."QD - 1" + Rec."QD - 2" + Rec."QD - 3" + Rec."QD - 4" + Rec."QD - 5" + Rec."QD - 6" + Rec."QD - 7" + Rec."QD - 8" + Rec."QD - 9" + Rec."QD - 10" + Rec."QD - 11" + Rec."QD - 12";
                    end;
                }
                field("QD - 2"; Rec."QD - 2")
                {

                    trigger OnValidate()
                    begin
                        Rec."QD - Total" := Rec."QD - 1" + Rec."QD - 2" + Rec."QD - 3" + Rec."QD - 4" + Rec."QD - 5" + Rec."QD - 6" + Rec."QD - 7" + Rec."QD - 8" + Rec."QD - 9" + Rec."QD - 10" + Rec."QD - 11" + Rec."QD - 12";
                    end;
                }
                field("QD - 3"; Rec."QD - 3")
                {

                    trigger OnValidate()
                    begin
                        Rec."QD - Total" := Rec."QD - 1" + Rec."QD - 2" + Rec."QD - 3" + Rec."QD - 4" + Rec."QD - 5" + Rec."QD - 6" + Rec."QD - 7" + Rec."QD - 8" + Rec."QD - 9" + Rec."QD - 10" + Rec."QD - 11" + Rec."QD - 12";
                    end;
                }
                field("QD - 4"; Rec."QD - 4")
                {

                    trigger OnValidate()
                    begin
                        Rec."QD - Total" := Rec."QD - 1" + Rec."QD - 2" + Rec."QD - 3" + Rec."QD - 4" + Rec."QD - 5" + Rec."QD - 6" + Rec."QD - 7" + Rec."QD - 8" + Rec."QD - 9" + Rec."QD - 10" + Rec."QD - 11" + Rec."QD - 12";
                    end;
                }
                field("QD - 5"; Rec."QD - 5")
                {

                    trigger OnValidate()
                    begin
                        Rec."QD - Total" := Rec."QD - 1" + Rec."QD - 2" + Rec."QD - 3" + Rec."QD - 4" + Rec."QD - 5" + Rec."QD - 6" + Rec."QD - 7" + Rec."QD - 8" + Rec."QD - 9" + Rec."QD - 10" + Rec."QD - 11" + Rec."QD - 12";
                    end;
                }
                field("QD - 6"; Rec."QD - 6")
                {

                    trigger OnValidate()
                    begin
                        Rec."QD - Total" := Rec."QD - 1" + Rec."QD - 2" + Rec."QD - 3" + Rec."QD - 4" + Rec."QD - 5" + Rec."QD - 6" + Rec."QD - 7" + Rec."QD - 8" + Rec."QD - 9" + Rec."QD - 10" + Rec."QD - 11" + Rec."QD - 12";
                    end;
                }
                field("QD - 7"; Rec."QD - 7")
                {
                    DecimalPlaces = 0 : 0;

                    trigger OnValidate()
                    begin
                        Rec."QD - Total" := Rec."QD - 1" + Rec."QD - 2" + Rec."QD - 3" + Rec."QD - 4" + Rec."QD - 5" + Rec."QD - 6" + Rec."QD - 7" + Rec."QD - 8" + Rec."QD - 9" + Rec."QD - 10" + Rec."QD - 11" + Rec."QD - 12";
                    end;
                }
                field("QD - 8"; Rec."QD - 8")
                {
                    DecimalPlaces = 0 : 0;

                    trigger OnValidate()
                    begin
                        Rec."QD - Total" := Rec."QD - 1" + Rec."QD - 2" + Rec."QD - 3" + Rec."QD - 4" + Rec."QD - 5" + Rec."QD - 6" + Rec."QD - 7" + Rec."QD - 8" + Rec."QD - 9" + Rec."QD - 10" + Rec."QD - 11" + Rec."QD - 12";
                    end;
                }
                field("QD - 9"; Rec."QD - 9")
                {
                    DecimalPlaces = 0 : 0;

                    trigger OnValidate()
                    begin
                        Rec."QD - Total" := Rec."QD - 1" + Rec."QD - 2" + Rec."QD - 3" + Rec."QD - 4" + Rec."QD - 5" + Rec."QD - 6" + Rec."QD - 7" + Rec."QD - 8" + Rec."QD - 9" + Rec."QD - 10" + Rec."QD - 11" + Rec."QD - 12";
                    end;
                }
                field("QD - 10"; Rec."QD - 10")
                {
                    DecimalPlaces = 0 : 0;

                    trigger OnValidate()
                    begin
                        Rec."QD - Total" := Rec."QD - 1" + Rec."QD - 2" + Rec."QD - 3" + Rec."QD - 4" + Rec."QD - 5" + Rec."QD - 6" + Rec."QD - 7" + Rec."QD - 8" + Rec."QD - 9" + Rec."QD - 10" + Rec."QD - 11" + Rec."QD - 12";
                    end;
                }
                field("QD - 11"; Rec."QD - 11")
                {
                    DecimalPlaces = 0 : 0;

                    trigger OnValidate()
                    begin
                        Rec."QD - Total" := Rec."QD - 1" + Rec."QD - 2" + Rec."QD - 3" + Rec."QD - 4" + Rec."QD - 5" + Rec."QD - 6" + Rec."QD - 7" + Rec."QD - 8" + Rec."QD - 9" + Rec."QD - 10" + Rec."QD - 11" + Rec."QD - 12";
                    end;
                }
                field("QD - 12"; Rec."QD - 12")
                {
                    DecimalPlaces = 0 : 0;

                    trigger OnValidate()
                    begin
                        Rec."QD - Total" := Rec."QD - 1" + Rec."QD - 2" + Rec."QD - 3" + Rec."QD - 4" + Rec."QD - 5" + Rec."QD - 6" + Rec."QD - 7" + Rec."QD - 8" + Rec."QD - 9" + Rec."QD - 10" + Rec."QD - 11" + Rec."QD - 12";
                    end;
                }
                field("QD - Total"; Rec."QD - Total")
                {

                    trigger OnValidate()
                    begin
                        xRec."QD - Total" := xRec."QD - 1" + xRec."QD - 2" + xRec."QD - 3" + xRec."QD - 4" + xRec."QD - 5" + xRec."QD - 6";
                    end;
                }
                field("QS - 1"; Rec."QS - 1")
                {
                }
                field("QS - 2"; Rec."QS - 2")
                {
                }
                field("QS - 3"; Rec."QS - 3")
                {
                }
                field("QS - 4"; Rec."QS - 4")
                {
                }
                field("QS - 5"; Rec."QS - 5")
                {
                }
                field("QS - 6"; Rec."QS - 6")
                {
                }
                field("QS - 7"; Rec."QS - 7")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("QS - 8"; Rec."QS - 8")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("QS - 9"; Rec."QS - 9")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("QS - 10"; Rec."QS - 10")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("QS - 11"; Rec."QS - 11")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("QS - 12"; Rec."QS - 12")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("SOQ (Supplied)"; Rec."SOQ (Supplied)")
                {
                }
                field("Average Supplied"; Rec."Average Supplied")
                {
                }
                field("MIP(Supplied)"; Rec."MIP(Supplied)")
                {
                }
                field("LQ - 1"; Rec."LQ - 1")
                {
                }
                field("LQ - 2"; Rec."LQ - 2")
                {
                }
                field("LQ - 3"; Rec."LQ - 3")
                {
                }
                field("LQ - 4"; Rec."LQ - 4")
                {
                }
                field("LQ - 5"; Rec."LQ - 5")
                {
                }
                field("LQ - 6"; Rec."LQ - 6")
                {
                }
                field("LQ - 7"; Rec."LQ - 7")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("LQ - 8"; Rec."LQ - 8")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("LQ - 9"; Rec."LQ - 9")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("LQ - 10"; Rec."LQ - 10")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("LQ - 11"; Rec."LQ - 11")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("LQ - 12"; Rec."LQ - 12")
                {
                    DecimalPlaces = 0 : 0;
                }
                field("Average Demand"; Rec."Average Demand")
                {
                }
                field("Average Lost Sales"; Rec."Average Lost Sales")
                {
                }
                field("Order BackGround"; Rec."Order BackGround")
                {
                }
                field("Order No."; Rec."Order No.")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Generate Purchase Order")
            {
                Caption = '&Generate Purchase Order';
                action("&Update Order Bases")
                {
                    Caption = '&Update Order Bases';

                    trigger OnAction()
                    begin
                        Rec.SwitchOrder;
                    end;
                }
                action("&Create Purchase Order")
                {
                    Caption = '&Create Purchase Order';

                    trigger OnAction()
                    begin
                        Rec.CreateOrder;
                    end;
                }
            }
        }
        area(processing)
        {
            action("&Branch Stock Management")
            {
                Caption = '&Branch Stock Management';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report 50179;
            }
            action("Update &Stock Record")
            {
                Caption = 'Update &Stock Record';
                Promoted = true;
                PromotedCategory = Process;
                //RunObject = Report 50140;
            }
            action("Generate &DOS for New Items")
            {
                Caption = 'Generate &DOS for New Items';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report 50122;
            }
        }
    }
}

