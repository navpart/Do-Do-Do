namespace AL_TNL.AL_TNL;

using Microsoft.Service.Document;

pageextension 50030 "Service Invoice Ext" extends "Service Invoice"
{
    layout
    {
        addafter("Assigned User ID")
        {
            field("Customer Order No."; Rec."Customer Order No.")
            {
                ApplicationArea = All;
            }
            field("Registration No."; Rec."Registration No.")
            {
                ApplicationArea = All;
            }
            field("Total Line Amount"; Rec."Total Line Amount")
            {
                ApplicationArea = All;
            }
            field("Total Line Amount Incl. (VAT)"; Rec."Total Line Amount Incl. (VAT)")
            {
                ApplicationArea = All;
            }
            field("Total VAT Amount"; Rec."Total VAT Amount")
            {
                ApplicationArea = All;
            }
            field("Total Discount Amount"; Rec."Total Discount Amount")
            {
                ApplicationArea = All;
            }
            field("Total Labour Cost"; Rec."Total Labour Cost")
            {
                ApplicationArea = All;
            }
            field("Allow Posting"; Rec."Allow Posting")
            {
                ApplicationArea = All;
            }
            field("Allowed By"; Rec."Allowed By")
            {
                ApplicationArea = All;
            }

        }
    }
}
