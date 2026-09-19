page 50177 "Parts By Model List"
{
    ApplicationArea = All;
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Parts By Model";
    SourceTableView = SORTING("Model Code", "Part No.");

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Model Code"; Rec."Model Code")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Part No."; Rec."Part No.")
                {
                }
                field("Part Description"; Rec."Part Description")
                {
                }
                field(TotalSale; Rec.Inv)
                {
                    Caption = 'Total 12 Month Sales';
                    DecimalPlaces = 0 : 0;
                    Visible = TotalSaleVisible;
                }
                field(Avsales; Rec.Avesale)
                {
                    Caption = 'Average Sales of 12 Months';
                    DecimalPlaces = 0 : 0;
                    Visible = AvsalesVisible;
                }
                field("Q'ty On Hand"; Rec."Q'ty On Hand")
                {
                }
                field("Q'ty On Purchase Order"; Rec."Q'ty On Purchase Order")
                {
                }
                field("Q'ty On Sales Order"; Rec."Q'ty On Sales Order")
                {
                }
                field("Lost Sales Q'ty"; Rec."Lost Sales Q'ty")
                {
                }
                field("Part Category"; Rec."Part Category")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnClosePage()
    begin
        AvsalesVisible := FALSE;
        TotalSaleVisible := FALSE;
    end;

    trigger OnOpenPage()
    begin
        AvsalesVisible := FALSE;
        TotalSaleVisible := FALSE;
    end;

    var
        AvsalesVisible: Boolean;
        TotalSaleVisible: Boolean;
}

