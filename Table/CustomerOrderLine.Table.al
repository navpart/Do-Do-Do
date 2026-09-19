table 50122 "Customer Order Line"
{

    fields
    {
        field(1; "Customer Order Form No."; Code[20])
        {
            TableRelation = "Customer Order Table."."Customer Order Form No.";
        }
        field(2; "No."; Code[20])
        {
            TableRelation = IF ("Line Type" = CONST(Item)) Item."No."
            ELSE
            IF ("Line Type" = filter(" ")) "Standard Text".Code
            ELSE
            IF ("Line Type" = filter(Labour), "Location Code" = FILTER('<>128ORE')) "Service Cost".Code WHERE("Model Description" = FIELD("Model Description"))
            ELSE
            IF ("Line Type" = filter(Labour), "Location Code" = FILTER('128ORE')) "Service Cost".Code
            ELSE
            IF ("Line Type" = filter('Sundry Spares')) "Service Cost".Code
            ELSE
            IF ("Line Type" = filter('G/L Account')) "G/L Account"."No."
            ELSE
            IF ("Line Type" = filter(Sublet)) "G/L Account"."No.";

            trigger OnValidate()
            begin
                //TESTFIELD("Location Code");
                IF CustOrderRec.GET("Customer Order Form No.") THEN BEGIN
                    CASE "Line Type" OF
                        "Line Type"::Item:
                            IF ItemRec.GET("No.") THEN BEGIN
                                Description := ItemRec.Description;
                                "Bin/Shelf No." := ItemRec."Shelf No.";
                                ItemRec.SETFILTER(ItemRec."Location Filter", "Location Code");
                                ItemRec.CALCFIELDS(ItemRec."Net Change");
                                "Available Quantity" := ItemRec."Net Change";
                                "Unit of Measure" := ItemRec."Sales Unit of Measure";

                                CusRec.GET(CustOrderRec."Customer No.");
                                IF CusRec."Service Type" = CusRec."Service Type"::"Cost value" THEN
                                    VALIDATE("Unit Price", ItemRec."Unit Cost") ELSE

                                    IF CustOrderRec."Estimate Factor" <> 0 THEN
                                        VALIDATE("Unit Price", (GetSalesPriceGroupPrice() * CustOrderRec."Estimate Factor"))
                                    ELSE
                                        VALIDATE("Unit Price", GetSalesPriceGroupPrice());
                                VALIDATE("Unit Cost", ItemRec."Unit Cost");


                                IF ItemUnitMeasure.GET("No.", "Unit of Measure") THEN
                                    IF CustOrderRec."Estimate Factor" <> 0 THEN
                                        VALIDATE("Unit Price", (GetSalesPriceGroupPrice() * CustOrderRec."Estimate Factor" *
                                        ItemUnitMeasure."Qty. per Unit of Measure"))
                                    ELSE BEGIN
                                        VALIDATE("Unit Price", GetSalesPriceGroupPrice() * ItemUnitMeasure."Qty. per Unit of Measure");
                                        VALIDATE("Unit Cost", ItemRec."Unit Cost" * ItemUnitMeasure."Qty. per Unit of Measure");
                                    END;
                                IF GetSalesPriceGroupPrice() <> 0 THEN
                                    VALIDATE("Unit Price", GetSalesPriceGroupPrice());
                            END;
                        "Line Type"::Labour:
                            IF Servrec.GET("No.") THEN BEGIN
                                Description := Servrec.Description;
                                "Unit of Measure" := Servrec."Unit of Measure Code";
                                ServiceSetup.GET;
                                VALIDATE(Quantity, Servrec."Default Quantity");
                                VALIDATE("Unit Price", Servrec."Default Unit Price");
                                IF ServiceSetup."Dealer Hourly Rate" <> 0 THEN BEGIN
                                    VALIDATE("Unit Price", Servrec."Default Unit Price");
                                    "Duration in Hrs" := Servrec."Default Quantity" * ServiceSetup."Dealer Hourly Rate";
                                    "Dealer Hourly Rate" := Servrec."Default Unit Price" * "Duration in Hrs";
                                    "Flat Rate" := Servrec."Flat Rate";
                                END;
                            END;
                        "Line Type"::"Sundry Spares":
                            IF Servrec.GET("No.") THEN BEGIN
                                Description := Servrec.Description;
                                "Unit of Measure" := Servrec."Unit of Measure Code";
                                VALIDATE(Quantity, Servrec."Default Quantity");
                                VALIDATE("Unit Price", Servrec."Default Unit Price");
                                ServiceSetup.GET;
                                IF ServiceSetup."Dealer Hourly Rate" <> 0 THEN BEGIN
                                    VALIDATE("Unit Price", Servrec."Default Unit Price");
                                    "Duration in Hrs" := Servrec."Default Quantity" * ServiceSetup."Dealer Hourly Rate";
                                    "Dealer Hourly Rate" := Servrec."Default Unit Price" * "Duration in Hrs";
                                    "Flat Rate" := Servrec."Flat Rate";
                                END;
                            END;
                    END;
                    // "Additional Jobs" := CustOrderRec."Additional Job Confirmation";
                    CASE "Line Type" OF
                        "Line Type"::"G/L Account":
                            IF "G/LRec".GET("No.") THEN BEGIN
                                Description := "G/LRec".Name;
                            END;
                    END;
                END;

                //To manage Additional Jobs
                CustOrderLine.SETRANGE(CustOrderLine."Customer Order Form No.", CustOrderRec."Customer Order Form No.");
                CustOrderLine."Additional Jobs" := CustOrderRec."Additional Job Confirmation";
            end;
        }
        field(3; Description; Text[50])
        {
        }
        field(4; Quantity; Decimal)
        {
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                Amount := "Unit Price" * Quantity;
                IF Discount <> 0 THEN
                    Amount := Amount - (Amount * Discount / 100);
                "Vat Amount" := Amount * 0.05;
                "Amount Inc. VAT" := Amount + "Vat Amount";

                IF Servrec.Operations = TRUE THEN
                    "FR Amount" := "Unit Price" * "Duration in Hrs";
                "FR VAT Amount" := "FR Amount" * 0.05;
                "FR Amount Inc VAT" := "FR Amount" + "FR VAT Amount";

                CASE "Line Type" OF
                    "Line Type"::Item:
                        BEGIN
                            IF Quantity > "Available Quantity" THEN BEGIN
                                Amount := Quantity * "Unit Price";
                                IF Discount <> 0 THEN
                                    Amount := Amount - (Amount * Discount / 100);
                                "Cost Amount" := Quantity * "Unit Cost";
                                Difference := "Available Quantity" - Quantity;
                                "Stock Status" := "Stock Status"::Insufficient;
                                "Vat Amount" := Amount * 0.05;
                                "Amount Inc. VAT" := Amount + "Vat Amount";
                            END
                            ELSE
                                IF Quantity < "Available Quantity" THEN BEGIN
                                    Amount := Quantity * "Unit Price";
                                    IF Discount <> 0 THEN
                                        Amount := Amount - (Amount * Discount / 100);
                                    "Cost Amount" := Quantity * "Unit Cost";
                                    Difference := "Available Quantity" - Quantity;
                                    "Stock Status" := "Stock Status"::Available;
                                    "Vat Amount" := Amount * 0.05;
                                    "Amount Inc. VAT" := Amount + "Vat Amount";
                                END
                                ELSE
                                    IF ("Available Quantity" <= 0) AND ("Line Type" = "Line Type"::Item) THEN BEGIN
                                        Amount := Quantity * "Unit Price";
                                        IF Discount <> 0 THEN
                                            Amount := Amount - (Amount * Discount / 100);
                                        "Cost Amount" := Quantity * "Unit Cost";
                                        "Vat Amount" := Amount * 0.05;
                                        "Amount Inc. VAT" := Amount + "Vat Amount";
                                        Difference := "Available Quantity" - Quantity;
                                        "Stock Status" := "Stock Status"::Insufficient;
                                    END;
                        END;
                END;
                //"Additional Jobs" := TRUE;
            end;
        }
        field(5; Stock; Boolean)
        {

            trigger OnValidate()
            begin
                /*IF Stock = TRUE THEN BEGIN
                  "Confirmation Date" := TODAY;
                  "Confirmation Time" := TIME;
                  END ELSE
                  BEGIN
                  "Confirmation Date" := 0D;
                  "Confirmation Time" := 0T;
                 END;*/

            end;
        }
        field(6; EDA; Date)
        {
        }
        field(7; "Line No."; Integer)
        {
        }
        field(8; "Operation Code"; Code[20])
        {
            TableRelation = "Fault Setup Header"."Operation Code";
        }
        field(9; "Line Type"; Option)
        {
            OptionCaption = ' ,Item,Labour,Sundry Spares,G/L Account,Sublet';
            OptionMembers = " ",Item,Labour,"Sundry Spares","G/L Account",Sublet;
        }
        field(10; "Additional Jobs"; Boolean)
        {
        }
        field(11; "Unit Price"; Decimal)
        {

            trigger OnValidate()
            begin
                VALIDATE(Quantity);
            end;
        }
        field(12; Amount; Decimal)
        {
        }
        field(13; "Estimate Factor"; Decimal)
        {
        }
        field(14; "Location Code"; Code[20])
        {
            TableRelation = Location.Code WHERE("Use As In-Transit" = CONST(false));

            trigger OnValidate()
            begin
                VALIDATE("No.");
            end;

            trigger OnLookup()
            var
                UserSetup: Record "User Setup";
                Location: Record Location;
            begin
                UserSetup.Get(USERID);
                if UserSetup."Location Code" <> '' then
                    Location.FilterGroup(2);
                Location.SetRange(Code, UserSetup."Location Code");
                if Page.RunModal(Page::"Location List", Location) = Action::LookupOK then
                    "Location Code" := Location.Code;
                Location.FilterGroup(0);
            end;
        }
        field(15; Variant; Code[20])
        {
            TableRelation = "Item Variant".Code WHERE("Item No." = FIELD("No."));
        }
        field(16; "Available Quantity"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Editable = false;
        }
        field(17; "Stock Status"; Option)
        {
            OptionCaption = ' ,Available,Insufficient,Not Available';
            OptionMembers = " ",Available,Insufficient,"Not Available";
        }
        field(18; "Feeding Location"; Code[20])
        {
            TableRelation = Location.Code WHERE("Use As In-Transit" = CONST(false));
        }
        field(19; Difference; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Editable = false;
        }
        field(20; "Job Instruction No."; Code[10])
        {
            TableRelation = "Customer Order Table."."Job Instruction No.";
        }
        field(21; "Job Details / Replaced Parts"; Text[50])
        {
        }
        field(22; Results; Option)
        {
            OptionCaption = ' ,Inspected,Changed,Replaced,Not Replaced,Not Used,Used,Approval Not Given';
            OptionMembers = " ",Inspected,Changed,Replaced,"Not Replaced","Not Used",Used,"Approval Not Given";
        }
        field(23; "Unit Cost"; Decimal)
        {

            trigger OnValidate()
            begin
                VALIDATE(Quantity);
            end;
        }
        field(24; "Cost Amount"; Decimal)
        {
        }
        field(220; "Service Type"; Option)
        {
            OptionCaption = 'Periodic Maintenance,General Repairs';
            OptionMembers = "Periodic Maintenance","General Repairs";
        }
        field(221; "Vat Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                VALIDATE(Quantity);
            end;
        }
        field(222; "Amount Inc. VAT"; Decimal)
        {
        }
        field(223; "Part Collected"; Boolean)
        {
        }
        field(224; "Service Order"; Code[20])
        {
        }
        field(225; ETA; Time)
        {
        }
        field(226; "Duration in Hrs"; Decimal)
        {

            trigger OnValidate()
            begin
                IF Servrec.Operations = TRUE THEN
                    "FR Amount" := "Unit Price" * "Duration in Hrs";
                "FR VAT Amount" := "FR Amount" * 0.05;
                "FR Amount Inc VAT" := "FR Amount" + "FR VAT Amount";
            end;
        }
        field(227; "Dealer Hourly Rate"; Decimal)
        {

            trigger OnValidate()
            begin
                IF Servrec.Operations = TRUE THEN
                    "FR Amount" := "Unit Price" * "Duration in Hrs";
                "FR VAT Amount" := "FR Amount" * 0.05;
                "FR Amount Inc VAT" := "FR Amount" + "FR VAT Amount";
            end;
        }
        field(228; "Flat Rate"; Decimal)
        {

            trigger OnValidate()
            begin
                IF Servrec.Operations = TRUE THEN
                    "FR Amount" := "Unit Price" * "Duration in Hrs";
                "FR VAT Amount" := "FR Amount" * 0.05;
                "FR Amount Inc VAT" := "FR Amount" + "FR VAT Amount";
            end;
        }
        field(229; "FR Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                IF Servrec.Operations = TRUE THEN
                    "FR Amount" := "Unit Price" * "Duration in Hrs";
                "FR VAT Amount" := "FR Amount" * 0.05;
                "FR Amount Inc VAT" := "FR Amount" + "FR VAT Amount";
            end;
        }
        field(230; "FR VAT Amount"; Decimal)
        {
        }
        field(231; "FR Amount Inc VAT"; Decimal)
        {
        }
        field(232; Confirmed; Boolean)
        {

            trigger OnValidate()
            begin
                IF Confirmed THEN BEGIN
                    UserSetup.GET;
                    "Confirmed by" := USERID
                END
                ELSE
                    "Confirmed by" := '';
            end;
        }
        field(233; "Confirmed by"; Code[20])
        {
        }
        field(234; "Bin/Shelf No."; Code[20])
        {
        }
        field(235; "Model No."; Code[20])
        {
        }
        field(236; "Model Description"; Text[30])
        {
        }
        field(50000; "Job Type"; Option)
        {
            Caption = 'Customer Request Type';
            OptionCaption = ' ,PM,GR,Others,Warranty,Internal,D/Estimate,B&P,B&P Estimate,Painting';
            OptionMembers = " ",PM,GR,Others,Warranty,Internal,"D/Estimate","B&P","B&P Estimate",Painting;
        }
        field(50001; "PR Raised"; Boolean)
        {
        }
        field(50002; "On Part Order"; Boolean)
        {
        }
        field(50003; "Model Name"; Text[30])
        {
        }
        field(50004; "Customer Class"; Option)
        {
            OptionCaption = ' ,Customer Paid,Internal,Warranty';
            OptionMembers = " ","Customer Paid",Internal,Warranty;
        }
        field(50010; "For Sublet"; Boolean)
        {
        }
        field(50011; "Sublet Order No."; Code[20])
        {
            TableRelation = "Purchase Line"."Document No." WHERE("COF No." = FIELD("Customer Order Form No."));

            trigger OnValidate()
            begin
                /*TESTFIELD("For Sublet");
                IF PurchInvLine.GET("Sublet Order No.","Sublet Line No.") THEN BEGIN
                  VALIDATE("Line Type","Line Type"::"Sundry Spares");
                  VALIDATE("No.",'SUBLET');
                  VALIDATE(Quantity,PurchInvLine.Quantity);
                  VALIDATE("Unit Price",PurchInvLine."Direct Unit Cost");
                  MESSAGE('Note that the amount in the unit price field is the direct unit cost on the sublet');
                END;*/

            end;
        }
        field(50012; "Sublet Line No."; Integer)
        {
            TableRelation = "Purch. Inv. Line"."Line No." WHERE("COF No." = FIELD("Customer Order Form No."));
        }
        field(50013; "Sublet to"; Code[20])
        {
            TableRelation = IF ("For Sublet" = CONST(true)) Vendor."No." WHERE("Workshop Service Supplier" = CONST(true));
        }
        field(50014; "Sublet Code"; Code[20])
        {
            TableRelation = "Sublet Service"."Sublet Code";

            trigger OnValidate()
            begin
                IF subrec.GET("Sublet Code") THEN BEGIN
                    subrec.TESTFIELD(subrec."Debit Account");
                    Description := subrec."Sublet Descriptions";
                    VALIDATE("Unit Price", subrec."Standard Price");
                    VALIDATE(Quantity, 1);
                    "No." := subrec."Debit Account";
                END;
            end;
        }
        field(50015; "Unit of Measure"; Text[10])
        {
        }
        field(50016; Discount; Decimal)
        {
            trigger OnValidate()
            begin
                VALIDATE(Quantity);
            end;
        }
        field(50017; "Sent to Parts"; Boolean)
        {
            Editable = false;
        }
        field(50018; "Quantity Requested"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin

                Amount := "Unit Price" * "Quantity Requested";
                IF Discount <> 0 THEN
                    Amount := Amount - (Amount * Discount / 100);
                "Vat Amount" := Amount * 0.075;
                "Amount Inc. VAT" := Amount + "Vat Amount";

                IF Servrec.Operations = TRUE THEN
                    "FR Amount" := "Unit Price" * "Duration in Hrs";
                "FR VAT Amount" := "FR Amount" * 0.075;
                "FR Amount Inc VAT" := "FR Amount" + "FR VAT Amount";

                CASE "Line Type" OF
                    "Line Type"::Item:
                        BEGIN
                            IF "Quantity Requested" > "Available Quantity" THEN BEGIN
                                Amount := "Quantity Requested" * "Unit Price";
                                IF Discount <> 0 THEN
                                    Amount := Amount - (Amount * Discount / 100);
                                "Cost Amount" := "Quantity Requested" * "Unit Cost";
                                Difference := "Available Quantity" - "Quantity Requested";
                                "Stock Status" := "Stock Status"::Insufficient;
                                "Vat Amount" := Amount * 0.075;
                                "Amount Inc. VAT" := Amount + "Vat Amount";
                            END
                            ELSE
                                IF "Quantity Requested" < "Available Quantity" THEN BEGIN
                                    Amount := "Quantity Requested" * "Unit Price";
                                    IF Discount <> 0 THEN
                                        Amount := Amount - (Amount * Discount / 100);
                                    "Cost Amount" := "Quantity Requested" * "Unit Cost";
                                    Difference := "Available Quantity" - "Quantity Requested";
                                    "Stock Status" := "Stock Status"::Available;
                                    "Vat Amount" := Amount * 0.075;
                                    "Amount Inc. VAT" := Amount + "Vat Amount";
                                END
                                ELSE
                                    IF ("Available Quantity" <= 0) AND ("Line Type" = "Line Type"::Item) THEN BEGIN
                                        Amount := "Quantity Requested" * "Unit Price";
                                        IF Discount <> 0 THEN
                                            Amount := Amount - (Amount * Discount / 100);
                                        "Cost Amount" := "Quantity Requested" * "Unit Cost";
                                        "Vat Amount" := Amount * 0.075;
                                        "Amount Inc. VAT" := Amount + "Vat Amount";
                                        Difference := "Available Quantity" - "Quantity Requested";
                                        "Stock Status" := "Stock Status"::Insufficient;
                                    END;
                        END;
                END;
            end;
        }
        field(50019; "Quantity Outstanding"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
        }
        field(50020; "Job Category"; Code[20])
        {
            TableRelation = "Service Cost".Code;

            trigger OnValidate()
            begin
                IF "Line Type" = "Line Type"::" " THEN
                    IF Servrec.GET("Job Category") THEN BEGIN
                        "Line Type" := "Line Type"::Labour;
                        VALIDATE("No.", "Job Category");
                    END;
            end;
        }
        field(50021; "Quantity to Procure"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
        }
        field(50022; "Sales Price Group"; Code[10])
        {
            Caption = 'Sales Price Group';
            DataClassification = ToBeClassified;
            TableRelation = "Customer Price Group".Code;

            trigger OnValidate()
            begin
                IF "Line Type" = "Line Type"::Item THEN
                    IF GetSalesPriceGroupPrice() <> 0 THEN
                        VALIDATE("Unit Price", GetSalesPriceGroupPrice());
            end;
        }
    }

    keys
    {
        key(Key1; "Customer Order Form No.", "Line No.")
        {
            Clustered = true;
            SumIndexFields = Amount, "Amount Inc. VAT", "Vat Amount";
        }
        key(Key2; "Additional Jobs", "Customer Order Form No.")
        {
            SumIndexFields = Amount, "Amount Inc. VAT", "Vat Amount";
        }
        key(Key3; "Service Type", "Line Type")
        {
            SumIndexFields = Amount, "Amount Inc. VAT", "Vat Amount";
        }
        key(Key4; "Line Type", "Customer Order Form No.")
        {
            SumIndexFields = "Amount Inc. VAT";
        }
        key(Key5; "Job Type", "Line Type", "Customer Order Form No.")
        {
            SumIndexFields = "Amount Inc. VAT";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //ERROR('You can not delete this entry. Contact your System Administrator!')
    end;

    trigger OnInsert()
    begin
        //To manage Additional Jobs
        CustOrderLine.SETRANGE(CustOrderLine."Customer Order Form No.", CustOrderRec."Customer Order Form No.");
        IF CustOrderRec."Additional Job Confirmation" = TRUE THEN
            CustOrderLine."Additional Jobs" := CustOrderRec."Additional Job Confirmation";


        CustOrderLine.SETRANGE(CustOrderLine."Customer Order Form No.", CustOrderRec."Customer Order Form No.");
        IF CustOrderRec.GET("Customer Order Form No.") THEN BEGIN
            "Model No." := CustOrderRec."Model No";
            "Model Description" := CustOrderRec."Model Name";
        END;
    end;

    var
        ItemRec: Record Item;
        CustOrderRec: Record "Customer Order Table.";
        Resrec: Record "Resource";
        Servrec: Record "Service Cost";
        CustOrderLine: Record "Customer Order Line";
        CusRec: Record "Customer";
        UserSetup: Record "User Setup";
        ServiceSetup: Record "Service Mgt. Setup";
        "G/LRec": Record "G/L Account";
        PurchInvLine: Record "Purchase Line";
        subrec: Record "Sublet Service";
        ItemUnitMeasure: Record "Item Unit of Measure";

    local procedure GetSalesPriceGroupPrice(): Decimal
    var
        SalesPrice: Record "Sales Price";
    begin
        IF ("No." = '') OR ("Sales Price Group" = '') THEN
            EXIT(0);
        SalesPrice.SETRANGE("Sales Type", SalesPrice."Sales Type"::"Customer Price Group");
        SalesPrice.SETRANGE("Sales Code", "Sales Price Group");
        SalesPrice.SETRANGE("Item No.", "No.");
        IF "Unit of Measure" <> '' THEN
            SalesPrice.SETRANGE("Unit of Measure Code", "Unit of Measure");
        SalesPrice.SETFILTER("Starting Date", '%1|<=%2', 0D, TODAY);
        SalesPrice.SETFILTER("Ending Date", '%1|>=%2', 0D, TODAY);
        IF SalesPrice.FINDFIRST() THEN
            EXIT(SalesPrice."Unit Price");
        EXIT(0);
    end;
}

