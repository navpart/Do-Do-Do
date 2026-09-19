tableextension 50011 "Sales Line Ext" extends "Sales Line"
{
    fields
    {
        field(50000; "Search Code"; Code[20])
        {
            TableRelation = "Parts Enquiry"."Search Code" WHERE("Document No." = FIELD("Document No."));

        }
        field(50002; "Search Line"; Integer)
        {
            TableRelation = "Parts Enquiry"."Entry No" WHERE("Search Code" = FIELD("Search Code"));
        }
        field(50003; "Created Demand"; Boolean)
        {
        }
        field(50006; Colour; Code[30])
        {
            Editable = true;
            TableRelation = "Colour Codes"."Colour Code";
        }
        field(50013; "Exterior Colour Name"; Code[30])
        {
        }
        field(50203; "Prod.Gr."; Code[10])
        {
        }
        field(50204; BackOrderDate; Date)
        {
        }
        field(50205; "Sales Factor"; Decimal)
        {
            DecimalPlaces = 0 : 15;

            trigger OnValidate()
            begin
                VALIDATE("Unit Price", "ProForma FOB(YEN)" * "Sales Factor");
            end;
        }
        field(50206; "ProForma FOB(YEN)"; Decimal)
        {

            trigger OnValidate()
            begin
                VALIDATE("Unit Cost (LCY)", "ProForma FOB(YEN)" * "Cost Factor");
                VALIDATE("Unit Price", "ProForma FOB(YEN)" * "Sales Factor");
            end;
        }
        field(50207; "Cost Factor"; Decimal)
        {
            DecimalPlaces = 0 : 15;

            trigger OnValidate()
            begin
                VALIDATE("Unit Cost (LCY)", "ProForma FOB(YEN)" * "Cost Factor");
            end;
        }
        field(50208; "Chassis Number"; Code[30])
        {
            Editable = false;
        }
        field(50209; "Quantity Demanded"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50210; Degree; Code[10])
        {
        }
        field(50302; "Year of Production"; Code[10])
        {
        }
        field(50303; "Estimated Mileage"; Code[10])
        {
        }
        field(60100; "Original Purch Customer No."; Code[20])
        {
            Editable = false;
            TableRelation = Customer."No.";
        }
        field(60101; "Normal/Obsolote Stock"; Code[10])
        {
        }
        field(60102; "Part Group"; Code[10])
        {
        }
        field(60103; "Job Type"; Option)
        {
            OptionCaption = ' ,B&P,GR';
            OptionMembers = " ","B&P",GR;
        }
        field(60104; Accessory; Boolean)
        {
        }
        field(60105; "Shelf No."; Code[10])
        {
            TableRelation = Item."Shelf No.";
        }
        field(60106; "Discount Inc.Vat"; Decimal)
        {
        }
        field(60107; "Line Dis.Amt Inc Vat"; Decimal)
        {
        }
        field(60108; "Retail Cost"; Decimal)
        {

            trigger OnValidate()
            begin
                VALIDATE("Unit Price");
                "Retail Cost" := "Unit Price" - ("Unit Price" * 0.33);
            end;
        }
        field(60109; Contribution; Decimal)
        {

            trigger OnValidate()
            begin
                VALIDATE("Unit Price");
                Contribution := "Unit Price" * 0.33;
            end;
        }

        field(60110; "Document Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(60111; "Vehicle Picked"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60112; "Vehicle Released By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60113; "Vehicle Details Confirmed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60114; "Tracker No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60115; "Cancellation Reason"; Option)
        {
            OptionCaption = ' ,Invoice Cancellation,Purchase Reversal,Price Difference,Order Duplication,Defective Supply,Technical Issues, Delayed ETA, Others';
            OptionMembers = " ",InvoiceCancellation,PurchaseReversal,PriceDifference,OrderDuplication,DefectiveSupply,TechnicalIssues,DelayedETA,Others;
        }

        modify("Location Code")
        {
            trigger OnAfterValidate()

            begin

                IF Location.GET("Location Code") THEN
                    IF Location."With Accessory" THEN
                        Accessory := TRUE ELSE
                        Accessory := FALSE;

                IF Location.GET("Location Code") THEN
                    IF Location."VRI Location" = TRUE THEN
                        MESSAGE(VRIError);

                UserSetup.GET(USERID);
                IF ((Type = Type::Item) AND ("Posting Group" = 'N_CARS')) THEN BEGIN
                    IF Location.GET("Location Code") THEN BEGIN
                        IF (Location."Monitored Location" = TRUE) AND (UserSetup."Access to Monitor Location" = FALSE) THEN
                            ERROR(MonitorError)
                    end;
                end;
            end;

        }

        modify("Line Discount %")
        {
            trigger OnAfterValidate()

            begin
                if SalesHeader.get("Document Type"::Order, "Document No.") then begin
                    if SalesHeader.Locked then
                        Error('Please contact your system administrator!');
                end
            end;
        }
        modify("Line Discount Amount")
        {
            trigger OnAfterValidate()

            begin
                if SalesHeader.get("Document Type"::Order, "Document No.") then begin
                    if SalesHeader.Locked then
                        Error('Please contact your system administrator!');
                end
            end;

        }

        modify("Line Amount")
        {
            trigger OnAfterValidate()

            begin
                if SalesHeader.get("Document Type"::Order, "Document No.") then begin
                    if SalesHeader.Locked then
                        Error('Please contact your system administrator!');
                end
            end;
        }


    }

    keys
    {
        key(Extkey1; "Document No.", "No.")
        {
            SumIndexFields = Quantity;
        }
        /*
        key(Extkey2; "Document No.",Accessory)
        {
            SumIndexFields = Quantity, "Outstanding Amount (LCY)";
        }
        key(Extkey3; "Document No.", "Sell-to Customer No.", Accessory)
        {
            SumIndexFields = "Outstanding Amount (LCY)";
        } 
        */
    }

    var
        UserSetup: Record "User Setup";
        Location: Record Location;
        //Color: Record "50067";
        //PurchInvLine: Record "123";
        SalesHeader: Record "Sales Header";
        VRIError: Label 'You are picking from a VRI Location!';
        MonitorError: Label 'You are not allowed to sell from this Location. Please Contact your Superior for Authorization!';

}
