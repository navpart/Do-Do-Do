table 50154 "Search Tracker Header"
{
    Caption = 'Search Tracker Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; "Request Date"; Date)
        {
        }
        field(9; "Location Code"; Code[20])
        {
            TableRelation = Location.Code WHERE("Use As In-Transit" = CONST(false));
        }

        field(10; "User ID"; Code[30])
        {
        }
        field(11; "Time of Request"; Time)
        {
        }
        field(12; "Request by"; Code[20])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                IF CustRec.GET("Request by") THEN BEGIN
                    "Request Customer Name" := CustRec.Name;
                    "Request Customer Address" := CustRec.Address;
                    "Request Customer Contact" := CustRec.Contact;
                    "Request phone" := CustRec."Phone No.";
                END;
            end;
        }
        field(13; "Request Customer Name"; Text[50])
        {
        }
        field(14; "Request Customer Address"; Text[50])
        {
        }
        field(19; "Request Customer Contact"; Text[50])
        {
        }
        field(20; "Request phone"; Text[30])
        {
        }
        field(21; Ordered; Boolean)
        {
            Editable = true;
        }
        field(22; Urgent; Boolean)
        {
        }
        field(23; Commited; Boolean)
        {
        }
        field(24; "Commited Value"; Decimal)
        {
        }
        field(32; "Non Specification"; Boolean)
        {
        }
        field(33; "Document No."; Code[20])
        {
        }
        field(34; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(35; "Document Type"; Enum "Sales Document Type")
        {

        }
        field(41; "No. Series"; Code[20])
        {
        }
        field(42; "Last Time Modified"; Time)
        {
            Editable = false;
        }
        field(43; "Last Date Modified"; Date)
        {
            Editable = false;
        }
        field(44; "Record Locked"; Boolean)
        {
            Editable = true;
        }

        field(46; "Reference No."; Code[20])
        {
        }

        field(51; "Order Type"; Option)
        {
            OptionCaption = ' ,Created Demand,Stock Replenishment,VOR,Branch Back Order,Emergency/AIR Order,Back Order from Local Vendor';
            OptionMembers = " ","Created Demand","Stock Replenishment",VOR,"Branch Back Order","Emergency/AIR Order","Back Order from Local Vendor";
        }
        field(52; "Line Amount"; Decimal)
        {
            Description = 'Order Line value';
            Editable = false;
        }
        field(53; "Total Order Amount"; Decimal)
        {
            //CalcFormula = Sum("Parts Enquiry"."Line Amount" WHERE("Search C" = FIELD("Search Code")));
            Description = 'Total Order value';
            Editable = false;
            //FieldClass = FlowField;
        }
        field(54; "Online Order"; Boolean)
        {
        }

    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var


    begin
        InvSetup.GET;
        IF "No." = '' THEN BEGIN
            InvSetup.TESTFIELD("Search Tracker Nos.");
            "No. Series" := InvSetup."Search Tracker Nos.";
            if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeriesMgt.GetNextNo("No. Series");

        END;

    end;

    var
        CustRec: Record Customer;
        InvSetup: Record "Inventory Setup";
        NoseriesMgt: Codeunit "No. Series";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        SearchTrackerLine: Record "Search Tracker Line";

    procedure CreateInvoice(DocType: Enum "Sales Document Type")

    Begin

        SalesHeader.Init();
        SalesHeader."Document Type" := DocType;
        SalesHeader.Insert(true);

        SalesHeader.Validate("Sell-to Customer No.", "Request by");
        SalesHeader."Tracker No." := "No.";
        SalesHeader.Validate("Location Code", "Location Code");
        SalesHeader."Online Order" := "Online Order";
        //SalesHeader Dimension Code
        SalesHeader.Modify();

        SearchTrackerLine.SetRange("Document No.", "No.");
        if SearchTrackerLine.FindFirst() then begin
            repeat
                SalesLine.INIT;
                SalesLine."Document Type" := DocType;
                SalesLine.VALIDATE("Document No.", SalesHeader."No.");
                SalesLine."Line No." := SearchTrackerLine."Line No.";
                SalesLine.VALIDATE("Sell-to Customer No.", SalesHeader."Sell-to Customer No.");
                SalesLine.Type := SalesLine.Type::Item;
                SalesLine.VALIDATE("No.", SearchTrackerLine."Part No");
                SalesLine."Location Code" := "Location Code";
                SalesLine.VALIDATE(SalesLine."Variant Code", SearchTrackerLine.Variant);
                SalesLine."Quantity Demanded" := SearchTrackerLine."Quantity Demanded";
                SalesLine.VALIDATE(SalesLine.Quantity, SearchTrackerLine."Quantity Supplied");
                SalesLine."Tracker No." := SearchTrackerLine."Document No.";
                //SalesLine."Search Line" := SearchTrackerLine."Entry No";
                SalesLine.INSERT(TRUE);

                SearchTrackerLine."Request Date" := "Request Date";
                SearchTrackerLine."Request by" := "Request by";
                SearchTrackerLine.Modify();

            until SearchTrackerLine.Next() = 0;
        end;

        "Document No." := SalesHeader."No.";

    end;

}
