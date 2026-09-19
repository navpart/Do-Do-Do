page 70048 "Warranty Coupon2"
{
    ApplicationArea = All;
    DelayedInsert = true;
    PageType = List;
    PopulateAllFields = true;
    SourceTable = "Warranty Coupon";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(VIN; Rec.VIN)
                {
                }
                field(WMI; Rec.WMI)
                {
                }
                field(VDS; Rec.VDS)
                {
                }
                field(VIS; Rec.VIS)
                {
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                }
                field("Owner's Name"; Rec."Owner's Name")
                {
                }
                field("Mode Name"; Rec."Mode Name")
                {
                    Caption = '<Model Name>';
                }
                field(Address; Rec.Address)
                {
                }
                field(City; Rec.City)
                {
                }
                field(State; Rec.State)
                {
                }
                field(Colour; Rec.Colour)
                {
                }
                field("Post Code"; Rec."Post Code")
                {
                }
                field("Vehicle Group"; Rec."Vehicle Group")
                {
                }
                field("Original Speedometer Rep Date"; Rec."Original Speedometer Rep Date")
                {
                }
                field("Original Speedometer Rep at"; Rec."Original Speedometer Rep at")
                {
                }
                field("Dealer's No."; Rec."Dealer's No.")
                {
                }
                field("Dealer's Name"; Rec."Dealer's Name")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Document Code"; Rec."Document Code")
                {
                }
                field("Attach FTR"; Rec."Attach FTR")
                {
                }
                field("Attach TWC"; Rec."Attach TWC")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Owner Age"; Rec."Owner Age")
                {
                }
                field("Owner Sex"; Rec."Owner Sex")
                {
                }
                field("Owner Type"; Rec."Owner Type")
                {
                }
                field("Business Sector"; Rec."Business Sector")
                {
                }
                field("Contact Persons"; Rec."Contact Persons")
                {
                }
                field("Driver Name"; Rec."Driver Name")
                {
                }
                field("Mobile Phone"; Rec."Mobile Phone")
                {
                    Caption = 'Customer Name/Phone No.';
                }
                field(Phone; Rec.Phone)
                {
                    Caption = 'Customer Name/Phone No.';
                }
                field("Fax Line"; Rec."Fax Line")
                {
                }
                field("E-Mail"; Rec."E-Mail")
                {
                }
                field("Home-Page"; Rec."Home-Page")
                {
                }
                field(Consignee; Rec.Consignee)
                {
                }
                field("Speedometer Reading"; Rec."Speedometer Reading")
                {
                }
                field("Expected Warranty Expired KM"; Rec."Expected Warranty Expired KM")
                {
                }
                field("Expected Warranty Expired Date"; Rec."Expected Warranty Expired Date")
                {
                }
                field("Last School Attended"; Rec."Last School Attended")
                {
                }
                field("Ledger No."; Rec."Ledger No.")
                {
                }
                field("Warranty Cop Rec. Date"; Rec."Warranty Cop Rec. Date")
                {
                }
                field("Delay Days"; Rec."Delay Days")
                {
                }
                field("Chassis Number"; Rec."Chassis Number")
                {
                }
                field("Engine  Number"; Rec."Engine  Number")
                {
                }
                field("Owner Status"; Rec."Owner Status")
                {
                }
                field("Owners Type"; Rec."Owners Type")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

