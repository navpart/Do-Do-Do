pageextension 50082 "Service Item Card Ext" extends "Service Item Card"
{
    layout
    {
        addlast(Customer)
        {
            field("Customer Phone No."; Rec."Customer Phone No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the customer phone number.';
            }
            field("Customer Email"; Rec."Customer Email")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the customer email address.';
            }
            field("Customer Posting Group"; Rec."Customer Posting Group")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the customer posting group.';
            }
        }

        addafter(General)
        {
            group("Vehicle Information")
            {
                Caption = 'Vehicle Information';

                field(Make; Rec.Make)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the make of the vehicle.';
                }
                field("Model No."; Rec."Model No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the model number of the vehicle.';
                }
                field("Model Year"; Rec."Model Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the model year of the vehicle.';
                }
                field("Vehicle Brand"; Rec."Vehicle Brand")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vehicle brand.';
                }
                field(Colour; Rec.Colour)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the colour of the vehicle.';
                }
                field(NickName; Rec.NickName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the nickname of the vehicle.';
                }
                field("Vehicle Classification"; Rec."Vehicle Classification")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vehicle classification.';
                }
            }

            group("Identification Numbers")
            {
                Caption = 'Identification Numbers';

                field("Chasis No."; Rec."Chasis No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the chassis number (VIN) of the vehicle.';
                }
                field("Engine No."; Rec."Engine No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the engine number of the vehicle.';
                }
                field("New Reg. No"; Rec."New Reg. No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the new registration number of the vehicle.';
                }
                field(VMI; Rec.VMI)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Vehicle Manufacturer Identifier (first 3 characters of VIN).';
                }
                field(VDS; Rec.VDS)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Vehicle Descriptor Section (characters 4-9 of VIN).';
                }
                field(VIS; Rec.VIS)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Vehicle Identifier Section (characters 10-17 of VIN).';
                }
            }

            group("User Contact Information")
            {
                Caption = 'User Contact Information';

                field("User No."; Rec."User No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user contact number.';
                }
                field("User Person"; Rec."User Person")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user person name.';
                }
                field(Business; Rec.Business)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the business phone number.';
                }
                field(Mobile; Rec.Mobile)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the mobile phone number.';
                }
                field("User Email"; Rec."User Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user email address.';
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
                field("Assigned User No."; Rec."Assigned User No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the assigned user number.';
                }
                field("Contact Designation"; Rec."Contact Designation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contact designation.';
                }
            }

            group("Status Information")
            {
                Caption = 'Status Information';

                field("Service Item Status"; Rec."Service Item Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the service item is active or inactive.';
                }
                field("Service Item Inactive Date"; Rec."Service Item Inactive Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the service item became inactive.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user ID.';
                }
            }
        }
    }
}
