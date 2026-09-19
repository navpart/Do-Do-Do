page 70173 "Enquiry List"
{
    CardPageID = "Enquiry Card";
    PageType = List;
    SourceTable = "CRM Register";
    SourceTableView = WHERE("Type of Call" = Filter('Enquiry'));
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
                field("Enquiry Date"; Rec."Enquiry Date")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Customer Phone"; Rec."Customer Phone")
                {
                }
                field("Customer Email"; Rec."Customer Email")
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

