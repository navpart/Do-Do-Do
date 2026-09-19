table 50014 Model
{
    DataCaptionFields = "Model No.", "Model Name";
    DrillDownPageID = "Model List";
    LookupPageID = "Model List";

    fields
    {
        field(1; "Model No."; Code[50])
        {
            NotBlank = true;


        }
        field(2; "Model Name"; Text[50])
        {
        }
        field(3; "Prod Date"; Text[30])
        {
        }

        field(5; "Date Filter"; Date)
        {

            trigger OnValidate()
            begin

                PartsBymodel.SETRANGE(PartsBymodel."Model Code", "Model No.");
                IF PartsBymodel.FIND('-') THEN
                    PartsBymodel.SETFILTER(PartsBymodel."Base Date", '%1', "Date Filter");


            end;
        }
        field(6; "Part Category Filter"; Option)
        {
            FieldClass = FlowFilter;
            OptionCaption = 'BODY PARTS,BRAKE/SUSPENSION,CLUTCH SYSTEM,ELECTRICAL,ENGINE PARTS,FUEL SYSTEM,SILENCER/AIR CLEANER,WATER PUMP,WATER PUMP & RADIATOR';
            OptionMembers = "BODY PARTS","BRAKE/SUSPENSION","CLUTCH SYSTEM",ELECTRICAL,"ENGINE PARTS","FUEL SYSTEM","SILENCER/AIR CLEANER","WATER PUMP","WATER PUMP & RADIATOR";
        }
        field(7; "Line Items"; Integer)
        {
            CalcFormula = Count("Parts By Model" WHERE("Model Code" = FIELD("Model No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Line Items with Stock Q'ty"; Integer)
        {
            CalcFormula = Count("Parts By Model" WHERE("Model Code" = FIELD("Model No."),
                                                         "Q'ty On Hand" = FILTER(> 0)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Other Specification"; Boolean)
        {

            trigger OnValidate()
            begin
                ItemRec.SETRANGE(ItemRec."Model No.", "Model No.");
                IF ItemRec.FIND('-') THEN
                    REPEAT
                        IF "Other Specification" THEN
                            ItemRec."Non Specification" := TRUE
                        ELSE
                            ItemRec."Non Specification" := FALSE;
                        ItemRec.MODIFY;
                    UNTIL ItemRec.NEXT = 0;
            end;
        }
        field(10; "Inventory Line Item"; Integer)
        {
            CalcFormula = Count(Item WHERE("Model No." = FIELD("Model No."),
                                            "Inventory Posting Group" = filter('N_PARTS')));
            FieldClass = FlowField;
        }
        field(11; "Operation code"; Code[20])
        {
        }
        field(12; Type; Option)
        {
            OptionCaption = ' ,Item,Resource,Cost,Temp';
            OptionMembers = " ",Item,Resource,Cost,Temp;
        }
        field(13; "No."; Code[20])
        {
        }
        field(14; Description; Text[50])
        {
        }
        field(15; Quantity; Integer)
        {
        }
        field(16; "Model Description"; Text[50])
        {
        }
        field(27; "Total Qty Sold"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), "Posting Date" = FIELD(UPPERLIMIT("Base Date2"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "Grade I"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('Grade I')));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        /* field(35; "1.5TIX50"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('Grade I'), Engine = CONST('Grade I 1.5T'), "Posting Date" = FIELD(UPPERLIMIT("Base Date2"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        } */
        field(36; "1.5TIX70L"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('Grade I'), Engine = CONST('Grade I 1.5T'), "Posting Date" = FIELD(UPPERLIMIT("Base Date2"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "Grade II"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('Grade II')));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(37; "1.5TIIX70L"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('Grade II'), Engine = CONST('Grade II 1.5T'), "Posting Date" = FIELD(UPPERLIMIT("Base Date2"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(38; "1.5TIIX70PE"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('Grade II'), Engine = CONST('Grade II 1.5T'), "Posting Date" = FIELD(UPPERLIMIT("Base Date2"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(39; "1.6TIIX90P"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('Grade II'), Engine = CONST('Grade II 1.6T'), "Posting Date" = FIELD(UPPERLIMIT("Base Date2"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "Grade III"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('Grade III')));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(40; "1.5TIIIX70L"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('Grade III'), Engine = CONST('Grade III 1.5T'), "Posting Date" = FIELD(UPPERLIMIT("Base Date2"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(41; "1.6TIIIX70PE"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('Grade III'), Engine = CONST('Grade III 1.6T'), "Posting Date" = FIELD(UPPERLIMIT("Base Date2"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(42; "2.0TIIIX90P"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('Grade III'), Engine = CONST('Grade III 2.0T'), "Posting Date" = FIELD(UPPERLIMIT("Base Date2"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(31; "Grade IV"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('Grade IV')));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(43; "1.5TIVX1D"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('Grade IV'), Engine = CONST('Grade IV 1.5T'), "Posting Date" = FIELD(UPPERLIMIT("Base Date2"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(44; "1.6TIVX70PE"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('Grade IV'), Engine = CONST('Grade IV 1.6T'), "Posting Date" = FIELD(UPPERLIMIT("Base Date2"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }

        field(46; "2.0TIVX90P"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('Grade IV'), Engine = CONST('Grade IV 2.0T'), "Posting Date" = FIELD(UPPERLIMIT("Base Date2"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(32; "Grade V"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('Grade V')));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(47; "1.6TVX1D"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('Grade V'), Engine = CONST('Grade V 1.6T'), "Posting Date" = FIELD(UPPERLIMIT("Base Date2"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(33; "PREMIUM QTY"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('PREMIUM')));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(48; "2.0TPRT2"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('PREMIUM'), Engine = CONST('PREMIUM 2.0T'), "Posting Date" = FIELD(UPPERLIMIT("Base Date2"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(49; "1.5TPRX50"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('PREMIUM'), Engine = CONST('PREMIUM 1.5T'), "Posting Date" = FIELD(UPPERLIMIT("Base Date2"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(34; "LUXURY QTY"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('LUXURY')));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50; "2.0TLUXT2"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('LUXURY'), Engine = CONST('LUXURY 2.0T'), "Posting Date" = FIELD(UPPERLIMIT("Base Date2"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(51; "1.5TLUX50"; Decimal)
        {
            CalcFormula = - Sum("Item Ledger Entry".Quantity WHERE("Model No." = FIELD("Model No."), "Entry Type" = CONST(Sale), Grade = CONST('LUXURY'), Engine = CONST('LUXURY 1.5T'), "Posting Date" = FIELD(UPPERLIMIT("Base Date2"))));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(52; "Line No."; Integer)
        {

        }
        field(53; "Base Date2"; Date)
        {

            FieldClass = FlowFilter;

        }
        field(54; "Date Filter2"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Mode: Record Model;
            begin
                Mode.SetRange(Mode."Model No.", "Model No.");
                if Mode.Find('-') then
                    Rec.SetFilter(Rec."Base Date2", '%1', "Date Filter2");
            end;
        }

    }

    keys
    {
        key(Key1; "Model No.", "Model Name")
        {
            Clustered = true;
        }
        key(Key2; "Model Name")
        {
        }
    }

    fieldgroups
    {
    }

    var
        ItemRec: Record Item;
        PartsBymodel: Record "Parts By Model";
        datefilter: Text[30];
        Showpremiuminoperation: Boolean;
        Model: Record Model;
        Qsales: Decimal;
        Qsales1: Decimal;
        Qsales2: Decimal;
        Qsales3: Decimal;
        Qsales4: Decimal;
        Qsales5: Decimal;
        Qsales6: Decimal;
        Qsales7: Decimal;




    procedure ShowPremiumField(): Boolean
    begin
        exit(ShowPremiumInOperation);
    end;

}

