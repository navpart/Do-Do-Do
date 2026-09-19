table 50097 "Entry Table GUC"
{

    fields
    {
        field(1; GUC; Code[10])
        {
        }
        field(2; "Document No."; Code[20])
        {
            TableRelation = "Purch. Rcpt. Header";
        }
        field(3; "Location Code"; Code[20])
        {
            TableRelation = Location WHERE("Use As In-Transit" = CONST(false));
        }
    }

    keys
    {
        key(Key1; GUC)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }


    procedure PerformTransfer1()
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
        LocationRec: Record Location;
        MainLocCode: Code[20];
        TransferHeader: Record "Transfer Header";
        TransferHeader2: Record "Transfer Header";
        transline: Record "Transfer Line";
        lineno: Integer;
        ReservRec: Record "Reservation Entry";
        ReservRec2: Record "Reservation Entry";
        ResEntry: Integer;
        ItemLedgerEntry2: Record "Item Ledger Entry";
        ItemLedgerEntry3: Record "Item Ledger Entry";
    begin
        ItemLedgerEntry.SETCURRENTKEY("Location Code", "Document No.", Open);
        TESTFIELD("Document No.");
        ItemLedgerEntry.SETRANGE("Document No.", "Document No.");
        ItemLedgerEntry.SETFILTER("Location Code", '<>%1', '');
        ItemLedgerEntry.SETRANGE(Open, TRUE);
        ItemLedgerEntry.SETRANGE("On Transfer Line", FALSE);
        IF ItemLedgerEntry.FINDSET THEN BEGIN
            LocationRec.GET(ItemLedgerEntry."Location Code");
            MainLocCode := LocationRec."Main Location";
            REPEAT
                CLEAR(TransferHeader);
                //Transfer Header
                TransferHeader.INIT;
                TransferHeader."Transfer-from Code" := ItemLedgerEntry."Location Code";
                TransferHeader."Transfer-to Code" := MainLocCode;
                TransferHeader."In-Transit Code" := 'TRANSIT';
                TransferHeader."Posting Date" := TODAY;
                TransferHeader."Shipment Date" := TODAY;
                TransferHeader."Receipt Date" := TODAY;
                TransferHeader."GIT Receipt No." := "Document No.";
                TransferHeader."Shortcut Dimension 1 Code" := ItemLedgerEntry."Global Dimension 1 Code";
                TransferHeader."Shortcut Dimension 2 Code" := ItemLedgerEntry."Global Dimension 2 Code";
                TransferHeader.INSERT(TRUE);
                TransferHeader.VALIDATE("Posting Date", TODAY);

                TransferHeader2.SETRANGE("No.");
                TransferHeader2.SETRANGE("GIT Receipt No.", "Document No.");
                TransferHeader2.SETRANGE("Transfer-from Code", TransferHeader."Transfer-from Code");
                TransferHeader2.SETRANGE("Transfer-to Code", TransferHeader."Transfer-to Code");
                IF TransferHeader2.FINDLAST THEN
                    TransferHeader."No." := TransferHeader2."No.";
                //Transfer Lines
                ItemLedgerEntry2.SETRANGE("Document No.", "Document No.");
                ItemLedgerEntry2.SETRANGE("Location Code", ItemLedgerEntry."Location Code");
                ItemLedgerEntry2.SETRANGE(Open, TRUE);
                ItemLedgerEntry2.SETRANGE("On Transfer Line", FALSE);
                IF ItemLedgerEntry2.FINDSET THEN BEGIN
                    REPEAT
                        transline.INIT;
                        transline."Document No." := TransferHeader2."No.";
                        transline."Transfer-from Code" := TransferHeader2."Transfer-from Code";
                        transline."Transfer-to Code" := TransferHeader2."Transfer-to Code";
                        transline."In-Transit Code" := TransferHeader2."In-Transit Code";
                        transline."Shipment Date" := TransferHeader2."Shipment Date";
                        transline."Receipt Date" := TransferHeader2."Receipt Date";
                        transline.Status := TransferHeader2.Status;
                        transline."Line No." := ItemLedgerEntry2."Document Line No.";
                        transline.VALIDATE(transline."Item No.", ItemLedgerEntry2."Item No.");
                        transline.VALIDATE(transline.Quantity, ItemLedgerEntry2.Quantity);
                        transline."Shortcut Dimension 1 Code" := TransferHeader2."Shortcut Dimension 1 Code";
                        transline."Shortcut Dimension 2 Code" := TransferHeader2."Shortcut Dimension 2 Code";
                        transline.INSERT;
                        lineno := transline."Line No.";
                        IF ReservRec2.FINDLAST THEN ResEntry := ReservRec2."Entry No.";
                        ResEntry := ResEntry + 1;
                        ReservRec.INIT;
                        ReservRec."Entry No." := ResEntry;
                        ReservRec.Positive := FALSE;
                        ReservRec."Item No." := ItemLedgerEntry2."Item No.";
                        ReservRec."Location Code" := TransferHeader2."Transfer-from Code";
                        ReservRec.VALIDATE(ReservRec."Quantity (Base)", -1);
                        ReservRec."Reservation Status" := ReservRec."Reservation Status"::Surplus;
                        ReservRec.Description := ItemLedgerEntry2.Description;
                        ReservRec."Creation Date" := WORKDATE;
                        ReservRec."Source ID" := TransferHeader2."No.";
                        ReservRec."Source Ref. No." := ItemLedgerEntry2."Document Line No.";
                        ReservRec."Serial No." := ItemLedgerEntry2."Serial No.";
                        ReservRec."Created By" := USERID;
                        ReservRec.VALIDATE(ReservRec.Quantity, -1);
                        ReservRec."Source Type" := 5741;
                        ReservRec."Source Subtype" := 0;
                        ReservRec."Item Tracking" := ReservRec."Item Tracking"::"Serial No.";
                        ReservRec."Shipment Date" := TransferHeader2."Shipment Date";
                        ReservRec."Expected Receipt Date" := 0D;
                        ReservRec."Engine No." := ItemLedgerEntry2."Engine No.";
                        ReservRec."Registration No." := ItemLedgerEntry2."Registration No.";
                        ReservRec."Chasis No." := ItemLedgerEntry2."Chassis No.";
                        ReservRec."Exterior Colour Code" := ItemLedgerEntry2."Exterior Colour Code";
                        ReservRec."Exterior Colour Name" := ItemLedgerEntry2."Exterior Colour Name";
                        ReservRec."Key No." := ItemLedgerEntry2."Key No.";
                        ReservRec.INSERT(TRUE);
                        ResEntry := ResEntry + 1;
                        ReservRec."Entry No." := ResEntry;
                        ReservRec.Positive := TRUE;
                        ReservRec."Location Code" := TransferHeader2."Transfer-to Code";
                        ReservRec.VALIDATE(ReservRec."Quantity (Base)", 1);
                        ReservRec.VALIDATE(ReservRec.Quantity, 1);
                        ReservRec."Shipment Date" := 0D;
                        ReservRec."Expected Receipt Date" := TransferHeader2."Receipt Date";
                        ReservRec."Source Subtype" := 1;
                        ReservRec.INSERT(TRUE);
                        ItemLedgerEntry2."On Transfer Line" := TRUE;
                        ItemLedgerEntry2.MODIFY;
                    UNTIL ItemLedgerEntry2.NEXT = 0;
                    ItemLedgerEntry3.SETRANGE("Document No.", "Document No.");
                    ItemLedgerEntry3.SETRANGE(Open, TRUE);
                    ItemLedgerEntry3.SETRANGE("On Transfer Line", FALSE);
                    ItemLedgerEntry3.SETRANGE("Location Code", '<>%1', ItemLedgerEntry2."Location Code");
                    IF ItemLedgerEntry3.FINDFIRST THEN
                        ItemLedgerEntry."Location Code" := ItemLedgerEntry3."Location Code";
                END;
            UNTIL ItemLedgerEntry.NEXT = 0;
            MESSAGE('DONE!');
        END
        ELSE
            ERROR('No Item to transfer from the specified Order');
    end;
}

