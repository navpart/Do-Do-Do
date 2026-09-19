page 90048 AddVehicleToCustomerFleetAPI
{
    PageType = List;
    SourceTable = "Service Item";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Model; Rec.Make)
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Chasis No."; Rec."Chasis No.")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Model Year"; Rec."Model Year")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Assigned User Name"; Rec."Assigned User Name")
                {
                }
                field("Assigned User Email"; Rec."Assigned User Email")
                {
                }
                field("Contact Designation"; Rec."Contact Designation")
                {
                }
                field("Customer Phone No."; Rec."Customer Phone No.")
                {
                }
                field(Colour; Rec.Colour)
                {
                }
                field(NickName; Rec.NickName)
                {
                }
            }
        }
    }

    actions
    {
    }
}

