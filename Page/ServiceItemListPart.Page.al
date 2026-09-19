page 50190 "Service Item ListPart"
{
    PageType = ListPart;
    SourceTable = "Service Item";
    ApplicationArea = All;
    Caption = 'Service Items';

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the service item number.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the service item.';
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the make of the service item.';
                }
                field("Model No."; Rec."Model No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the model number.';
                }
                field("Model Year"; Rec."Model Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the model year.';
                }
                field("Chasis No."; Rec."Chasis No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the chassis number.';
                }
                field("Engine No."; Rec."Engine No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the engine number.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the serial number of the service item.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer number.';
                }
                
                field("Vehicle Brand"; Rec."Vehicle Brand")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vehicle brand.';
                }
                field("Assigned User Name"; Rec."Assigned User Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the assigned user name.';
                }
                field("Assigned User Email"; Rec."Assigned User Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the assigned user email.';
                }
            }
        }
    }
}
