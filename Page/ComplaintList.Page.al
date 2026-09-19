page 70171 "Complaint List"
{
    CardPageID = "Complaint Card";
    PageType = List;
    SourceTable = "CRM Register";
    SourceTableView = WHERE("Type of Call" = CONST(Complain));
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
                field(Date; Rec.Date)
                {
                }
                field("Date Matter Occured"; Rec."Date Matter Occured")
                {
                }
                field("Nature of Complain"; Rec."Nature of Complain")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Customer Email"; Rec."Customer Email")
                {
                }
                field("Customer Phone"; Rec."Customer Phone")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Dealer's Name"; Rec."Dealer's Name")
                {
                }
                field("Type of Call"; Rec."Type of Call")
                {
                }
                field("Dealer's No"; Rec."Dealer's No")
                {
                }
                field("Enquiry Type"; Rec."Enquiry Type")
                {
                }
            }
        }
    }

    actions
    {
    }
}

