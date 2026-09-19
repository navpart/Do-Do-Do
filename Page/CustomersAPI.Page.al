page 90047 CustomersAPI
{
    PageType = List;
    SourceTable = Customer;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer Type"; Rec."Customer Type")
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Customer Phone No."; Rec."Customer Phone No.")
                {
                }
                field("Customer Email"; Rec."Customer Email")
                {
                }
                field(Contact; Rec.Contact)
                {
                    Caption = 'Contact Name';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    Caption = 'Contact Phone No.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    Caption = 'Contact Email';
                }
                field("Contact Designation"; Rec."Contact Designation")
                {
                }
                field("Assigned User Name"; Rec."Assigned User Name")
                {
                }
                field("Assigned User No."; Rec."Assigned User No.")
                {
                }
                field("Assigned User Email"; Rec."Assigned User Email")
                {
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                }
                field(Username; Rec.Username)
                {
                }
                field(Password; Rec.Password)
                {
                }
            }
        }
    }

    actions
    {
    }
}

