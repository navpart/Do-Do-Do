page 50332 "COF Job Instruction Item"
{
    AutoSplitKey = true;
    Caption = 'Job Instruction Lines';
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Customer Order Line";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer Class"; Rec."Customer Class")
                {
                }
                field("Additional Jobs"; Rec."Additional Jobs")
                {
                }
                field("Line Type"; Rec."Line Type")
                {
                }
                field("For Sublet"; Rec."For Sublet")
                {
                }
                field("Sublet Code"; Rec."Sublet Code")
                {
                }
                field("Job Type"; Rec."Job Type")
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
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
                field("PR Raised"; Rec."PR Raised")
                {
                }
                field("On Part Order"; Rec."On Part Order")
                {
                }
                field("Stock Status"; Rec."Stock Status")
                {
                }
                field(Results; Rec.Results)
                {
                }
                field("Sublet Order No."; Rec."Sublet Order No.")
                {
                }
                field("Sublet Line No."; Rec."Sublet Line No.")
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Description"; Rec."Model Description")
                {
                }
                field("Customer Order Form No."; Rec."Customer Order Form No.")
                {
                    Visible = false;
                }
                field("Operation Code"; Rec."Operation Code")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field(Variant; Rec.Variant)
                {
                    Visible = false;
                }
                field("Dealer Hourly Rate"; Rec."Dealer Hourly Rate")
                {
                }
                field("Duration in Hrs"; Rec."Duration in Hrs")
                {
                }
                field("Available Quantity"; Rec."Available Quantity")
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
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        CustOnAfterGetCurrRecord;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        CustOnAfterGetCurrRecord;
    end;

    var
        CustOrderLine: Record 50122;
        CustOrderRec: Record 50119;

        "Unit CostEditable": Boolean;

    local procedure CustOnAfterGetCurrRecord()
    begin
        xRec := Rec;
        IF Rec."No." = 'SUBLET' THEN
            "Unit CostEditable" := TRUE ELSE
            "Unit CostEditable" := FALSE;
    end;
}

