page 50598 "Pool Car Availability Subform"
{
    ApplicationArea = All;
    Editable = false;
    PageType = ListPart;
    SourceTable = "Pool Car Availability";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Registration No."; Rec."Registration No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Driver Name"; Rec."Driver Name")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Check Availability")
            {
                Image = Check;

                trigger OnAction()
                begin
                    Rec.CheckAvailability;
                end;
            }
        }
    }
}

