page 50180 "Dealer Vehicle Allocation Sub"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = Card;
    SourceTable = "Vehicle Mth. Allocation Line";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.")
                {
                }
                field("Allocation Code"; Rec."Allocation Code")
                {
                }
                field(Invoiced; Rec.Invoiced)
                {
                }
                field("Picked Not Invoice"; Rec."Picked Not Invoice")
                {
                }
                field("Quantity Invoiced"; Rec."Quantity Invoiced")
                {
                }
                field(Tracking; Rec.Tracking)
                {
                }
                field("Serial No."; Rec."Serial No.")
                {
                    Editable = false;
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Line No."; Rec."Line No.")
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Seat Option"; Rec."Seat Option")
                {
                }
                field(Transimision; Rec.Transimision)
                {
                }
                field("A/C"; Rec."A/C")
                {
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                }
                field(Body; Rec.Body)
                {
                }
                field(Type; Rec.Type)
                {
                }
                field(Rim; Rec.Rim)
                {
                }
                field(Location; Rec.Location)
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field(Variant; Rec.Variant)
                {
                }
                field("Chasis No."; Rec."Chasis No.")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Key No."; Rec."Key No.")
                {
                    Editable = false;
                }
                field(Colour; Rec.Colour)
                {
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Selected; Rec.Selected)
                {
                }
                field("Date Selected"; Rec."Date Selected")
                {
                }
                field(Released; Rec.Released)
                {
                }
                field("Date Released"; Rec."Date Released")
                {
                }
                field("Released By"; Rec."Released By")
                {
                }
                field(Picked; Rec.Picked)
                {
                }
                field("Date Picked"; Rec."Date Picked")
                {
                }
                field("Picked by"; Rec."Picked by")
                {
                }
                field("Latest Picking Date"; Rec."Latest Picking Date")
                {
                }
                field("Driver Name"; Rec."Driver Name")
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
    }
}

