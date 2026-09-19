table 50015 TWC
{

    fields
    {
        field(1; "Distributors Code"; Code[5])
        {
        }
        field(2; "TWC No."; Code[7])
        {
        }
        field(3; "TWC No. SFX"; Code[2])
        {
        }
        field(4; "Claimant Code"; Code[5])
        {
        }
        field(5; "Invoice No."; Code[7])
        {
        }
        field(6; "Dealer Code"; Code[8])
        {
            TableRelation = Customer."No.";
        }
        field(7;"Dealer Claim No.";Code[6])
        {
        }
        field(8;"Process Flag";Boolean)
        {
        }
        field(9;"Page Count";Integer)
        {
        }
        field(10;"Warranty Type";Option)
        {
            OptionMembers = VE,CV,TY;
        }
        field(11;Francise;Option)
        {
            OptionMembers = Toyota,Lexus;
        }
        field(12;"Warranty Application Code";Code[1])
        {
        }
        field(13;"Warranty Application Code 2";Code[1])
        {
        }
        field(14;"Warranty Application Code 3";Code[1])
        {
        }
        field(15;"Warranty Application Code 4";Code[1])
        {
        }
        field(16;"Warranty Application Code 5";Code[1])
        {
        }
        field(17;"N.V. Flag";Integer)
        {
        }
        field(18;"F.V. Flag";Integer)
        {
        }
        field(19;"VIN-WMI";Code[3])
        {
        }
        field(20;"VIN-VDS";Code[6])
        {
        }
        field(21;"VIN-CD";Code[1])
        {
        }
        field(22;"VIN-VIS";Code[8])
        {
        }
        field(23;"Delivery Date";Date)
        {
        }
        field(24;"Repair Date";Date)
        {
        }
        field(25;Odometer;Code[6])
        {
        }
        field(26;"K/M Flg.";Code[1])
        {
        }
        field(27;"Current Repair Order No.";Code[7])
        {
        }
        field(28;"Invoice Currency Code";Option)
        {
            OptionCaption = ' ,J.Yen,US$,Euro';
            OptionMembers = " ","J.Yen","US$",Euro;
        }
        field(29;"Exchange Rate";Decimal)
        {
        }
        field(30;"Data ID";Code[1])
        {
        }
        field(31;"Type Class";Code[2])
        {
        }
        field(32;"Pay Code";Option)
        {
            OptionCaption = ' ,2';
            OptionMembers = " ","2";
        }
        field(33;"Operation No.";Text[10])
        {
        }
        field(34;Hour;Decimal)
        {
        }
        field(35;"Pay Code 2";Option)
        {
            OptionCaption = ' ,2';
            OptionMembers = " ","2";
        }
        field(36;"Operation No. 2";Text[10])
        {
        }
        field(37;"Hour 2";Decimal)
        {
        }
        field(38;"Pay Code 3";Option)
        {
            OptionCaption = ' ,2';
            OptionMembers = " ","2";
        }
        field(39;"Operation No. 3";Text[10])
        {
        }
        field(40;"Hour 3";Decimal)
        {
        }
        field(41;"Operation Main Code";Text[10])
        {
        }
        field(42;"Labour Rate";Decimal)
        {
        }
        field(43;"Labour Total Hour";Decimal)
        {
        }
        field(44;"Labour Amount";Decimal)
        {
        }
        field(45;"Pay Code Sublet";Option)
        {
            OptionMembers = " ","2";
        }
        field(46;"Sublet Type";Text[2])
        {
        }
        field(47;"Sublet Invoice No.";Text[7])
        {
        }
        field(48;"Sublet Amount";Decimal)
        {
        }
        field(49;"Pay Code Sublet 2";Option)
        {
            OptionMembers = " ","2";
        }
        field(50;"Sublet Type 2";Text[2])
        {
        }
        field(51;"Sublet Invoice No. 2";Text[7])
        {
        }
        field(52;"Sublet Amount 2";Decimal)
        {
        }
        field(53;"Sublet Total";Decimal)
        {
        }
        field(54;"Sublet Description";Text[50])
        {
        }
        field(55;"T1 Code";Code[2])
        {
        }
        field(56;"T2 Code";Code[2])
        {
        }
        field(57;"T3 Code 1";Code[5])
        {
        }
        field(58;"T3 Code 2";Code[5])
        {
        }
        field(59;"T3 Code 3";Code[5])
        {
        }
        field(60;"T3 Code 4";Code[5])
        {
        }
        field(61;"T3 Code 5";Code[5])
        {
        }
        field(62;"T3 Code 6";Code[5])
        {
        }
        field(63;"T3 Code 7";Code[5])
        {
        }
        field(64;"Condition (Description)";Text[50])
        {
        }
        field(65;"Cause (Description)";Text[50])
        {
        }
        field(66;"Remedy (Description)";Text[50])
        {
        }
        field(67;"Parts Pay Code 1";Option)
        {
            OptionCaption = ' ,2';
            OptionMembers = " ","2";
        }
        field(68;"Parts Local Flag 1";Code[1])
        {
        }
        field(69;"Parts Parts No. 1";Code[20])
        {
            TableRelation = Item."No." WHERE ("Inventory Posting Group"=CONST('N_PARTS'));
        }
        field(70;"Parts Quantity 1";Decimal)
        {
        }
        field(71;"Parts Part Amount 1";Decimal)
        {
        }
        field(72;"Parts Pay Code 2";Option)
        {
            OptionCaption = ' ,2';
            OptionMembers = " ","2";
        }
        field(73;"Parts Local Flag 2";Code[1])
        {
        }
        field(74;"Parts Parts No. 2";Code[20])
        {
            TableRelation = Item."No." WHERE ("Inventory Posting Group"=filter('N_PARTS'));
        }
        field(75;"Parts Quantity 2";Decimal)
        {
        }
        field(76;"Parts Part Amount 2";Decimal)
        {
        }
        field(77;"Parts Pay Code 3";Option)
        {
            OptionCaption = ' ,2';
            OptionMembers = " ","2";
        }
        field(78;"Parts Local Flag 3";Code[1])
        {
        }
        field(79;"Parts Parts No. 3";Code[20])
        {
            TableRelation = Item."No." WHERE ("Inventory Posting Group"=filter('N_PARTS'));
        }
        field(80;"Parts Quantity 3";Decimal)
        {
        }
        field(81;"Parts Part Amount 3";Decimal)
        {
        }
        field(82;"Parts Pay Code 4";Option)
        {
            OptionCaption = ' ,2';
            OptionMembers = " ","2";
        }
        field(83;"Parts Local Flag 4";Code[1])
        {
        }
        field(84;"Parts Parts No. 4";Code[20])
        {
            TableRelation = Item."No." WHERE ("Inventory Posting Group"=filter('N_PARTS'));
        }
        field(85;"Parts Quantity 4";Decimal)
        {
        }
        field(86;"Parts Part Amount 4";Decimal)
        {
        }
        field(87;"Parts Pay Code 5";Option)
        {
            OptionCaption = ' ,2';
            OptionMembers = " ","2";
        }
        field(88;"Parts Local Flag 5";Code[1])
        {
        }
        field(89;"Parts Parts No. 5";Code[20])
        {
            TableRelation = Item."No." WHERE ("Inventory Posting Group"=filter('N_PARTS'));
        }
        field(90;"Parts Quantity 5";Decimal)
        {
        }
        field(91;"Parts Part Amount 5";Decimal)
        {
        }
        field(92;"Parts Pay Code 6";Option)
        {
            OptionCaption = ' ,2';
            OptionMembers = " ","2";
        }
        field(93;"Parts Local Flag 6";Code[1])
        {
        }
        field(94;"Parts Parts No. 6";Code[20])
        {
            TableRelation = Item."No." WHERE ("Inventory Posting Group"=filter('N_PARTS'));
        }
        field(95;"Parts Quantity 6";Decimal)
        {
        }
        field(96;"Parts Part Amount 6";Decimal)
        {
        }
        field(97;"O.F.P. Local Flag";Code[1])
        {
        }
        field(98;"O.F.P. No.";Code[15])
        {
        }
        field(99;"PRR/PWR";Decimal)
        {
        }
        field(100;"Part Total";Decimal)
        {
        }
        field(101;"Total Claim Amount";Decimal)
        {
        }
        field(102;"Process Date";Date)
        {
        }
        field(103;"Dist's Claim Adjust Labor %";Decimal)
        {
        }
        field(104;"Dist's Claim Adjust Sublet %";Decimal)
        {
        }
        field(105;"Dist's Claim Adjust Parts %";Decimal)
        {
        }
        field(106;"Dist. Comment (1)";Text[50])
        {
        }
        field(107;Dummy;Text[50])
        {
        }
        field(108;"AC First Install date";Date)
        {
        }
        field(109;"AC First Install KM";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(110;"Prev. Repair Order No.";Text[7])
        {
        }
        field(111;"Prev. Repair Date";Date)
        {
        }
        field(112;"Prev. Repair KM";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(113;"Prev. Invoice No.";Code[7])
        {
        }
        field(114;"Curr. Invoice No.";Code[7])
        {
        }
        field(115;"Sales Ledger No.";Integer)
        {
            TableRelation = "Item Ledger Entry"."Entry No." WHERE ("Source No."=FIELD("Dealer Code"));

            trigger OnValidate()
            begin
                IF ItemLedger.GET("Sales Ledger No.") THEN
                BEGIN
                ItemLedger.CALCFIELDS(ItemLedger."Chassis No.");
                VALIDATE(VIN,ItemLedger."Chassis No.");
                "VIN-WMI" := COPYSTR(VIN,1,3);
                "VIN-VDS" := COPYSTR(VIN,4,5);
                "VIN-CD"  := COPYSTR(VIN,10,1);
                "VIN-VIS" := COPYSTR(VIN,11);
                END;
            end;
        }
        field(116;VIN;Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"Dealer Code","TWC No.")
        {
            Clustered = true;
        }
        key(Key2;"Distributors Code")
        {
        }
    }

    fieldgroups
    {
    }

    var
        ItemLedger: Record "Item Ledger Entry";
        Custrec: Record Customer;
        ItemRec: Record Item;
}

