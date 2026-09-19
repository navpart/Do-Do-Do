page 50356 "Parts Reserved Line"
{
    Caption = 'Service Line List';
    DataCaptionFields = "Fault Reason Code";
    PageType = Card;
    SourceTable = "Service Line";
    SourceTableView = WHERE("Confirmed (Parts)" = filter(true));
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("No."; Rec."No.")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                    Visible = false;
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                }
                field("Job No."; Rec."Job No.")
                {
                    Visible = false;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    Visible = false;
                }
                field("Job Line Type"; Rec."Job Line Type")
                {
                    Visible = false;
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Qty. to Ship"; Rec."Qty. to Ship")
                {
                }
                field("Quantity Shipped"; Rec."Quantity Shipped")
                {
                }
                field("Confirmed (Service)"; Rec."Confirmed (Service)")
                {
                }
                field("Confirmed by (S)"; Rec."Confirmed by (S)")
                {
                }
                field("Confirmed (Parts)"; Rec."Confirmed (Parts)")
                {
                }
                field("Confirmed by (P)"; Rec."Confirmed by (P)")
                {
                }
                field("Quantity (Base)"; Rec."Quantity (Base)")
                {
                }
                field("Outstanding Qty. (Base)"; Rec."Outstanding Qty. (Base)")
                {
                }
                field("Line Amount"; Rec."Line Amount")
                {
                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                }
                field("Line Discount Type"; Rec."Line Discount Type")
                {
                }
                field("Spare Part Action"; Rec."Spare Part Action")
                {
                    Visible = false;
                }
                field("Fault Reason Code"; Rec."Fault Reason Code")
                {
                    Visible = false;
                }
                field("Exclude Warranty"; Rec."Exclude Warranty")
                {
                }
                field(Warranty; Rec.Warranty)
                {
                }
                field("Contract No."; Rec."Contract No.")
                {
                }
                field("Service Item Line No."; Rec."Service Item Line No.")
                {
                }
                field("Service Item No."; Rec."Service Item No.")
                {
                }
                field("Service Item Serial No."; Rec."Service Item Serial No.")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
            }
        }
    }

    var
        ServHeader: Record 5900;
}

