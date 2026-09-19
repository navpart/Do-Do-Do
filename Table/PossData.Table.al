table 50030 "Poss Data"
{

    fields
    {
        field(1; "Line No."; Integer)
        {
        }
        field(2; List; Code[10])
        {
        }
        field(3; "Order Type - A"; Code[10])
        {
        }
        field(4; "Distribution Code"; Code[10])
        {
        }
        field(5; Portion; Code[10])
        {
        }
        field(6; "Item No"; Code[10])
        {
        }
        field(7; Partial; Code[10])
        {
        }
        field(8; "Package Type"; Code[10])
        {
        }
        field(9; "Trans Code"; Code[10])
        {
        }
        field(10; "Order Type - B"; Code[10])
        {
        }
        field(11; Urgent; Code[10])
        {
        }
        field(12; "Order Type - C"; Code[10])
        {
        }
        field(13; "B/O"; Code[10])
        {
        }
        field(14; Currency; Code[10])
        {
        }
        field(15; "Process Type"; Code[10])
        {
        }
        field(16; "Rejection Code"; Code[10])
        {
            TableRelation = "Poss Data R/A Code".Code;

            trigger OnValidate()
            begin
                IF RARec.GET("Rejection Code") THEN "R/A Action" := RARec.Action;
            end;
        }
        field(17; "Order No"; Code[20])
        {
            TableRelation = "Purchase Line"."Document No." WHERE("Document Type" = CONST(Order), Type = CONST(Item), "Document No." = FIELD("Order No"));
            ValidateTableRelation = false;
        }
        field(18; Reason; Code[10])
        {
        }
        field(19; "Part No. Supplied"; Code[20])
        {
        }
        field(20; Description; Text[50])
        {
        }
        field(21; "Part No. Ordered"; Code[20])
        {
        }
        field(22; Tarriff; Code[10])
        {
        }
        field(23; Remarks; Text[50])
        {
        }
        field(24; "Inventory CD"; Code[10])
        {
        }
        field(25; TKB; Code[10])
        {
        }
        field(26; Inspection; Code[10])
        {
        }
        field(27; EL; Code[10])
        {
        }
        field(28; "Tra Date"; Date)
        {
        }
        field(29; "Process Q'ty"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(30; "Unit Price"; Decimal)
        {
        }
        field(31; "Q'ty Ordered"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(32; "Part By supplied Q'ty"; Decimal)
        {
            CalcFormula = Sum("Poss Data"."Process Q'ty" WHERE(List = FIELD(List), "Order No" = FIELD("Order No"),
            "Part No. Supplied" = FIELD("Part No. Supplied"), "Tra Date" = FIELD("Tra Date")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }
        field(33; "Part By Ordered Q'ty"; Decimal)
        {
            CalcFormula = Sum("Poss Data"."Q'ty Ordered" WHERE(List = FIELD(List),
                                                                "Order No" = FIELD("Order No"),
                                                                "Part No. Supplied" = FIELD("Part No. Supplied"),
                                                                "Tra Date" = FIELD("Tra Date")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }
        field(34; "R/A Action"; Option)
        {
            OptionCaption = ' ,Delete,Substitute';
            OptionMembers = " ",Delete,Substitute;
        }
        field(35; "Balance Ordered Q'ty"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Qty. to Receive" WHERE("Document No." = FIELD("Order No"), "No." = FIELD("Part No. Supplied")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }
        field(36; "Initial Order Qty"; Decimal)
        {
            CalcFormula = Sum("Purchase Line".Quantity WHERE("Document Type" = CONST(Order),
                                                              "Document No." = FIELD("Order No"),
                                                              Type = CONST(Item),
                                                              "No." = FIELD("Part No. Supplied")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;

        }
        field(37; "Alteration Code"; Code[10])
        {
            TableRelation = "Poss Data R/A Code".Code;

            trigger OnValidate()
            begin
                IF RARec.GET("Alteration Code") THEN "R/A Action" := RARec.Action;
            end;
        }
        field(38; "Processed Amount"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
        key(Key2; List, "Order No", "Item No", "Part No. Supplied", "Tra Date")
        {
            SumIndexFields = "Process Q'ty", "Q'ty Ordered";
        }
        key(Key3; "Order No", "Part No. Supplied")
        {
            SumIndexFields = "Process Q'ty", "Q'ty Ordered";
        }
    }

    fieldgroups
    {
    }

    var
        RARec: Record "Poss Data R/A Code";
        PurcLine: Record "Purchase Line";
        Item: Record Item;
        itemvar: Record "Item Variant";


    procedure deletedup()
    var
        deprec: Record "Poss Data";
        recdup: Record "Poss Data";
    begin


    end;

    procedure SubRec()
    var
        SubtRec: Record "Poss Data";
    begin
        SubtRec.SETFILTER(SubtRec."R/A Action", '<>%1', 0);
        IF SubtRec.FIND('-') THEN
            REPEAT
                PurcLine.SETRANGE(PurcLine."Document Type", PurcLine."Document Type"::Order);
                PurcLine.SETRANGE(PurcLine."Document No.", SubtRec."Order No");
                IF SubtRec."R/A Action" = SubtRec."R/A Action"::Substitute THEN BEGIN
                    PurcLine.SETRANGE(PurcLine."No.", SubtRec."Part No. Ordered");
                    IF PurcLine.FIND('-') THEN BEGIN
                        PurcLine."No." := SubtRec."Part No. Supplied";
                        PurcLine.MODIFY;
                        IF NOT Item.GET(SubtRec."Part No. Supplied") THEN BEGIN
                            Item.INIT;
                            Item.VALIDATE(Item."No.", SubtRec."Part No. Supplied");
                            Item.Description := SubtRec.Description;
                            Item."Inventory Posting Group" := 'N_PARTS';
                            Item.VALIDATE(Item."Gen. Prod. Posting Group", 'PARTS');
                            Item."Costing Method" := Item."Costing Method"::Average;
                            Item.INSERT(TRUE);
                            itemvar.INIT;
                            itemvar."Item No." := SubtRec."Part No. Supplied";
                            itemvar.Code := 'Sea';
                            itemvar.Description := SubtRec.Description;
                            itemvar.INSERT;
                        END;
                    END;
                END
                ELSE
                    IF RARec.Action = RARec.Action::Delete THEN BEGIN
                        PurcLine.SETRANGE(PurcLine."No.", SubtRec."Part No. Supplied");
                        IF PurcLine.FIND('-') THEN
                            PurcLine.DELETE;
                    END;
            UNTIL SubtRec.NEXT = 0;
    end;

    procedure RAAction()
    begin
    end;
}

