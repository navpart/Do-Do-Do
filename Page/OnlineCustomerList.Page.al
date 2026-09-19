page 50191 "Online Customer List"
{
    PageType = List;
    SourceTable = Customer;
    ApplicationArea = All;
    Caption = 'Online Customers';
    UsageCategory = Lists;
    CardPageId = "Online Customer Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer Type"; Rec."Customer Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of customer.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer number.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer name.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer address.';
                }
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
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = All;
                    Caption = 'Contact Name';
                    ToolTip = 'Specifies the contact person name.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    Caption = 'Contact Phone No.';
                    ToolTip = 'Specifies the contact phone number.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                    Caption = 'Contact Email';
                    ToolTip = 'Specifies the contact email address.';
                }
                field("Contact Designation"; Rec."Contact Designation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contact designation.';
                }
                field("Assigned User Name"; Rec."Assigned User Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the assigned user name.';
                }
                field("Assigned User No."; Rec."Assigned User No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the assigned user number.';
                }
                field("Assigned User Email"; Rec."Assigned User Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the assigned user email.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the general business posting group.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the VAT business posting group.';
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer posting group.';
                }
                field(Username; Rec.Username)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the username.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action("Service Items")
            {
                ApplicationArea = All;
                Caption = 'Service Items';
                Image = ServiceItem;
                RunObject = Page "Service Item ListPart";
                RunPageLink = "Customer No." = field("No.");
                ToolTip = 'View service items for this customer.';
            }
        }
    }
}
