table 70036 "Customer Order LineX"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
            TableRelation = "Customer Order HeaderX"."No.";
        }
        field(2; "No."; Code[20])
        {
            TableRelation = IF (Type = CONST(Item)) Item."No."
            ELSE
            IF (Type = CONST(Resource)) Resource."No."
            ELSE
            IF (Type = CONST(Cost)) "Service Cost".Code WHERE(Model = FIELD("Model No."))
            ELSE
            IF (Type = CONST("G/L Account")) "G/L Account"."No." WHERE("Account Type" = const(Posting));

            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                CustOrderRec.GET("Document No.");

                CASE Type OF
                    Type::Item:
                        BEGIN
                            IF GetUnitPrice <> 0 THEN
                                GetUnitPrice
                            ELSE BEGIN
                                IF ItemRec.GET("No.") THEN BEGIN
                                    Description := ItemRec.Description;
                                    "Bin/Shelf No." := ItemRec."Shelf No.";
                                    ItemRec.CALCFIELDS(ItemRec."Net Change");
                                    "Quantity Available" := ItemRec."Net Change";
                                    VALIDATE("Unit of Measure", ItemRec."Sales Unit of Measure");
                                    VALIDATE("Unit Price", ItemRec."Unit Price");
                                    VALIDATE("Unit Cost", ItemRec."Unit Cost");
                                END;
                            END;
                        END;
                    Type::Resource:

                        IF Servrec.GET("No.") THEN BEGIN
                            Description := Servrec.Description;
                            "Unit of Measure" := Servrec."Unit of Measure Code";
                            ServiceSetup.GET;
                            //VALIDATE("Quantity Received",Servrec."Default Quantity");
                            VALIDATE("Unit Price", Servrec."Default Unit Price");
                            IF ServiceSetup."Dealer Hourly Rate" <> 0 THEN BEGIN
                                VALIDATE("Unit Price", Servrec."Default Unit Price");
                                "Duration in Hrs" := Servrec."Default Quantity" * ServiceSetup."Dealer Hourly Rate";
                                "Dealer Hourly Rate" := Servrec."Default Unit Price" * "Duration in Hrs";
                                "Flat Rate" := Servrec."Flat Rate";
                            END;
                        END;
                    Type::Cost:

                        IF Servrec.GET("No.") THEN BEGIN
                            Description := Servrec.Description;
                            //VALIDATE("Quantity Received",Servrec."Default Quantity");
                            VALIDATE("Unit Price", Servrec."Default Unit Price");
                            "Unit of Measure" := Servrec."Unit of Measure Code";
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
                CASE Type OF
                    Type::"G/L Account":
                        IF "G/LRec".GET("No.") THEN BEGIN
                            Description := "G/LRec".Name;
                        END;
                END;

                //To manage Additional Jobs
                CustOrderLine.SETRANGE(CustOrderLine."Document No.", CustOrderRec."No.");
                CustOrderLine."Additional Jobs" := CustOrderRec."Additional Job Confirmation";

                "VAT Category" := "VAT Category"::VAT;

            end;
        }
        field(3; Description; Text[50])
        {
        }
        field(4; "Quantity Received"; Decimal)
        {
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin

                "Quantity Outstanding" := "Quantity Requested" - "Quantity Received";


            end;
        }
        field(5; Stock; Boolean)
        {
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
        field(9; Type; Option)
        {
            OptionCaption = ' ,Item,Resource,Cost,G/L Account';
            OptionMembers = " ",Item,Resource,Cost,"G/L Account";

            trigger OnValidate()
            begin
                IF Type <> xRec.Type THEN
                    VALIDATE("No.", '');
            end;
        }
        field(10; "Additional Jobs"; Boolean)
        {
        }
        field(11; "Unit Price"; Decimal)
        {
            Editable = true;

            trigger OnValidate()
            begin
                Amount := "Unit Price" * "Quantity Requested";

                IF "Discount %" = 0 THEN
                    "Line Discount Amount" := 0
                ELSE
                    "Line Discount Amount" := ("Discount %" / 100) * Amount;

                "Line Amount" := Amount - "Line Discount Amount";

                IF "VAT Category" = "VAT Category"::VAT THEN
                    "VAT Amount" := "Line Amount" * 0.075
                ELSE
                    "VAT Amount" := 0.0;

                "Amount Inc. VAT" := "Line Amount" + "VAT Amount";
            end;
        }
        field(12; Amount; Decimal)
        {
            Editable = false;
        }
        field(13; "Estimate Factor"; Decimal)
        {
        }
        field(14; "Location Code"; Code[20])
        {
            TableRelation = Location.Code;
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
        field(15; "Variant Code"; Code[20])
        {
            TableRelation = "Item Variant".Code WHERE("Item No." = FIELD("No."));
        }
        field(16; "Quantity Available"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Editable = false;
        }
        field(17; "Stock Status"; Option)
        {
            OptionCaption = ' ,Available,Insufficient,Not Available,Not Established,Local Part Purch';
            OptionMembers = " ",Available,Insufficient,"Not Available","Not Established","Local Part Purch";
        }
        field(18; "Feeding Location"; Code[20])
        {
            TableRelation = Location.Code WHERE("Use As In-Transit" = filter('No'));
        }
        field(19; Difference; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Editable = false;
        }
        field(20; "Job Instruction No."; Code[10])
        {
            TableRelation = "Customer Order HeaderX"."Job Instruction No.";
        }
        field(21; "Job Details / Replaced Parts"; Text[50])
        {
        }
        field(22; Results; Option)
        {
            OptionCaption = ' ,Inspected,Changed,Replaced,Not Replaced,Not Used,Used,Done,Not Done,Approval Not Given';
            OptionMembers = " ",Inspected,Changed,Replaced,"Not Replaced","Not Used",Used,Done,"Not Done","Approval Not Given";
        }
        field(23; "Unit Cost"; Decimal)
        {

            trigger OnValidate()
            begin
                VALIDATE("Quantity Requested");
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
        field(221; "VAT Amount"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                VALIDATE("Quantity Requested");
            end;
        }
        field(222; "Amount Inc. VAT"; Decimal)
        {
            Editable = false;
        }
        field(223; "Part Collected"; Boolean)
        {
        }
        field(224; "Service Order"; Code[20])
        {
        }
        field(225; ETA; Time)
        {
            Enabled = false;
        }
        field(226; "Duration in Hrs"; Decimal)
        {

            trigger OnValidate()
            begin
                IF Servrec.Operations = TRUE THEN
                    "FR Amount" := "Unit Price" * "Duration in Hrs";
                "FR VAT Amount" := "FR Amount" * 0.075;
                "FR Amount Inc VAT" := "FR Amount" + "FR VAT Amount";
            end;
        }
        field(227; "Dealer Hourly Rate"; Decimal)
        {

            trigger OnValidate()
            begin
                IF Servrec.Operations = TRUE THEN
                    "FR Amount" := "Unit Price" * "Duration in Hrs";
                "FR VAT Amount" := "FR Amount" * 0.075;
                "FR Amount Inc VAT" := "FR Amount" + "FR VAT Amount";
            end;
        }
        field(228; "Flat Rate"; Decimal)
        {
            trigger OnValidate()
            begin
                IF Servrec.Operations = TRUE THEN
                    "FR Amount" := "Unit Price" * "Duration in Hrs";
                "FR VAT Amount" := "FR Amount" * 0.075;
                "FR Amount Inc VAT" := "FR Amount" + "FR VAT Amount";
            end;
        }
        field(229; "FR Amount"; Decimal)
        {
            trigger OnValidate()
            begin
                IF Servrec.Operations = TRUE THEN
                    "FR Amount" := "Unit Price" * "Duration in Hrs";
                "FR VAT Amount" := "FR Amount" * 0.075;
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
        field(50003; "Model Name"; Text[40])
        {
            CalcFormula = Lookup("Customer Order HeaderX"."Model Name" WHERE("No." = FIELD("Document No.")));
            FieldClass = FlowField;
        }
        field(50004; "Customer Class"; Option)
        {
            OptionCaption = ' ,Billable,Internal,Warranty';
            OptionMembers = " ",Billable,Internal,Warranty;
        }
        field(50010; "For Sublet"; Boolean)
        {
        }
        field(50011; "Sublet Order No."; Code[20])
        {
            TableRelation = "Purchase Line"."Document No." WHERE("COF No." = FIELD("Document No."));

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
            TableRelation = "Purch. Inv. Line"."Line No." WHERE("COF No." = FIELD("Document No."));
        }
        field(50013; "Sublet To"; Code[20])
        {
            TableRelation = IF ("For Sublet" = filter(true)) Vendor."No." WHERE("Workshop Service Supplier" = filter(true));
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
                    //VALIDATE("Quantity Received",1);
                    "No." := subrec."Debit Account";
                END;
            end;
        }
        field(50015; "Unit of Measure"; Text[10])
        {
            TableRelation = "Unit of Measure";
        }
        field(50016; "Discount %"; Decimal)
        {

            trigger OnValidate()
            begin
                IF "Discount %" = 0 THEN
                    "Line Discount Amount" := 0
                ELSE
                    "Line Discount Amount" := ("Discount %" / 100) * Amount;

                "Line Amount" := Amount - "Line Discount Amount";
                IF "VAT Category" = "VAT Category"::VAT THEN
                    "VAT Amount" := "Line Amount" * 0.075
                ELSE
                    "VAT Amount" := 0.0;
                "Amount Inc. VAT" := "Line Amount" + "VAT Amount"
            end;
        }
        field(50017; "Sent to Parts"; Boolean)
        {
        }
        field(50018; "Quantity Requested"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                "Cost Amount" := "Quantity Received" * "Unit Cost";
                VALIDATE(Amount, "Unit Price" * "Quantity Requested");
                //VALIDATE("Amount Inc. VAT","Unit Price" * "Quantity Requested");
                //VALIDATE("VAT Amount","Unit Price" * "Quantity Requested");

                IF "Discount %" = 0 THEN
                    "Line Discount Amount" := 0
                ELSE
                    "Line Discount Amount" := ("Discount %" / 100) * Amount;

                "Line Amount" := Amount - "Line Discount Amount";
                IF "VAT Category" = "VAT Category"::VAT THEN
                    "VAT Amount" := "Line Amount" * 0.075
                ELSE
                    "VAT Amount" := 0.0;

                "Amount Inc. VAT" := "Line Amount" + "VAT Amount";

                IF Type = Type::Item THEN BEGIN
                    IF "Quantity Requested" > "Quantity Available" THEN BEGIN
                        Difference := "Quantity Available" - "Quantity Requested";
                        "Stock Status" := "Stock Status"::Insufficient
                    END ELSE BEGIN
                        Difference := "Quantity Available" - "Quantity Requested";
                        "Stock Status" := "Stock Status"::Available
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
                IF Type = Type::" " THEN
                    IF Servrec.GET("Job Category") THEN BEGIN
                        Type := Type::Cost;
                        VALIDATE("No.", "Job Category");
                    END;
            end;
        }
        field(50021; "Line Discount Amount"; Decimal)
        {
        }
        field(50022; "Purchase Type"; Option)
        {
            OptionMembers = " ","Local Purchase"," Available";
        }
        field(50024; "Labour Hour"; Decimal)
        {
            BlankZero = true;

            trigger OnValidate()
            begin
                VALIDATE("Quantity Requested", "Labour Hour");
            end;
        }
        field(50025; "Line Amount"; Decimal)
        {
        }
        field(50026; "VAT Category"; Option)
        {
            OptionCaption = ' ,VAT,NOVAT';
            OptionMembers = " ",VAT,NOVAT;

            trigger OnValidate()
            begin
                VALIDATE("Quantity Requested", "VAT Category");
            end;
        }
        field(50027; "Skip Zero Qty"; Boolean)
        {
            Caption = 'Approved/Skip Zero';
        }
        field(50028; "Vehicle Registration No."; Code[20])
        {
            CalcFormula = Lookup("Customer Order HeaderX"."Vehicle Registration No." WHERE("No." = FIELD("Document No.")));
            FieldClass = FlowField;
        }
        field(50029; "Service Advisor's Name"; Text[30])
        {
            CalcFormula = Lookup("Customer Order HeaderX"."Service Advisor's Name" WHERE("No." = FIELD("Document No.")));
            FieldClass = FlowField;
        }
        field(50030; "Shipment Status"; Option)
        {
            OptionCaption = ' ,Pending,Shipped,Cancelled';
            OptionMembers = " ",Pending,Shipped,Cancelled;

        }
        field(50031; Reason; Option)
        {
            OptionCaption = ' ,Not Needed,Repaired,Done';
            OptionMembers = " ","Not Needed",Repaired,Done;
        }

    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
            SumIndexFields = Amount, "Amount Inc. VAT", "VAT Amount";
        }
        key(Key2; "Additional Jobs", "Document No.")
        {
            SumIndexFields = Amount, "Amount Inc. VAT", "VAT Amount";
        }
        key(Key3; Type, "Document No.")
        {
            SumIndexFields = "Amount Inc. VAT";
        }
        key(Key4; "Job Type", Type, "Document No.")
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
        CustOrderLine.SETRANGE(CustOrderLine."Document No.", CustOrderRec."No.");
        IF CustOrderRec."Additional Job Confirmation" = TRUE THEN
            CustOrderLine."Additional Jobs" := CustOrderRec."Additional Job Confirmation";
    end;

    trigger OnModify()
    begin
        //IF "Location Code" = '120ISO' THEN BEGIN

        //  IF Type = Type::Cost THEN
        //    TESTFIELD("Location Code",'120ISO');

        //  IF Type = Type::Item THEN
        //  ItemRec.GET("No.");
        //    //IF ItemRec."Item Category Code" = 'PART'  THEN
        //      //TESTFIELD("Location Code",'150ISOLO');

        //  IF Type = Type::Item THEN
        //  ItemRec.GET("No.");
        //   // IF ItemRec."Item Category Code" = 'BODY'  THEN
        //     // TESTFIELD("Location Code",'131PWISOLO');
        //END;
    end;

    var
        ItemRec: Record 27;
        CustOrderRec: Record 70034;
        Resrec: Record 156;
        Servrec: Record 5905;
        CustOrderLine: Record 70036;
        CusRec: Record 18;
        UserSetup: Record 91;
        ServiceSetup: Record 5911;
        "G/LRec": Record 15;
        PurchInvLine: Record 39;
        subrec: Record 50138;
        ItemUnitMeasure: Record 5404;
        SalesPrice: Record "Price List Line";
        AfterDiscount: Decimal;
        AfterDiscountCost: Decimal;
        VATPostingSetup: Record 325;


    procedure GetUnitPrice() UnitPrice: Decimal
    begin
        IF CustOrderRec.GET("Document No.") THEN BEGIN

            SalesPrice.SETRANGE("Product No.", "No.");
            SalesPrice.SETRANGE("Source Type", SalesPrice."Source Type"::"Customer Price Group");
            SalesPrice.SETRANGE("Source No.", 'ISOLO-PRIC');
            SalesPrice.SETFILTER("Starting Date", '<=%1|%2', CustOrderRec."Parts Ordered Date", 0D);
            SalesPrice.SETFILTER("Ending Date", '>=%1|%2', CustOrderRec."Parts Ordered Date", 0D);
            IF SalesPrice.FINDLAST THEN BEGIN
                UnitPrice := SalesPrice."Unit Price";
                "Unit Price" := UnitPrice;
            END;

            IF ItemRec.GET("No.") THEN BEGIN
                Description := ItemRec.Description;
                "Bin/Shelf No." := ItemRec."Shelf No.";
                ItemRec.CALCFIELDS(ItemRec."Net Change");
                "Quantity Available" := ItemRec."Net Change";
                "Unit of Measure" := ItemRec."Sales Unit of Measure";
                "Unit Cost" := ItemRec."Unit Cost";
            END;
        END;
    end;


}

