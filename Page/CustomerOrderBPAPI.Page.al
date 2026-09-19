page 90050 CustomerOrderBPAPI
{
    PageType = List;
    SourceTable = "Repair Order";
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
                field("Registration No."; Rec."Registration No.")
                {
                }
                field(VIN; Rec.VIN)
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Body Color"; Rec."Body Color")
                {
                }
                field("Model Year"; Rec."Model Year")
                {
                }
                field("SC/SSC Information"; Rec."SC/SSC Information")
                {
                }
                field("Insurance Co. Contacted"; Rec."Insurance Co. Contacted")
                {
                }
                field("Insurance Company"; Rec."Insurance Company")
                {
                }
                field("Policy Holder"; Rec."Policy Holder")
                {
                }
                field("Policy Type"; Rec."Policy Type")
                {
                }
                field("Policy No."; Rec."Policy No.")
                {
                }
                field("Policy Expiry"; Rec."Policy Expiry")
                {
                }
                field("Insured Amount"; Rec."Insured Amount")
                {
                }
                field("Telephone No."; Rec."Telephone No.")
                {
                }
                field(Excess; Rec.Excess)
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Mobile No."; Rec."Mobile No.")
                {
                }
                field(Picture1; Rec.Picture1)
                {
                }
                field(Picture2; Rec.Picture2)
                {
                }
                field(Picture3; Rec.Picture3)
                {
                }
                field(Picture4; Rec.Picture4)
                {
                }
                field("Body Work Details"; Rec."Body Work Details")
                {
                }
                field("BP Amount"; Rec."BP Amount")
                {
                }
                field("GR Amount"; Rec."GR Amount")
                {
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                }
                field("Expected Completion Date"; Rec."Expected Completion Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

