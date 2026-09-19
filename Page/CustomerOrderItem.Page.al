page 50241 "Customer Order Item"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Customer Order Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Customer Class"; Rec."Customer Class")
                {
                }
                field("Additional Jobs"; Rec."Additional Jobs")
                {
                }
                field("Job Category"; Rec."Job Category")
                {
                }
                field("Job Type"; Rec."Job Type")
                {
                }
                field("Line Type"; Rec."Line Type")
                {
                }
                field("No."; Rec."No.")
                {
                    Importance = Promoted;
                }
                field(Description; Rec.Description)
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    Editable = false;
                }
                field("Available Quantity"; Rec."Available Quantity")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    Editable = "Unit CostEditable";
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Amount Inc. VAT"; Rec."Amount Inc. VAT")
                {
                }
                field("For Sublet"; Rec."For Sublet")
                {
                }
                field("Sublet Code"; Rec."Sublet Code")
                {
                }
                field("Sublet to"; Rec."Sublet to")
                {
                }
                field("Sublet Order No."; Rec."Sublet Order No.")
                {
                    Editable = false;
                }
                field("Sublet Line No."; Rec."Sublet Line No.")
                {
                    Editable = false;
                }
                field("Stock Status"; Rec."Stock Status")
                {
                }
                field("PR Raised"; Rec."PR Raised")
                {
                }
                field("On Part Order"; Rec."On Part Order")
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Operation Code"; Rec."Operation Code")
                {
                }
                field("Model Description"; Rec."Model Description")
                {
                }
                field(Variant; Rec.Variant)
                {
                    Visible = false;
                }
                field("Vat Amount"; Rec."Vat Amount")
                {
                }
                field(Difference; Rec.Difference)
                {
                }
                field(Stock; Rec.Stock)
                {
                }
                field(EDA; Rec.EDA)
                {
                }
                field(ETA; Rec.ETA)
                {
                }
                field("Part Collected"; Rec."Part Collected")
                {
                }
                field("Service Order"; Rec."Service Order")
                {
                }
                field("Duration in Hrs"; Rec."Duration in Hrs")
                {
                }
                field("Dealer Hourly Rate"; Rec."Dealer Hourly Rate")
                {
                }
                field("Flat Rate"; Rec."Flat Rate")
                {
                }
                field("FR Amount"; Rec."FR Amount")
                {
                }
                field("FR VAT Amount"; Rec."FR VAT Amount")
                {
                }
                field("FR Amount Inc VAT"; Rec."FR Amount Inc VAT")
                {
                }
                field(Confirmed; Rec.Confirmed)
                {
                }
                field("Confirmed by"; Rec."Confirmed by")
                {
                }
                field("Bin/Shelf No."; Rec."Bin/Shelf No.")
                {
                }
                field("Customer Order Form No."; Rec."Customer Order Form No.")
                {
                    Visible = false;
                }
                field(Discount; Rec.Discount)
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
        xRec := Rec;
        IF Rec."No." = 'SUBLET' THEN
            "Unit CostEditable" := TRUE ELSE
            "Unit CostEditable" := FALSE;
    end;


    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        xRec := Rec;
        IF Rec."No." = 'SUBLET' THEN
            "Unit CostEditable" := TRUE ELSE
            "Unit CostEditable" := FALSE;
    end;

    var
        "Unit CostEditable": Boolean;


}

