page 50178 "Customer Mth Vehicle Request"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = Card;
    SourceTable = "Dealer Mth. Vehicle Request";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Production Month"; Rec."Production Month")
                {
                }
                field("Customer Code"; Rec."Customer Code")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field(Body; Rec.Body)
                {
                }
                field(Type; Rec.Type)
                {
                }
                field(Transmission; Rec.Transmission)
                {
                }
                field("A/C"; Rec."A/C")
                {
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                }
                field("Seat Options"; Rec."Seat Options")
                {
                }
                field(Rim; Rec.Rim)
                {
                }
                field(Colour; Rec.Colour)
                {
                }
                field("Colour Description"; Rec."Colour Description")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field(Approved; Rec.Approved)
                {
                }
                field("Approved By."; Rec."Approved By.")
                {
                }
                field(Allocated; Rec.Allocated)
                {
                }
                field("Chasis No."; Rec."Chasis No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

