page 50283 "Inventory - Stock"
{
    PageType = List;
    SourceTable = "Item Ledger Entry";
    SourceTableView = WHERE("Remaining Quantity" = FILTER('1'),
                            "Inventory Posting Group" = FILTER('N_CARS'));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    Editable = false;
                }
                field("Item No."; Rec."Item No.")
                {
                    Editable = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    Editable = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                    Width = 50;
                }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                    Editable = false;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    Editable = false;
                    Width = 30;
                }
                field("Exterior Colour Name"; Rec."Exterior Colour Name")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                    Editable = false;
                    Width = 20;
                }
                field("Item Name"; Rec."Item Name")
                {
                    Editable = false;
                }
                /*     field("Date of Arrival"; Rec."Date of Arrival")
                    {
                    }
                    field("No. of Days in Stock"; "No. of Days in Stock")
                    {
                    }
                    field("Current Date"; "Current Date")
                    {

                        trigger OnValidate()
                        begin
                            "No. of Days in Stock" := "Current Date" - "Date of Arrival";
                        end;
                    } */
            }
        }
    }

    actions
    {
    }

    /*  trigger OnAfterGetRecord()
     begin
         IF Rec."Current Date" <> 0D THEN
             VALIDATE("Current Date", WORKDATE);
     end; */
}

