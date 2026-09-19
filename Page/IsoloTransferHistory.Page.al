page 70511 "Isolo Transfer History"
{
    Editable = false;
    PageType = List;
    SourceTable = "Transfer Shipment Line";
    SourceTableView = WHERE("Transfer-from Code" = FILTER('120ISO'),
                            "Transfer-to Code" = FILTER('150ISOLO'));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                }
                field("Transfer-from Code"; Rec."Transfer-from Code")
                {
                }
                field("Transfer-to Code"; Rec."Transfer-to Code")
                {
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                }
                field("Unit Cost"; "Unit Cost")
                {
                }
                field("COF No."; "COF No.")
                {
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        IF Item.GET(Rec."Item No.") THEN
            "Unit Cost" := Item."Unit Cost";

        //IF COL.GET(xRec."Item No.") THEN
        //   "COF No." := COL."Document No.";
    end;

    var
        "Unit Cost": Decimal;
        Item: Record 27;
        "COF No.": Code[20];
        COL: Record "Customer Order LineX";
}

