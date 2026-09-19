tableextension 50004 "Customer Ext." extends Customer
{
    fields
    {
        field(50000; Type; Option)
        {
            OptionMembers = Customer,Staff;
        }
        field(50200; Bankaccount; Boolean)
        {
        }
        field(50201; Debetinterest; Decimal)
        {
        }
        field(50202; Creditinterest; Decimal)
        {
        }
        field(50203; "Currency adj."; Code[10])
        {
        }
        field(50204; xDepartment; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50205; Interestrate; Decimal)
        {
        }
        field(50206; Budgetdelimitation; Code[10])
        {
        }
        field(50207; Budgeted; Decimal)
        {
        }
        field(50208; Customertie; Code[20])
        {
        }
        field(50209; "Original Naireamount"; Decimal)
        {
        }
        field(50210; Currencyadjustment; Decimal)
        {
        }
        field(50211; "Branch required"; Code[10])
        {
        }
        field(50212; "Customer OK"; Boolean)
        {
            InitValue = true;
        }
        field(50213; "Customer OK Division"; Boolean)
        {
            InitValue = true;
        }
        field(50214; Customertype; Option)
        {
            OptionMembers = Customer,Dealer,Internal;
        }
        field(50215; "Address 3"; Text[50])
        {
        }
        field(50216; "P.O.Box"; Text[50])
        {
        }
        field(50217; "Customer 2nd"; Code[20])
        {
            TableRelation = Customer;
        }
        field(50218; "Aut. Exch. Rate Adj."; Boolean)
        {
        }
        field(50219; "Due Balance+"; Decimal)
        {
        }
        field(50220; "Balance Due by Posting Date"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Posting Date" = FIELD("Date Filter"),
                                                                                 "Currency Code" = FIELD("Currency Filter"),
                                                                                 "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter")));
            Description = 'Inserted by Nancy for the purpose of Customer Ageing report.';

        }
        field(50221; "Loss Sales"; Code[10])
        {
            Editable = false;
        }
        field(50222; "Loss Sales Amount"; Decimal)
        {
            Editable = false;
        }
        field(50223; "Document No Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(50224; "Modified by"; Code[20])
        {
            Editable = false;
        }
        field(50239; "MVO Count"; Decimal)
        {
            /*
              CalcFormula = Sum("Monthly Vehicle Order Lines".Quantity WHERE("Period Starting" = FIELD("Date Filter"),
                                                                              "PO Number" = FIELD("PO Filter"),
                                                                              "Model No." = FIELD("Item Filter"),
                                                                              Customer = FIELD("No."),
                                                                              "Model Group Code" = FIELD("Model Group Filter"),
                                                                              "Model Category" = FIELD("Model Category Filter"),
                                                                              Colour = FIELD("Colour Filter"),
                                                                              "Customer Gen Bus Posting Group" = FIELD("Customer Gen Post Grp Filter")));
              DecimalPlaces = 0 : 0;
              Editable = false;
              FieldClass = FlowField;
              */
        }
        field(50240; "MVO Purchaser Filter"; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = " ",TNL,DLF_A,DLF_B,OTHERS;
        }
        field(50241; "MVO Model Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Item;
        }
        field(50242; "Customer Gen Post Grp Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Gen. Business Posting Group";
        }
        field(50243; "Customer Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Customer;
        }
        field(50244; "Model Group Filter"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(50245; "Model Category Filter"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(50246; "PO Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            //TableRelation = "Monthly Vehicle Order"."PO Number";
        }
        field(50247; "Colour Filter"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(50248; "Item Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(50249; "Line Item Demanded"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Sales Invoice Line" WHERE("Sell-to Customer No." = FIELD("No."),
                                                            "Shipment Date" = FIELD("Date Filter"),
                                                            "Posting Group" = CONST('N_PARTS'),
                                                            "Shortcut Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                            "Shortcut Dimension 2 Code" = FIELD("Global Dimension 2 Filter")));
            Editable = false;

        }
        field(50250; "Line Item Supplied"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Sales Invoice Line" WHERE("Sell-to Customer No." = FIELD("No."),
                                                            "Shipment Date" = FIELD("Date Filter"),
                                                            "Posting Group" = CONST('N_PARTS'),
                                                            "Shortcut Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                            "Shortcut Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                            Quantity = FILTER(> 0)));
            Editable = false;

        }
        field(50251; "Service Rate %"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Editable = false;
        }
        field(50252; "Line Item Qty. Demanded"; Decimal)
        {

            /* 
             FieldClass = FlowField;
             CalcFormula = Sum("Sales Invoice Line"."Quantity Demanded" WHERE("Sell-to Customer No." = FIELD("No."),
                                                                               "Shipment Date" = FIELD("Date Filter"),
                                                                               "Posting Group" = CONST('N_PARTS'),
                                                                               "Shortcut Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                               "Shortcut Dimension 2 Code" = FIELD("Global Dimension 2 Filter")));
             Editable = false;
 */
        }
        field(50253; "Line Item Qty. Supplied"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Invoice Line".Quantity WHERE("Sell-to Customer No." = FIELD("No."),
                                                                   "Shipment Date" = FIELD("Date Filter"),
                                                                   "Posting Group" = CONST('N_PARTS'),
                                                                   "Shortcut Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                   "Shortcut Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                   Quantity = FILTER(> 0)));
            Editable = false;

        }
        field(50254; "Qty. Service Rate  %"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Editable = false;
        }
        field(50255; "Pending Warranty Claims"; Decimal)
        {
            //FieldClass = FlowField;
            //CalcFormula = Sum("Warranty Claim Detail".Amount WHERE("Dealer Code" = FIELD("No."),
            // "TNL Approved" = CONST(No)));

        }
        field(50256; "Outstanding Material Claims"; Decimal)
        {
            /*
            CalcFormula = Sum("Warranty Claim Detail".Amount WHERE("Dealer Code" = FIELD("No."),
                                                                    "TNL Approved" = CONST(Yes),
                                                                    "Claim Type" = CONST(Item),
                                                                    "Issue to Dealer" = CONST(No)));
            FieldClass = FlowField;
            */
        }
        field(50257; "Outstanding Labour Claims"; Decimal)
        {
            /*
            CalcFormula = Sum("Warranty Claim Detail".Amount WHERE("Dealer Code" = FIELD("No."),
                                                                    "TNL Approved" = CONST(Yes),
                                                                    "Claim Type" = FILTER(<> Item),
                                                                    "Issue to Dealer" = CONST(No)));
            FieldClass = FlowField;
            */
        }
        field(50258; "Old No."; Code[10])
        {
        }
        field(50259; "Dealership Code"; Code[10])
        {
        }
        field(50260; "Dealership Credit Limit"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum(Customer."Credit Limit (LCY)" WHERE("Dealership Code" = FIELD("Dealership Code")));
            Editable = false;

        }
        field(50261; "Customer Category"; Option)
        {
            OptionCaption = ' ,Corporate,Individual';
            OptionMembers = " ",Corporate,Individual;
        }
        field(50262; "Business No."; Text[30])
        {
            Caption = 'Contact';
            ExtendedDatatype = PhoneNo;

            trigger OnValidate()
            begin
                IF "Business No." <> '' THEN BEGIN
                    ContactRec.SETRANGE(ContactRec."No.", "Primary Contact No.");
                    ContactRec."Mobile Phone No." := "Business No.";
                END;
            end;
        }
        field(50263; "Home No."; Text[30])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(50264; "Corporate No."; Code[20])
        {
            TableRelation = Customer."No." WHERE("Customer Category" = CONST(Corporate));
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                /*IF CusRec.GET("Corporate No.") THEN
                   Address := CusRec.Name;
                */

            end;
        }
        field(50265; Occupation; Text[30])
        {
        }
        field(50266; "Type of ID"; Option)
        {
            OptionCaption = ' ,Driver License,National ID,Int. Passport,RC No';
            OptionMembers = " ","Driver License","National ID","Int. Passport","RC No";
        }
        field(50267; "Birthday/Date of Incorp"; Integer)
        {
        }
        field(50268; "Contact 2"; Text[30])
        {
        }
        field(50269; "User ID"; Code[50])
        {
        }
        field(50270; "Service Type"; Option)
        {
            OptionCaption = ' ,Cost value,Sales Value';
            OptionMembers = " ","Cost value","Sales Value";
        }
        field(50271; "Dealer Verification No."; Code[10])
        {
        }
        field(50272; "Remove Account Link"; Boolean)
        {
            Editable = true;
            trigger OnValidate()
            var

            begin
                UserSetup.get(USERID);
                IF NOT UserSetup."System Admin" THEN
                    ERROR('You do not have permission for this action!');

            end;
        }
        field(50273; "Removed Date"; Date)
        {
        }
        field(50274; "Removed By"; Code[30])
        {
        }
        field(50275; "Customer Line Discount"; Decimal)
        {
            trigger OnValidate()
            begin
                UserSetup.get(USERID);
                IF NOT UserSetup."System Admin" THEN
                    ERROR('You do not have permission for this action!');

            end;
        }
        field(50276; "Customer Type2"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = true;
            TableRelation = "Customer Type".Code;
        }

        field(50277; "Customer Template"; Code[10])
        {
            //TableRelation = "Customer Template".Code;
        }

        field(50278; "Remove Credit Limit"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                UserSetup.get(USERID);
                IF NOT UserSetup."System Admin" THEN
                    ERROR('You do not have permission for this action!');

            end;
        }
        field(60000; "Customer Type"; Option)
        {
            OptionMembers = Individual,Corporate,Government;
            OptionCaption = 'Individual,Corporate,Government';
        }
        field(60001; "Assigned User Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60002; "Assigned User Email"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60003; "Assigned User No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60004; "Contact Designation"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60005; "Customer Phone No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60006; "Customer Email"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60007; Username; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60008; Password; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(60009; Testfiled; Boolean)
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
        field(60010; "Dealer Emails"; Text[500])
        {
            DataClassification = ToBeClassified;

        }
        field(60011; SkipCostCheck; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                UserSetup.get(USERID);
                IF NOT UserSetup."System Admin" THEN
                    ERROR('You do not have permission for this action!');
                "SkipCostCheck Tracking" := USERID;

            end;
        }
        field(60012; "SkipCostCheck Tracking"; Code[70])
        {
            DataClassification = ToBeClassified;
        }
        field(60013; "Customer Created Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }



    }
    keys
    {
        key(ExtKey1; "Customer Type")
        {

        }
    }

    var

        datefilter: Text[30];
        userrec: Record "User Setup";
        CusRec: Record Customer;
        ContactRec: Record Contact;
        UserSetup: Record "User Setup";
    //CustomerTemplate: Record "Customer Template";

    trigger OnInsert()
    var
        myInt: Integer;
    begin
        "User ID" := USERID;
        IF UserSetup.GET("User ID") THEN
            "Location Code" := UserSetup."Location Code";

        "Customer Created Date" := TODAY;

    end;


    procedure ServiceRate() "Service Rate": Decimal
    begin
        CALCFIELDS("Line Item Demanded", "Line Item Supplied");
        IF ("Line Item Demanded" <> 0) AND ("Line Item Supplied" <> 0) THEN BEGIN
            "Service Rate %" := ROUND(("Line Item Supplied" / "Line Item Demanded") * 100, 1);
            EXIT(ROUND(("Line Item Supplied" / "Line Item Demanded") * 100, 1));
        END
        ELSE
            EXIT(0);
    end;


    procedure QtyServiceRate() "Service Rate": Decimal
    begin

        CALCFIELDS("Line Item Qty. Demanded", "Line Item Qty. Supplied");
        IF ("Line Item Qty. Demanded" <> 0) AND ("Line Item Qty. Supplied" <> 0) THEN BEGIN
            "Qty. Service Rate  %" := ROUND(("Line Item Qty. Supplied" / "Line Item Qty. Demanded") * 100, 1);
            EXIT(ROUND(("Line Item Qty. Supplied" / "Line Item Qty. Demanded") * 100, 1));
        END
        ELSE
            EXIT(0);
    end;


    procedure "Fully Supplied"(): Decimal
    var
        salesinv: Record "Sales Invoice Line";
    begin
        datefilter := GETFILTER("Date Filter");
        salesinv.SETCURRENTKEY("Sell-to Customer No.", "Shipment Date");
        salesinv.SETRANGE(salesinv."Sell-to Customer No.", "No.");
        salesinv.SETFILTER(salesinv."Shipment Date", datefilter);
        //salesinv.CALCFIELDS(salesinv."Fully Invoiced");
        //salesinv.SETRANGE(salesinv."Fully Invoiced", TRUE);
        EXIT(salesinv.COUNT);
    end;


    procedure ServiceRateDepth(): Decimal
    begin

        CALCFIELDS("Line Item Demanded", "Line Item Supplied");
        IF "Line Item Supplied" <> 0 THEN
            EXIT(ROUND("Fully Supplied" / "Line Item Supplied" * 100, 1))
        ELSE
            EXIT(0);
    end;

}
