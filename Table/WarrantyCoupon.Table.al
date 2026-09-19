table 50022 "Warranty Coupon"
{

    fields
    {
        field(1; VIN; Code[20])
        {
            Description = 'Vehicle Identification No.';

            trigger OnValidate()
            begin
                WMI := COPYSTR(VIN, 1, 3);
                VDS := COPYSTR(VIN, 4, 5);
                VIS := COPYSTR(VIN, 10);
            end;
        }
        field(2; WMI; Code[20])
        {
        }
        field(3; VDS; Code[20])
        {
        }
        field(4; VIS; Code[20])
        {
        }
        field(5; "Delivery Date"; Date)
        {

            trigger OnValidate()
            begin
                "Expected Warranty Expired Date" := CALCDATE('+3Y', "Delivery Date");
            end;
        }
        field(6; "Owner's Name"; Text[100])
        {
        }
        field(7; Address; Text[100])
        {
        }
        field(8; City; Code[20])
        {
        }
        field(9; State; Code[20])
        {
            //TableRelation = "Post Code".Code WHERE(Type = CONST(State));
        }
        field(10; "Post Code"; Code[20])
        {
            //TableRelation = "Post Code".Code WHERE(Type = CONST(" "));
        }
        field(11; "Original Speedometer Rep Date"; Date)
        {
        }
        field(12; "Original Speedometer Rep at"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(13; "Dealer's No."; Code[20])
        {

            trigger OnValidate()
            begin
                IF Custrec.GET("Dealer's No.") THEN
                    "Dealer's Name" := Custrec.Name;
            end;
        }
        field(14; "Dealer's Name"; Text[50])
        {
            Editable = false;
        }
        field(15; "Document Type"; Option)
        {
            OptionMembers = Coupon,FTR,TWC;
        }
        field(16; "Document Code"; Code[20])
        {
        }
        field(17; "Attach FTR"; Integer)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(18; "Attach TWC"; Integer)
        {
            FieldClass = Normal;
        }
        field(19; Description; Text[50])
        {
        }
        field(20; "Owner Age"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(21; "Owner Sex"; Option)
        {
            OptionCaption = ' ,Male,Female';
            OptionMembers = " ",Male,Female;
        }
        field(22; "Owner Type"; Option)
        {
            OptionCaption = ' ,Individual,Private Company,Cooperate Body,Multinational,Government,NGO''s';
            OptionMembers = " ",Individual,"Private Company","Cooperate Body",Multinational,Government,"NGO's";
        }
        field(23; "Business Sector"; Option)
        {
            OptionCaption = ' ,Trading and Distributions,Manufacturing,Consultancy,Services,Oil and Gas,NGOs,Education,Government';
            OptionMembers = " ","Trading and Distributions",Manufacturing,Consultancy,Services,"Oil and Gas",NGOs,Education,Government;
        }
        field(24; "Contact Persons"; Text[50])
        {
        }
        field(25; "Driver Name"; Text[50])
        {
        }
        field(26; "Mobile Phone"; Text[50])
        {
        }
        field(27; Phone; Text[50])
        {
        }
        field(28; "Fax Line"; Text[30])
        {
        }
        field(29; "E-Mail"; Text[50])
        {
        }
        field(30; "Home-Page"; Text[50])
        {
        }
        field(31; "Speedometer Reading"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(32; "Expected Warranty Expired KM"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            InitValue = 100.000;
        }
        field(33; "Expected Warranty Expired Date"; Date)
        {
        }
        field(34; "Last School Attended"; Option)
        {
            OptionCaption = ' ,Student,Graduate, Post Graduate,Artisan,School Certificate,Primary';
            OptionMembers = " ",Student,Graduate," Post Graduate",Artisan,"School Certificate",Primary;
        }
        field(35; "Ledger No."; Integer)
        {

            trigger OnValidate()
            begin
                ItemLedger.GET("Ledger No.");
                VALIDATE(VIN, ItemLedger."Serial No.");
                Description := ItemLedger.Description;
                "Engine  Number" := ItemLedger."Engine No.";
                "Chassis Number" := VIN;
                VALIDATE("Item No.", ItemLedger."Item No.");
                //ItemTrackingMgt.CallItemTrackingEntryFormlook(1,"Dealer's No.",'','','','','',Rec);
            end;
        }
        field(36; "Warranty Cop Rec. Date"; Date)
        {

            trigger OnValidate()
            begin
                "Delay Days" := "Warranty Cop Rec. Date" - "Delivery Date";
            end;
        }
        field(37; "Delay Days"; Integer)
        {
            Editable = false;
        }
        field(38; "Model No."; Code[20])
        {
        }
        field(39; "Chassis Number"; Code[30])
        {

            trigger OnLookup()
            begin
                ItemLedger.SETCURRENTKEY("Entry Type", "Source No.", "Chasis Number");
                ItemLedger.SETRANGE(ItemLedger."Source No.", "Dealer's No.");
                ItemLedger.SETFILTER(ItemLedger."Serial No.", '<>%1', '');
                ItemLedger.FILTERGROUP(2);
                legercard.SETRECORD(ItemLedger);
                legercard.SETTABLEVIEW(ItemLedger);
                legercard.LOOKUPMODE(TRUE);

                IF legercard.RUNMODAL = ACTION::LookupOK THEN BEGIN
                    legercard.GETRECORD(ItemLedger);
                    "Chassis Number" := ItemLedger."Serial No.";
                    IF ItemLedger.FIND() THEN
                        VALIDATE("Ledger No.", ItemLedger."Entry No.")
                    ELSE
                        ERROR('The Chasis No. is not found under this dealer');
                END;
                CLEAR(legercard);
            end;

            trigger OnValidate()
            begin
                /*ItemLedger.RESET;
                ItemLedger.SETCURRENTKEY("Entry Type","Source No.","Chasis Number");
                ItemLedger.SETRANGE(ItemLedger."Source No.","Dealer's No.");
                ItemLedger.SETRANGE(ItemLedger."Chasis Number","Chassis Number");
                IF ItemLedger.FIND() THEN VALIDATE("Sales Ledger No.",ItemLedger."Entry No.");
                ItemLedger.SETRANGE(ItemLedger."Source No.");
                ItemLedger.SETRANGE(ItemLedger."Chasis Number");
                */

            end;
        }
        field(40; "Model Name"; Text[50])
        {
            CalcFormula = Lookup("Item Ledger Entry"."Serial No." WHERE("Serial No." = FIELD("Chassis Number")));
            FieldClass = FlowField;
        }
        field(41; "Engine  Number"; Code[20])
        {
        }
        field(42; "Owner Status"; Code[20])
        {
        }
        field(43; "Owners Type"; Option)
        {
            OptionCaption = ' ,Private Individual,Cooperate body,Government,NGO,Internation Organisation';
            OptionMembers = " ","Private Individual","Cooperate body",Government,NGO,"Internation Organisation";
        }
        field(44; "Item No."; Code[20])
        {

            trigger OnValidate()
            begin
                IF ItemRec.GET("Item No.") THEN BEGIN
                    "Model No." := ItemRec."Model No.";
                    "Model Name" := ItemRec."Model Name";
                END;
            end;
        }
        field(45; Colour; Code[30])
        {
        }
        field(46; "Mode Name"; Text[200])
        {
            CalcFormula = Lookup("Item Ledger Entry".Description WHERE("Serial No." = FIELD("Chassis Number")));
            FieldClass = FlowField;
        }
        field(47; "Vehicle Group"; Code[20])
        {
            CalcFormula = Lookup(Item."Inventory Posting Group" WHERE("No." = FIELD("Item No.")));
            FieldClass = FlowField;
        }
        field(48; Consignee; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; VIN)
        {
            Clustered = true;
        }
        key(Key2; "Ledger No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Text000: Label 'You have canceled the create process.';
        Text001: Label 'Replace existing attachment?';
        Text002: Label 'You have canceled the import process.';
        Custrec: Record 18;
        stockrec: Record 5700;
        ItemLedger: Record 32;
        legercard: Page "Item Tracking Entries Form";
        ItemTrackingMgt: Codeunit 6500;
        ItemRec: Record 27;
}

