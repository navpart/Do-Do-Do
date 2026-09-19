page 50371 "Complain List"
{
    ApplicationArea = All;
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    //CardPageId = 
    SourceTable = "Complain Table";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Complain Code"; Rec."Complain Code")
                {
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                }
                field("Vendor Code"; Rec."Vendor Code")
                {
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                }
                field("Purchase Date"; Rec."Purchase Date")
                {
                }
                field("Model Category"; Rec."Model Category")
                {
                }
                field(Complaint; Rec.Complaint)
                {
                }
                field(Complaint1; Rec.Complaint1)
                {
                }
                field("Date of Request to TNL"; Rec."Date of Request to TNL")
                {
                }
                field("Date of TNL Reply to Dealer"; Rec."Date of TNL Reply to Dealer")
                {
                }
                field("Vehicle Category"; Rec."Vehicle Category")
                {
                }
                field("Customer's Satisfaction"; Rec."Customer's Satisfaction")
                {
                }
                field(Reason; Rec.Reason)
                {
                }
                field("Date Closed"; Rec."Date Closed")
                {
                }
                field("Operation Area Problem"; Rec."Operation Area Problem")
                {
                }
                field("Preventive Measures"; Rec."Preventive Measures")
                {
                }
                field("Preventive Measures 2"; Rec."Preventive Measures 2")
                {
                }
                field("COF No."; Rec."COF No.")
                {
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                }
                field("Job Details"; Rec."Job Details")
                {
                }
                field("Job Details1"; Rec."Job Details1")
                {
                }
                field("COF Date"; Rec."COF Date")
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Model Year"; Rec."Model Year")
                {
                }
                field("Registered Date"; Rec."Registered Date")
                {
                }
            }
        }
    }

    /* actions
    {
        area(navigation)
        {
            group("Customer Complain")
            {
                Caption = 'Customer Complain';
                action(Card)
                {
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = Page "Complaint Card";
                    ShortCutKey = 'Shift+F7';
                }
            }
        }
    } */
}

