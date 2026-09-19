table 50155 "Search Tracker Line"
{
    Caption = 'Search Tracker Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Part No"; Code[20])
        {
            TableRelation = Item."No.";

            /*  trigger OnLookup()
             begin
                 IF PAGE.RUNMODAL(0, Itemrec) = ACTION::LookupOK THEN BEGIN
                     "Part No" := Itemrec."No.";
                     "Part Description" := Itemrec.Description;
                 END;
             end;
  */
            trigger OnValidate()
            begin
                //TESTFIELD("Document No.", '');
                //iteval;
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
        field(17; "Inventory Posting Group"; Code[20])
        {
            TableRelation = "Inventory Posting Group".Code;
        }
        field(18; "General Prod Posting Group"; Code[20])
        {
            TableRelation = "Gen. Product Posting Group".Code;
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

        field(31; Status; Option)
        {
            Editable = true;
            OptionCaption = '  ,Registered,Non Registered';
            OptionMembers = "  ",Registered,"Non Registered";
        }
        field(32; "Non Specification"; Boolean)
        {
        }
        field(34; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
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

        field(54; "Online Order"; Boolean)
        {
        }
        field(55; "Request Date"; Date)
        {
            Editable = false;
        }
        field(56; "Request by"; Code[20])
        {
            
        }

    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
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
}
