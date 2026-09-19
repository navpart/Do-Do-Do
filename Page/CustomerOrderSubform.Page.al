page 80007 "Customer Order Subform"
{
    ApplicationArea = All;
    AutoSplitKey = true;
    Caption = 'Parts and Labour';
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Customer Order LineX";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Customer Class"; Rec."Customer Class")
                {
                }
                field("Additional Jobs"; Rec."Additional Jobs")
                {
                }
                field("Job Type"; Rec."Job Type")
                {
                }
                field("Sent to Parts"; Rec."Sent to Parts")
                {
                    Editable = false;
                }
                field("Part Collected"; Rec."Part Collected")
                {
                }
                field("Job Category"; Rec."Job Category")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("No."; Rec."No.")
                {
                    Importance = Promoted;
                }
                field(Description; Rec.Description)
                {
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    Visible = true;
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                }
                field("Quantity Available"; Rec."Quantity Available")
                {
                }
                field("Quantity Requested"; Rec."Quantity Requested")
                {
                }
                field("Skip Zero Qty"; Rec."Skip Zero Qty")
                {
                }
                field("Labour Hour"; Rec."Labour Hour")
                {
                }
                field("Quantity Received"; Rec."Quantity Received")
                {
                    Editable = true;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    Editable = "Unit CostEditable";
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field("Discount %"; Rec."Discount %")
                {
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Amount Inc. VAT"; Rec."Amount Inc. VAT")
                {
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
                field("VAT Category"; Rec."VAT Category")
                {
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    Editable = false;
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
                /*  field("Shipment Status"; Rec."Shipment Status")
                 {
                 }
                 field(Reason; Rec.Reason)
                 {
                 } */
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
                field("Document No."; Rec."Document No.")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(GetSubstitute)
            {
                Caption = 'Get Substitute';
                Image = Replan;

                trigger OnAction()
                begin
                    ItemSubstitution.SETRANGE("No.", Rec."No.");
                    ItemSubstitution.SETRANGE("Variant Code", Rec."Variant Code");

                    IF PAGE.RUNMODAL(5718, ItemSubstitution) = ACTION::LookupOK THEN BEGIN
                        Rec.VALIDATE("No.", ItemSubstitution."Substitute No.");
                        Rec.VALIDATE("Variant Code", ItemSubstitution."Variant Code");
                        Rec.MODIFY;
                    END;
                end;
            }
        }
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

        "Unit CostEditable": Boolean;
        AfterDiscount: Decimal;
        ItemSubstitution: Record 5715;

    local procedure CustOnAfterGetCurrRecord()
    begin
        xRec := Rec;
        IF Rec."No." = 'SUBLET' THEN
            "Unit CostEditable" := TRUE ELSE
            "Unit CostEditable" := FALSE;
    end;
}

