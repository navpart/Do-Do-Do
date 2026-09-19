table 50025 "Japan Order Update"
{

    fields
    {
        field(1; TMCINV; Code[20])
        {
        }
        field(2; "Case No"; Code[20])
        {
        }
        field(3; "Order No."; Code[20])
        {
            TableRelation = "Purchase Header"."No." WHERE("Document Type" = FILTER('Invoice|Order'));
            ValidateTableRelation = false;
        }
        field(4; "Item No."; Code[20])
        {
        }
        field(5; "Part No."; Code[20])
        {
            TableRelation = Item."No." WHERE("Inventory Posting Group" = filter('N_PARTS'));
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                "Has Substitute" := FALSE;
                "Substitute No." := '';
                ItemSubst.RESET;
                IF ItemRec.GET("Part No.") THEN BEGIN
                    "Supplier No." := ItemRec."Vendor No.";
                    ItemRec.CALCFIELDS(ItemRec."Substitutes Exist");
                    "Has Substitute" := ItemRec."Substitutes Exist";
                    IF "Has Substitute" = TRUE THEN BEGIN
                        ItemSubst.SETRANGE(ItemSubst."No.", ItemRec."No.");
                        IF ItemSubst.FIND('+') THEN
                            "Substitute No." := ItemSubst."Substitute No."
                        ELSE
                            "Substitute No." := ''
                    END;
                    "New Part No." := FALSE;
                END
                ELSE
                    "New Part No." := TRUE;
            end;
        }
        field(6; "Part Name"; Text[50])
        {
        }
        field(7; Qty; Decimal)
        {
        }
        field(9; "Unit Price"; Decimal)
        {
        }
        field(10; Amount; Decimal)
        {
        }
        field(11; "C/O"; Code[20])
        {
        }
        field(12; "Qty on Order"; Decimal)
        {
            CalcFormula = Sum("Purchase Line".Quantity WHERE("Document Type" = filter(Order), "Document No." = FIELD("Order No."), Type = filter(Item), "No." = FIELD("Part No.")));
            FieldClass = FlowField;
        }
        field(13; "Net Qty On Order"; Decimal)
        {
        }
        field(14; "Supplier No."; Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(15; "New Invoice No."; Code[20])
        {
        }
        field(16; "Invoiced Date"; Date)
        {
        }
        field(17; Invoiced; Boolean)
        {
        }
        field(18; "New Part No."; Boolean)
        {
        }
        field(19; "Has Substitute"; Boolean)
        {
        }
        field(20; "Substitute No."; Code[20])
        {
        }
        field(21; "Substitute Supplied"; Boolean)
        {
        }
        field(22; "Sub Qty On Order"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Qty. to Receive" WHERE("Document Type" = filter(Order), "Document No." = FIELD("Order No."), "No." = FIELD("Substitute No.")));
            FieldClass = FlowField;
        }
        field(23; "Serial No."; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Serial No.", TMCINV, "Case No", "Item No.", "Part No.")
        {
            Clustered = true;
        }
        key(Key2; "Supplier No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        JapanOrder: Record "Japan Order Update";
        "JapanOrder 2": Record "Japan Order Update";
        UserSetup: Record "User Setup";
        LineNo: Integer;
        text001: Label 'Delete on Invoice,Keep On Invoice';
        DeleteOnOrder: Integer;
        ItemRec: Record Item;
        ItemSubst: Record "Item Substitution";

    procedure CreateOrder()
    var
        PurchHead: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
        PurchLine2: Record "Purchase Line";
    begin
        LineNo := 10000;
        UserSetup.GET(USERID);
        IF NOT CONFIRM('This Will Create a Purchase order for each supplier specified.\ Are your sure you want to create purchase order'
          , FALSE) THEN
            EXIT;
        DeleteOnOrder := STRMENU(text001);
        JapanOrder.SETCURRENTKEY("Supplier No.");
        JapanOrder.SETFILTER(JapanOrder."Supplier No.", '<>%1', '');
        JapanOrder.SETFILTER(JapanOrder."New Invoice No.", '%1', '');
        JapanOrder.SETFILTER(JapanOrder.Qty, '>%1', 0);
        IF JapanOrder.FIND('-') THEN
            REPEAT
                PurchHead.INIT;
                PurchHead."Document Type" := PurchHead."Document Type"::Order;
                PurchHead."No." := '';
                PurchHead.VALIDATE(PurchHead."Order Date", TODAY);
                PurchHead.VALIDATE(PurchHead."Posting Date", TODAY);
                PurchHead.VALIDATE(PurchHead."Buy-from Vendor No.", JapanOrder."Supplier No.");
                PurchHead.VALIDATE(PurchHead."Pay-to Vendor No.", JapanOrder."Supplier No.");
                PurchHead."Location Code" := UserSetup."Location Code";
                PurchHead."Shortcut Dimension 1 Code" := UserSetup.Department;
                PurchHead.INSERT(TRUE);
                "JapanOrder 2".COPYFILTERS(JapanOrder);
                "JapanOrder 2".SETRANGE("JapanOrder 2"."Supplier No.", JapanOrder."Supplier No.");
                IF "JapanOrder 2".FIND('-') THEN
                    REPEAT
                        PurchLine.INIT;
                        PurchLine."Document Type" := PurchLine."Document Type"::Order;
                        PurchLine."Document No." := PurchHead."No.";
                        PurchLine."Buy-from Vendor No." := "JapanOrder 2"."Supplier No.";
                        PurchLine.VALIDATE(PurchLine.Type, PurchLine.Type::Item);
                        PurchLine.VALIDATE(PurchLine."No.", "JapanOrder 2"."Part No.");
                        PurchLine."Line No." := LineNo;
                        PurchLine.VALIDATE(PurchLine.Quantity, ROUND("JapanOrder 2".Qty, 1));
                        PurchLine."Variant Code" := 'SEA';
                        PurchLine."Location Code" := '113LEK';
                        PurchLine.VALIDATE(PurchLine."Direct Unit Cost", "JapanOrder 2"."Unit Price");
                        PurchLine.INSERT(TRUE);
                        LineNo := LineNo + 10000;
                        "JapanOrder 2"."New Invoice No." := PurchHead."No.";
                        "JapanOrder 2"."Invoiced Date" := TODAY;
                        "JapanOrder 2".Invoiced := TRUE;
                        IF DeleteOnOrder = 1 THEN BEGIN
                            PurchLine2.SETRANGE(PurchLine2."Document No.", "JapanOrder 2"."Order No.");
                            PurchLine2.SETRANGE(PurchLine2."No.", "JapanOrder 2"."Part No.");
                            IF PurchLine2.FIND('-') THEN BEGIN
                                IF PurchLine2.Quantity > "JapanOrder 2".Qty THEN BEGIN
                                    PurchLine2.VALIDATE(PurchLine2.Quantity, (PurchLine2.Quantity - "JapanOrder 2".Qty));
                                    PurchLine2.MODIFY;
                                END
                                ELSE
                                    PurchLine2.DELETE;
                            END
                            ELSE BEGIN
                                PurchLine2.SETRANGE(PurchLine2."Document No.", "JapanOrder 2"."Order No.");
                                PurchLine2.SETRANGE(PurchLine2."No.", "JapanOrder 2"."Substitute No.");
                                IF PurchLine2.FIND('-') THEN BEGIN
                                    IF PurchLine2.Quantity > "JapanOrder 2".Qty THEN BEGIN
                                        PurchLine2.VALIDATE(PurchLine2.Quantity, (PurchLine2.Quantity - "JapanOrder 2".Qty));
                                        PurchLine2.MODIFY;
                                    END
                                    ELSE
                                        PurchLine2.DELETE;
                                END
                            END;
                        END;
                        IF DeleteOnOrder = 1 THEN
                            "JapanOrder 2".DELETE
                        ELSE
                            "JapanOrder 2".MODIFY;
                    UNTIL "JapanOrder 2".NEXT = 0;
            UNTIL JapanOrder.NEXT = 0;
    end;

    procedure InsertItem()
    begin
        JapanOrder.SETFILTER(JapanOrder."New Part No.", '%1', TRUE);
        IF JapanOrder.FIND('-') THEN
            REPEAT
                ItemRec.INIT;
                ItemRec."No." := JapanOrder."Part No.";
                ItemRec.Description := JapanOrder."Part Name";
                ItemRec."Inventory Posting Group" := 'N_PARTS';
                ItemRec."Gen. Prod. Posting Group" := 'PARTS';
                ItemRec."Costing Method" := ItemRec."Costing Method"::Average;
                IF ItemRec.INSERT(TRUE) THEN BEGIN
                    JapanOrder."New Part No." := FALSE;
                    JapanOrder.MODIFY;
                END;
            UNTIL JapanOrder.NEXT = 0;
    end;
}

