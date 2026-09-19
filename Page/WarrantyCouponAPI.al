namespace AL_TNL.AL_TNL;

page 50100 WarrantyCouponAPI
{
    ApplicationArea = All;
    Caption = 'WarrantyCouponAPI';
    PageType = List;
    SourceTable = "Warranty Coupon";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.', Comment = '%';
                }
                field("Chassis Number"; Rec."Chassis Number")
                {
                    ToolTip = 'Specifies the value of the Chassis Number field.', Comment = '%';
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.', Comment = '%';
                }
                field(Colour; Rec.Colour)
                {
                    ToolTip = 'Specifies the value of the Colour field.', Comment = '%';
                }
                field(Consignee; Rec.Consignee)
                {
                    ToolTip = 'Specifies the value of the Consignee field.', Comment = '%';
                }
                field("Contact Persons"; Rec."Contact Persons")
                {
                    ToolTip = 'Specifies the value of the Contact Persons field.', Comment = '%';
                }
                field("Dealer's Name"; Rec."Dealer's Name")
                {
                    ToolTip = 'Specifies the value of the Dealer''s Name field.', Comment = '%';
                }
                field("Dealer's No."; Rec."Dealer's No.")
                {
                    ToolTip = 'Specifies the value of the Dealer''s No. field.', Comment = '%';
                }
                field("Delay Days"; Rec."Delay Days")
                {
                    ToolTip = 'Specifies the value of the Delay Days field.', Comment = '%';
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                    ToolTip = 'Specifies the value of the Delivery Date field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Document Code"; Rec."Document Code")
                {
                    ToolTip = 'Specifies the value of the Document Code field.', Comment = '%';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ToolTip = 'Specifies the value of the Driver Name field.', Comment = '%';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ToolTip = 'Specifies the value of the E-Mail field.', Comment = '%';
                }
                field("Engine  Number"; Rec."Engine  Number")
                {
                    ToolTip = 'Specifies the value of the Engine  Number field.', Comment = '%';
                }
                field("Expected Warranty Expired Date"; Rec."Expected Warranty Expired Date")
                {
                    ToolTip = 'Specifies the value of the Expected Warranty Expired Date field.', Comment = '%';
                }
                field("Expected Warranty Expired KM"; Rec."Expected Warranty Expired KM")
                {
                    ToolTip = 'Specifies the value of the Expected Warranty Expired KM field.', Comment = '%';
                }
                field("Fax Line"; Rec."Fax Line")
                {
                    ToolTip = 'Specifies the value of the Fax Line field.', Comment = '%';
                }
                field("Home-Page"; Rec."Home-Page")
                {
                    ToolTip = 'Specifies the value of the Home-Page field.', Comment = '%';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field("Ledger No."; Rec."Ledger No.")
                {
                    ToolTip = 'Specifies the value of the Ledger No. field.', Comment = '%';
                }
                field("Mobile Phone"; Rec."Mobile Phone")
                {
                    ToolTip = 'Specifies the value of the Mobile Phone field.', Comment = '%';
                }
                field("Mode Name"; Rec."Mode Name")
                {
                    ToolTip = 'Specifies the value of the Mode Name field.', Comment = '%';
                }
                field("Model Name"; Rec."Model Name")
                {
                    ToolTip = 'Specifies the value of the Model Name field.', Comment = '%';
                }
                field("Model No."; Rec."Model No.")
                {
                    ToolTip = 'Specifies the value of the Model No. field.', Comment = '%';
                }
                field("Owner Age"; Rec."Owner Age")
                {
                    ToolTip = 'Specifies the value of the Owner Age field.', Comment = '%';
                }
                field("Owner Sex"; Rec."Owner Sex")
                {
                    ToolTip = 'Specifies the value of the Owner Sex field.', Comment = '%';
                }
                field("Owner Status"; Rec."Owner Status")
                {
                    ToolTip = 'Specifies the value of the Owner Status field.', Comment = '%';
                }
                field("Owner Type"; Rec."Owner Type")
                {
                    ToolTip = 'Specifies the value of the Owner Type field.', Comment = '%';
                }
                field("Owner's Name"; Rec."Owner's Name")
                {
                    ToolTip = 'Specifies the value of the Owner''s Name field.', Comment = '%';
                }
                field("Owners Type"; Rec."Owners Type")
                {
                    ToolTip = 'Specifies the value of the Owners Type field.', Comment = '%';
                }
                field(Phone; Rec.Phone)
                {
                    ToolTip = 'Specifies the value of the Phone field.', Comment = '%';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ToolTip = 'Specifies the value of the Post Code field.', Comment = '%';
                }
                field(State; Rec.State)
                {
                    ToolTip = 'Specifies the value of the State field.', Comment = '%';
                }
                field(VDS; Rec.VDS)
                {
                    ToolTip = 'Specifies the value of the VDS field.', Comment = '%';
                }
                field(VIN; Rec.VIN)
                {
                    ToolTip = 'Specifies the value of the VIN field.', Comment = '%';
                }
                field(VIS; Rec.VIS)
                {
                    ToolTip = 'Specifies the value of the VIS field.', Comment = '%';
                }
                field("Vehicle Group"; Rec."Vehicle Group")
                {
                    ToolTip = 'Specifies the value of the Vehicle Group field.', Comment = '%';
                }
                field(WMI; Rec.WMI)
                {
                    ToolTip = 'Specifies the value of the WMI field.', Comment = '%';
                }
                field("Warranty Cop Rec. Date"; Rec."Warranty Cop Rec. Date")
                {
                    ToolTip = 'Specifies the value of the Warranty Cop Rec. Date field.', Comment = '%';
                }
            }
        }
    }
}
