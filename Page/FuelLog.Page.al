page 50475 "Fuel Log"
{
    PageType = List;
    SourceTable = "Fuel";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Fuel Type"; Rec."Fuel Type")
                {
                }
                field("Registration No."; rec."Registration No.")
                {
                }
                field(Quantity; rec.Quantity)
                {
                }
                field(Date; Rec.Date)
                {
                }
            }
        }
    }

    actions
    {
    }
}

