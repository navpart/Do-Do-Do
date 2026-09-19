page 50187 "Vehicle Mth All. Line List"
{
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Vehicle Mth. Allocation Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Allocation Code"; Rec."Allocation Code")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Chasis No."; Rec."Chasis No.")
                {
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
                field(Released; Rec.Released)
                {
                }
                field("Date Released"; Rec."Date Released")
                {
                }
                field("Released By"; Rec."Released By")
                {
                }
                field("Driver Name"; Rec."Driver Name")
                {
                }
                field("Order No."; Rec."Order No.")
                {
                }
                field(Variant; Rec.Variant)
                {
                }
                field("Seat Option"; Rec."Seat Option")
                {
                }
                field(Transimision; Rec.Transimision)
                {
                }
                field(Location; Rec.Location)
                {
                }
                field(Selected; Rec.Selected)
                {
                }
                field("Date Selected"; Rec."Date Selected")
                {
                }
                field("A/C"; Rec."A/C")
                {
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Key No."; Rec."Key No.")
                {
                }
                field("Colour Description"; Rec."Colour Description")
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
                field(Body; Rec.Body)
                {
                }
                field(Type; Rec.Type)
                {
                }
                field(Rim; Rec.Rim)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LOOKUPMODE := TRUE;
    end;
}

