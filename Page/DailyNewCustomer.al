page 60008 "Daily New Customer"
{
    ApplicationArea = All;
    Caption = 'Daily New Customer';
    PageType = List;
    SourceTable = Customer;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Name"; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Customer Created Date"; Rec."Customer Created Date")
                {
                    ApplicationArea = All;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Type2"; Rec."Customer Type2")
                {
                    ApplicationArea = All;
                }
                field("Address"; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field("Customer Phone No."; Rec."Customer Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Email"; Rec."Customer Email")
                {
                    ApplicationArea = All;
                }
                field("Contact"; Rec.Contact)
                {
                    ApplicationArea = All;
                }
                field("Contact Designation"; Rec."Contact Designation")
                {
                    ApplicationArea = All;
                }
                field("Assigned User Name"; Rec."Assigned User Name")
                {
                    ApplicationArea = All;
                }
                field("Assigned User No."; Rec."Assigned User No.")
                {
                    ApplicationArea = All;
                }
                field("Assigned User Email"; Rec."Assigned User Email")
                {
                    ApplicationArea = All;
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Username"; Rec.Username)
                {
                    ApplicationArea = All;
                }
                field("Password"; Rec.Password)
                {
                    ApplicationArea = All;
                }
                field("Customer Type"; Rec."Customer Type")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnFindRecord(Which: Text): Boolean
    begin
        Rec.FilterGroup(2);
        Rec.SetRange("Customer Created Date", Today);
        Rec.FilterGroup(0);
        exit(Rec.Find(Which));
    end;
}
