table 50026 "Monthly Vehicle Order"
{

    fields
    {
        field(1; "Period Starting"; Date)
        {
            TableRelation = "Accounting Period"."Starting Date";
        }
        field(2; "PO Number"; Code[20])
        {
        }
        field(3; Customer; Code[20])
        {
            TableRelation = IF (Purchaser = CONST(DLF_A)) Customer."No." WHERE("Gen. Bus. Posting Group" = filter('DLF_A'))
            ELSE
            IF (Purchaser = CONST(DLF_B)) Customer."No." WHERE("Gen. Bus. Posting Group" = filter('TNL_B'))
            ELSE
            IF (Purchaser = CONST(OTHERS)) Customer."No." WHERE("Customer Posting Group" = FILTER('<>STAFF'),
                                                                                  "Gen. Bus. Posting Group" = FILTER('<>TNL_A&<>TNL_B'))
            ELSE
            IF (Purchaser = filter('TNL')) Customer."No." WHERE("No." = filter('999999'));

            trigger OnValidate()
            begin
                IF CustRec.GET(Customer) THEN
                    "Customer Gen Bus Posting Group" := CustRec."Gen. Bus. Posting Group";
            end;
        }
        field(4; "Customer Gen Bus Posting Group"; Code[10])
        {
            Editable = false;
        }
        field(5; Purchaser; Option)
        {
            OptionMembers = " ",TNL,DLF_A,DLF_B,OTHERS;
        }
        field(6; "Currency Code"; Code[10])
        {
            TableRelation = Currency.Code;
        }
        field(7; "Exchange Rate"; Decimal)
        {
            DecimalPlaces = 10 : 10;
        }
        field(8; "PO Created"; Boolean)
        {
            CalcFormula = Exist("Purchase Header" WHERE("Document Type" = filter('Order'), "No." = FIELD("PO Number")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; Vendor; Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(10; "Posted Invoice No."; Code[20])
        {
            CalcFormula = Lookup("Purch. Inv. Header"."No." WHERE("Order No." = FIELD("PO Number")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Vendor's Invoice No."; Code[20])
        {
        }
        field(90; "Vehicle Count"; Decimal)
        {
            /* CalcFormula = Sum("Monthly Vehicle Order Lines".Quantity WHERE("Period Starting" = FIELD("Period Filter"),
                                                                            "PO Numbe"r=FIELD("PO Filter"),
                                                                            Customer=FIELD("Customer Filter"),
                                                                            "Model Group Code"=FIELD("Model Group Filter"),
                                                                            "Model Category"=FIELD("Model Category Filter"),
                                                                            "Model No."=FIELD("Model Filter"),
                                                                            Colour=FIELD("Colour Filter")));
            DecimalPlaces = 0:0;
            Editable = false;
            FieldClass = FlowField;  */
        }
        field(91; "Line Vehicle Count"; Decimal)
        {
            CalcFormula = Sum("Monthly Vehicle Order Lines".Quantity WHERE("Period Starting" = FIELD("Period Starting"), "PO Number" = FIELD("PO Number")));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(100; "Model Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Item."No." WHERE("Inventory Posting Group" = filter('N_CARS'));
        }
        field(110; "Model Group Filter"; Code[20])
        {
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(140; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(150; "Purchase Filter"; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = " ",TNL,DLF_A,DLF_B,OTHERS;
        }
        field(170; "Period Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(180; "Colour Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Colour Codes"."Colour Code";
        }
        field(190; "Model Category Filter"; Code[20])
        {
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(191; "Customer Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Customer;
        }
        field(192; "PO Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(500; "No. Series"; Code[20])
        {
        }
        field(501; "Posting Date"; Date)
        {
        }
        field(502; "Order Date"; Date)
        {
        }
        field(503; "LC Number"; Code[20])
        {
        }
        field(504; Location; Code[20])
        {
        }
        field(505; "Date Received"; Date)
        {
        }
        field(506; "Created by"; Code[20])
        {
            Editable = false;

        }
        field(507; "Creation date"; Date)
        {
            Editable = false;
        }
        field(508; "Last Modified by"; Code[20])
        {
            Editable = false;

        }
        field(509; "Modification Date"; Date)
        {
            Editable = false;
        }
        field(510; Blocked; Boolean)
        {

            trigger OnValidate()
            begin
                Lines.RESET;
                Lines.SETRANGE(Lines."Period Starting", "Period Starting");
                Lines.SETRANGE(Lines."PO Number", "PO Number");
                //Lines.MODIFYALL(Lines.Blocked, Blocked, FALSE);
            end;
        }
    }

    keys
    {
        key(Key1; "Period Starting", "PO Number")
        {
            Clustered = true;
        }
        key(Key2; Purchaser)
        {
        }
        key(Key3; Purchaser, Customer)
        {
        }
        key(Key4; Vendor, Purchaser, "Period Starting", "PO Number")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        CALCFIELDS("Posted Invoice No.");
        IF "Posted Invoice No." <> '' THEN ERROR('You CANNOT Delete a Posted MVO!');
    end;

    trigger OnInsert()
    begin
        PurchSetup.GET;
        //IF "Period Starting" = 0D THEN BEGIN
        PurchSetup.TESTFIELD("Order Nos.");
        "No. Series" := PurchSetup."Order Nos.";
        if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
            "No. Series" := xRec."No. Series";
        "PO Number" := NoSeriesMgt.GetNextNo("No. Series");
        //END;

        "Order Date" := WORKDATE;
        IF ("Posting Date" = 0D) THEN "Posting Date" := WORKDATE;

        "Created by" := USERID;
        "Creation date" := TODAY;
    end;

    trigger OnModify()
    begin
        "Last Modified by" := USERID;
        "Modification Date" := TODAY;
    end;

    var
        ItemRec2: Record Item;
        CustRec: Record Customer;
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Lines: Record "Monthly Vehicle Order Lines";

    procedure AssistEdit(OldMVO: Record "Monthly Vehicle Order"): Boolean
    begin
       /*  PurchSetup.GET;
        PurchSetup.TESTFIELD("Order Nos.");
        IF NoSeriesMgt.SelectSeries('P-ORD-CARS', OldMVO."No. Series", "No. Series") THEN BEGIN
            PurchSetup.GET;
            PurchSetup.TESTFIELD("Order Nos.");
            NoSeriesMgt.SetSeries("PO Number");
            EXIT(TRUE);
        END; */
    end;
}

