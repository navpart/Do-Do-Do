page 50112 "Toyota Warranty Registration"
{
    ApplicationArea = All;
    DelayedInsert = true;
    PageType = Card;
    SourceTable = "Warranty Coupon";


    layout
    {
        area(content)
        {
            group("Toyota Warranty Registration")
            {
                Caption = 'Toyota Warranty Registration';
                field("Dealer's Name"; Rec."Dealer's Name")
                {
                }
                field("Dealer's No."; Rec."Dealer's No.")
                {
                }
                field(VIN; Rec.VIN)
                {
                    Caption = 'Vehicle Identification Number';
                }
                field(WMI; Rec.WMI)
                {
                }
                field("Owner's Name"; Rec."Owner's Name")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field(City; Rec.City)
                {
                }
                field("Original Speedometer Rep Date"; Rec."Original Speedometer Rep Date")
                {
                }
                field("Original Speedometer Rep at"; Rec."Original Speedometer Rep at")
                {
                }
                field("Warranty Cop Rec. Date"; Rec."Warranty Cop Rec. Date")
                {
                }
                field(VDS; Rec.VDS)
                {
                }
                field(State; Rec.State)
                {
                }
                field("Chassis Number"; Rec."Chassis Number")
                {
                    Editable = false;
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                }
                field(VIS; Rec.VIS)
                {
                }
                field("Post Code"; Rec."Post Code")
                {
                }
                field("Delay Days"; Rec."Delay Days")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                }
                field("Attach TWC"; Rec."Attach TWC")
                {
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                }
                field("Attach FTR"; Rec."Attach FTR")
                {
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                }
            }
            group("Owner Detail")
            {
                Caption = 'Owner Detail';
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
                }
                field(Phone; Rec.Phone)
                {
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
            }
        }
    }

    actions
    {
    }
}

