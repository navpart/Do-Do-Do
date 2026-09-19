table 50095 "Parts Enquiry"
{
    DrillDownPageID = 50118;
    LookupPageID = 50118;

    fields
    {
        field(1; "Entry No"; Integer)
        {
        }
        field(2; "Request Date"; Date)
        {
        }
        field(3; "Part No"; Code[20])
        {
            TableRelation = Item;

            trigger OnLookup()
            begin
                IF PAGE.RUNMODAL(0, Itemrec) = ACTION::LookupOK THEN BEGIN
                    "Part No" := Itemrec."No.";
                    "Part Description" := Itemrec.Description;
                END;
            end;

            trigger OnValidate()
            begin
                TESTFIELD("Document No.", '');
                iteval;
            end;
        }
        field(4; "Part Description"; Text[100])
        {
        }
        field(6; "Stock Type"; Option)
        {
            OptionMembers = Normal,"Non stock",Obsolete;
        }
        field(7; "Model No."; Code[50])
        {
            TableRelation = "Parts By Model"."Model Code" WHERE("Part No." = FIELD("Part No"));

            trigger OnValidate()
            begin
                Model.SETRANGE(Model."Model No.", "Model No.");
                IF Model.FINDFIRST THEN
                    "Model Name" := Model."Model Name";
            end;
        }
        field(8; "Model Name"; Text[50])
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
        field(15; "Frequency of Request"; Integer)
        {
            CalcFormula = Count("Parts Enquiry" WHERE("Part No" = FIELD("Part No"),
                                                       "Request Date" = FIELD(FILTER("Date Filter"))));
            FieldClass = FlowField;
        }
        field(16; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(17; "Inventory Posting Group"; Code[20])
        {
            TableRelation = "Inventory Posting Group".Code;
        }
        field(18; "General Prod Posting Group"; Code[20])
        {
            TableRelation = "Gen. Product Posting Group".Code;
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
        field(25; Variant; Code[20])
        {
            TableRelation = "Item Variant".Code WHERE("Item No." = FIELD("Part No"));

            trigger OnValidate()
            begin
                IF Itemrec.GET("Part No") THEN BEGIN
                    "Part Description" := Itemrec.Description;
                    "Non Specification" := Itemrec."Non Specification";
                    Itemrec.SETFILTER(Itemrec."Location Filter", "Location Code");
                    Itemrec.SETRANGE(Itemrec."Variant Filter", Variant);
                    Itemrec.CALCFIELDS(Itemrec."Net Change", Itemrec."Qty. on Purch. Order", Itemrec."Qty. on Sales Order");
                    "Quantity On Hand" := Itemrec."Net Change";
                    "Quantity On Purchase Order" := Itemrec."Qty. on Purch. Order";
                    "Quantity On Sales Order" := Itemrec."Qty. on Sales Order";
                    "Unit Price" := Itemrec."Unit Price";
                    Status := Status::Registered;
                    "Part Category" := Itemrec."Part Category";
                    VALIDATE("Item Group", Itemrec."Item Price Group");
                END;
            end;
        }
        field(26; Supplied; Boolean)
        {
        }
        field(27; "Inv No."; Code[20])
        {
        }
        field(28; "Quantity Demanded"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin

                //VALIDATE("Quantity Supplied");
            end;
        }
        field(29; "Quantity Supplied"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                TESTFIELD(Variant);
                //"Quantity On Sales Order"

                IF "Quantity Supplied" > "Quantity On Hand" THEN
                    ERROR('Quantity to supply is more than net available quantity!');

                IF "Quantity Supplied" > "Quantity Demanded" THEN
                    VALIDATE("Quantity Demanded", "Quantity Supplied");

                "Lost Quantity" := "Quantity Demanded" - "Quantity Supplied";
                "Line Amount" := "Quantity Supplied" * "Unit Price";
            end;
        }
        field(30; "Search Code"; Code[20])
        {

            trigger OnValidate()
            begin
                IF "Search Code" <> xRec."Search Code" THEN BEGIN
                    InvSetup.GET;
                    NoseriesMgt.TestManual(InvSetup."Search Tracker Nos.");
                    "No. Series" := '';
                END;
            end;
        }
        field(31; Status; Option)
        {
            Editable = true;
            OptionCaption = '  ,Registered,Non Registered';
            OptionMembers = "  ",Registered,"Non Registered";
        }
        field(32; "Non Specification"; Boolean)
        {
        }
        field(33; "Document No."; Code[20])
        {
            Editable = true;
            TableRelation = IF ("Document Type" = const(Order)) "Sales Header"."No." WHERE("No." = FIELD("Document No."))
            ELSE
            IF ("Document Type" = CONST(Quote)) "Sales Header"."No." WHERE("Document Type" = filter('Quote'));
        }
        field(34; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(35; "Document Type"; Enum "Sales Document Type")
        {
            Editable = true;
            //OptionCaption = ' ,Quote,Order,Invoice';
            //OptionMembers = " ",Quote,"Order",Invoice;
        }
        field(36; "Lost Quantity"; Decimal)
        {
            Editable = false;
        }
        field(37; "Quantity On Hand"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(38; "Quantity On Purchase Order"; Decimal)
        {
            Editable = false;
        }
        field(39; "Quantity On Sales Order"; Decimal)
        {
            Editable = false;
        }
        field(40; "Unit Price"; Decimal)
        {
            Editable = false;
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
        field(45; "Part No. ST Frequent"; Integer)
        {
            CalcFormula = Count("Parts Enquiry" WHERE("Part No" = FIELD("Part No"),
                                                       "Search Code" = FIELD("Search Code")));
            FieldClass = FlowField;
        }
        field(46; "Reference No."; Code[20])
        {
        }
        field(47; "Invoice Line No."; Integer)
        {
        }
        field(48; "Part Category"; Option)
        {
            OptionCaption = ' ,ENGINE/FUEL SYSTEM,POWER DRIVE/CHASIS,BODY PARTS,ELECTRICAL PARTS';
            OptionMembers = " ","ENGINE/FUEL SYSTEM","POWER DRIVE/CHASIS","BODY PARTS","ELECTRICAL PARTS";
        }
        field(49; "Item Group"; Code[10])
        {
            TableRelation = IF ("Inventory Posting Group" = filter('N_PARTS')) "Item Price Group"."Item Price Grp Code";

            trigger OnValidate()
            begin
                IF Pricerec.GET("Item Group") THEN
                    "Price Group Description" := Pricerec.Description;
            end;
        }
        field(50; "Price Group Description"; Text[30])
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
            CalcFormula = Sum("Parts Enquiry"."Line Amount" WHERE("Search Code" = FIELD("Search Code")));
            Description = 'Total Order value';
            Editable = false;
            FieldClass = FlowField;
        }
        field(54; "Online Order"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Search Code", "Entry No")
        {
            Clustered = true;
            SumIndexFields = "Line Amount";
        }
        key(Key2; "Part No", "Request Date", "Location Code", Variant)
        {
            SumIndexFields = "Quantity Demanded", "Quantity Supplied", "Lost Quantity";
        }
        key(Key3; "Item Group", "Part No")
        {
            SumIndexFields = "Quantity Demanded", "Quantity Supplied", "Lost Quantity";
        }
        key(Key4; "Part Category")
        {
            SumIndexFields = "Quantity Demanded", "Quantity Supplied", "Lost Quantity";
        }
        key(Key5; "Model No.", "Part No")
        {
            SumIndexFields = "Quantity Demanded", "Quantity Supplied", "Lost Quantity";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //TESTFIELD("Record Locked",FALSE);
    end;

    trigger OnInsert()
    begin
        /* IF "Reference No." <> '' THEN BEGIN
            IF "Search Code" = '' THEN BEGIN
                InvSetup.GET;
                InvSetup.TESTFIELD("Search Tracker Nos.");
                NoseriesMgt.InitSeries(InvSetup."Search Tracker Nos.", xRec."No. Series", 0D, "Search Code", "No. Series");
                "Entry No" := 10000;
            END;
        END
        ELSE */
        /* IF CONFIRM('Search for Next Customer ?', FALSE) THEN BEGIN
            IF "Search Code" = '' THEN BEGIN
                InvSetup.GET;
                InvSetup.TESTFIELD("Search Tracker Nos.");
                NoseriesMgt.InitSeries(InvSetup."Search Tracker Nos.", xRec."No. Series", 0D, "Search Code", "No. Series");
                "Entry No" := 10000;
            END;
        END ELSE  */

        //"Search Code" := xRec."Search Code";
        IF "Search Code" = '' THEN BEGIN
            InvSetup.GET;
            InvSetup.TESTFIELD("Search Tracker Nos.");
            //NoseriesMgt.InitSeries(InvSetup."Search Tracker Nos.", xRec."No. Series", 0D, "Search Code", "No. Series"); //
            NoseriesMgt.GetNextNo(InvSetup."Search Tracker Nos.");

            RecPart.SETRANGE(RecPart."Search Code", xRec."Search Code");
            IF RecPart.FindLast() THEN
                "Entry No" := RecPart."Entry No" + 10000;

            "Request Date" := xRec."Request Date";
            "Location Code" := xRec."Location Code";
            VALIDATE("Request by", xRec."Request by");
            "No. Series" := xRec."No. Series";

        END;
        IF UserRec.GET(USERID) THEN
            "Department Code" := UserRec.Department;
        "Location Code" := UserRec."Location Code";
        //"User ID" := USERID;
        "Time of Request" := TIME;
        "Last Time Modified" := TIME;
        "Last Date Modified" := TODAY;
    end;

    trigger OnModify()
    begin
        "Last Time Modified" := TIME;
        "Last Date Modified" := TODAY;
        //TESTFIELD("Record Locked",FALSE);
    end;

    var
        Model: Record Model;
        RecPart: Record "Parts Enquiry";
        Itemrec: Record Item;
        JPMList: Record "JPM List";
        StockRec: Record "Stockkeeping Unit";
        //SKUForm: Page "5701";
        CustRec: Record Customer;
        CustRec2: Record Customer;
        SaleHead: Record "Sales Header";
        SalesLine: Record "Sales Line";
        PartEnquiry: Record "Parts Enquiry";
        LineNo: Integer;
        NoRel: Record "No. Series Relationship";
        NoSeries: Record "No. Series";
        Item: Record Item;
        NoseriesMgt: Codeunit "No. Series";
        PartRec: Record "Parts Enquiry";
        InvSetup: Record "Inventory Setup";
        UserRec: Record "User Setup";
        text0001: Label 'Please Specify the Part No. and  Location Before Variant';
        Pricerec: Record "Item Price Group";
        "CheckCredit Limite": Codeunit "Cust-Check Cr. Limit";
        //CheckCrForm: Page "343";
        OK: Boolean;


    procedure AssistEdit(OldPart: Record "Parts Enquiry"): Boolean
    begin

        PartRec := Rec;
        InvSetup.GET;
        InvSetup.TESTFIELD("Search Tracker Nos.");
        "No. Series" := InvSetup."Search Tracker Nos.";
        if NoseriesMgt.AreRelated("No. Series", xRec."No. Series") then
            "No. Series" := xRec."No. Series";
        "Search Code" := NoseriesMgt.GetNextNo("No. Series");


        /* IF NoseriesMgt.SelectSeries(InvSetup."Search Tracker Nos.", OldPart."No. Series", PartRec."No. Series") THEN BEGIN
            InvSetup.GET;
            InvSetup.TESTFIELD(InvSetup."Search Tracker Nos.");
            NoseriesMgt.SetSeries(PartRec."Search Code");
            Rec := PartRec;
            EXIT(TRUE);
        END; */
    end;


    procedure GetModel(ModelNo: Code[20])
    begin
        IF ModelNo <> Model."Model No." THEN
            Model.GET(ModelNo)
        ELSE
            CLEAR(Model);
    end;


    procedure InsertItem()
    begin
        Itemrec.INIT;
        Itemrec."No." := "Part No";
        Itemrec.Description := "Part Description";
        Itemrec."Inventory Posting Group" := "Inventory Posting Group";
        Itemrec."Gen. Prod. Posting Group" := "General Prod Posting Group";
        Itemrec.INSERT(TRUE);
    end;


    procedure CreateInvoice(dtype: Enum "Sales Document Type")
    begin

        LineNo := 10000;

        SaleHead.RESET;
        SalesLine.RESET;
        PartEnquiry.SETRANGE(PartEnquiry."Search Code", "Search Code");
        PartEnquiry.SETRANGE(PartEnquiry.Status, PartEnquiry.Status::Registered);
        IF PartEnquiry.FIND('-') THEN BEGIN
            IF PartEnquiry."Document No." <> '' THEN BEGIN
                SaleHead.GET(dtype, PartEnquiry."Document No.");
                SalesLine.SETRANGE(SalesLine."Document No.", SaleHead."No.");
                SalesLine.SETRANGE(SalesLine."Document Type", dtype);
                IF SalesLine.FIND('+') THEN BEGIN
                    LineNo := SalesLine."Line No." + 10000;
                    PartEnquiry.SETFILTER(PartEnquiry."Document No.", '%1', '');
                END;
            END
            ELSE BEGIN
                SaleHead.INIT;
                SaleHead."Document Type" := dtype;
                SaleHead.INSERT(TRUE);

                SaleHead.VALIDATE(SaleHead."Sell-to Customer No.", "Request by");
                IF CustRec2.GET("Request by") THEN
                    SaleHead.VALIDATE("Customer Line discount", CustRec2."Customer Line Discount");
                SaleHead.VALIDATE(SaleHead."Shortcut Dimension 1 Code", PartEnquiry."Department Code");
                SaleHead."Location Code" := PartEnquiry."Location Code";
                SaleHead."Tracker No." := PartEnquiry."Search Code";
                SaleHead."Online Order" := PartEnquiry."Online Order";
                SaleHead.MODIFY;

            END;
            REPEAT
                SalesLine.INIT;
                SalesLine."Document Type" := dtype;
                SalesLine.VALIDATE(SalesLine."Document No.", SaleHead."No.");
                SalesLine."Line No." := LineNo;
                SalesLine.VALIDATE(SalesLine."Sell-to Customer No.", SaleHead."Sell-to Customer No.");
                SalesLine.Type := SalesLine.Type::Item;
                SalesLine.VALIDATE(SalesLine."No.", PartEnquiry."Part No");
                SalesLine."Location Code" := PartEnquiry."Location Code";
                SalesLine.VALIDATE(SalesLine."Variant Code", PartEnquiry.Variant);
                SalesLine."Quantity Demanded" := PartEnquiry."Quantity Demanded";
                SalesLine.VALIDATE(SalesLine.Quantity, PartEnquiry."Quantity Supplied");
                SalesLine."Search Code" := PartEnquiry."Search Code";
                SalesLine."Search Line" := PartEnquiry."Entry No";
                SalesLine.INSERT(TRUE);

                if SaleHead."Document Type" = "Sales Document Type"::Quote then
                    PartEnquiry."Document Type" := "Sales Document Type"::Order;

                if SaleHead."Document Type" = "Sales Document Type"::Order then
                    PartEnquiry."Document Type" := "Sales Document Type"::Invoice;

                //PartEnquiry."Document Type" := SaleHead."Document Type" + Format(1);
                PartEnquiry."Document No." := SaleHead."No.";
                PartEnquiry."Invoice Line No." := LineNo;
                PartEnquiry."Record Locked" := TRUE;
                PartEnquiry.MODIFY;
                LineNo := LineNo + 10000;

            UNTIL PartEnquiry.NEXT = 0;
        END;
        "Document No." := SaleHead."No.";


    end;


    procedure SPrice(): Decimal
    var
        ItemRec: Record Item;
        SKU2: Record "Stockkeeping Unit";
        ProfitPct: Decimal;
        ItemCostMgt: Codeunit ItemCostManagement;
        AverageCostLCY: Decimal;
        AverageCostACY: Decimal;
        InvtSetup: Record "Inventory Setup";
        PriceGrp: Record "Item Price Group";
    begin
        InvtSetup.GET;
        IF ItemRec.GET("Part No") THEN BEGIN
            IF InvtSetup."Average Cost Calc. Type" = InvtSetup."Average Cost Calc. Type"::"Item & Location & Variant" THEN BEGIN
                ItemRec.SETRANGE("Location Filter", "Location Code");
                ItemRec.SETRANGE("Variant Filter", Variant);
            END;
            ItemRec.SETFILTER("Date Filter", ItemRec.GETFILTER("Date Filter"));
            ItemCostMgt.CalculateAverageCost(ItemRec, AverageCostLCY, AverageCostACY);

        END;

        ProfitPct := PriceGrp.ProfitMarkupToOnCost(ItemRec."Profit %");
        EXIT(AverageCostLCY * (100 + ProfitPct) / 100);
    end;


    procedure iteval()
    begin
        "Quantity Demanded" := 0;
        "Quantity On Hand" := 0;
        "Model No." := '';
        "Last Date Modified" := TODAY;
        "Unit Price" := 0;
        "Lost Quantity" := 0;
        "Quantity Supplied" := 0;
        "Quantity On Sales Order" := 0;
        "Quantity On Purchase Order" := 0;
        "Record Locked" := FALSE;
        CALCFIELDS("Part No. ST Frequent");

        IF Itemrec.GET("Part No") THEN BEGIN
            "Part Description" := Itemrec.Description;
            "Non Specification" := Itemrec."Non Specification";
            Itemrec.SETFILTER(Itemrec."Location Filter", "Location Code");
            Itemrec.CALCFIELDS(Itemrec."Net Change", Itemrec."Qty. on Purch. Order", Itemrec."Qty. on Sales Order");
            "Quantity On Hand" := Itemrec."Net Change";
            "Quantity On Purchase Order" := Itemrec."Qty. on Purch. Order";
            "Quantity On Sales Order" := Itemrec."Qty. on Sales Order";
            Itemrec.VALIDATE("Last Direct Cost");
            "Unit Price" := Itemrec."Unit Price";
            Status := Status::Registered;
            //"Model No." := Itemrec."Model No.";
            "Part Category" := Itemrec."Part Category";
            //VALIDATE("Item Group",Itemrec."Item Price Group");
        END ELSE BEGIN
            IF JPMList.GET("Part No") THEN BEGIN
                "Part Description" := JPMList.Name;
                IF CONFIRM('This Part Number is Not Available on your Inventory \Do you want SEARCH TRACKER to Track it', TRUE) THEN
                    MESSAGE('Fill Up the Required Detail and Click ''TRACK'' button bellow');
                Status := Status::"Non Registered";
            END
            ELSE
                ERROR('This Part  Number is Not Available on JPM/DPM List, Check the Number, kindly create the new part');
        END;
    end;


    procedure Stcval()
    begin
        "Quantity Demanded" := 0;
        "Quantity Supplied" := 0;
        "Quantity On Hand" := 0;
        "Model No." := '';
        "Lost Quantity" := 0;
        "Last Date Modified" := TODAY;
        "Unit Price" := 0;
        "Quantity On Sales Order" := 0;
        "Quantity On Purchase Order" := 0;
        "Record Locked" := FALSE;
        IF Itemrec.GET("Part No") THEN;
        IF StockRec.GET("Location Code", "Part No", Variant) THEN BEGIN
            StockRec.CALCFIELDS(StockRec.Inventory, StockRec."Qty. on Purch. Order", StockRec."Qty. on Sales Order");
            "Quantity On Hand" := StockRec.Inventory;
            "Quantity On Purchase Order" := StockRec."Qty. on Purch. Order";
            "Quantity On Sales Order" := StockRec."Qty. on Sales Order";
            "Unit Price" := SPrice;
            Status := Status::Registered;
            //"Model No." := Itemrec."Model No.";
            "Part Category" := Itemrec."Part Category";
            VALIDATE("Item Group", Itemrec."Item Price Group");
        END ELSE BEGIN
            IF JPMList.GET("Part No") THEN BEGIN
                "Part Description" := JPMList.Name;
                IF CONFIRM('This Part Number is Not Available on your Inventory \Do you want SEARCH TRACKER to Track it', TRUE) THEN
                    MESSAGE('Fill Up the Required Detail and Click ''TRACK'' button bellow');
                Status := Status::"Non Registered";
            END
            ELSE
                ERROR('This Part Number is Not Available on JPM/DPM List, Check the Number');
        END;
    end;
}

