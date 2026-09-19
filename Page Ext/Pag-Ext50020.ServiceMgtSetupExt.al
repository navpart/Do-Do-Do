pageextension 50020 "Service Mgt. Setup Ext" extends "Service Mgt. Setup"
{
    layout
    {
        addafter("Prepaid Posting Document Nos.")
        {
            group(Others)
            {
                field("Complaint No."; Rec."Complaint No.")
                {
                    ApplicationArea = All;
                }
                field("VRI Code"; Rec."VRI Code")
                {
                    ApplicationArea = All;
                }
                field("Logistic Nos."; Rec."Logistic Nos.")
                {
                    ApplicationArea = All;
                }
                field("Parts Order Isolo"; Rec."Parts Order Isolo")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Parts Order Isolo CC"; Rec."Parts Order Isolo CC")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Parts Arrival Isolo"; Rec."Parts Arrival Isolo")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Parts Arrival Isolo CC"; Rec."Parts Arrival Isolo CC")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Parts Order Lekki"; Rec."Parts Order Lekki")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Parts Order Lekki CC"; Rec."Parts Order Lekki CC")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Parts Arrival Lekki"; Rec."Parts Arrival Lekki")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Parts Arrival Lekki CC"; Rec."Parts Arrival Lekki CC")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }

            }
        }
    }
}
