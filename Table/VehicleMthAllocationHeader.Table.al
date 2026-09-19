table 50034 "Vehicle Mth. Allocation Header"
{
    DataCaptionFields = "Allocation Code", "Customer Name";

    fields
    {
        field(1; "Allocation Code"; Code[20])
        {
            TableRelation = "Production Period"."Period Code";
        }
        field(2; "Transaction Date"; Date)
        {
        }
        field(3; "Customer No."; Code[10])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                IF cusrec.GET("Customer No.") THEN
                    "Customer Name" := cusrec.Name;
            end;
        }
        field(4; "Customer Name"; Text[50])
        {
            Editable = false;
        }
        field(5; "Amount Paid"; Decimal)
        {
        }
        field(6; "Teller No."; Code[20])
        {
        }
        field(7; Bank; Code[10])
        {
        }
        field(8; "Teller Date"; Date)
        {
        }
        field(9; "Amount Allocated"; Decimal)
        {
            CalcFormula = Sum("Vehicle Mth. Allocation Line"."Unit Price" WHERE("Allocation Code" = FIELD("Allocation Code"),
                                                                                 "Customer No." = FIELD("Customer No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Value of Selected Item"; Decimal)
        {
            /* CalcFormula = Sum("Vehicle Mth. Allocation Line".Amount WHERE("Allocation Code" = FIELD(Allocation Code),
                                                                           "Customer No."=FIELD("Customer No."),
                                                                           Selected=CONST(Yes),
                                                                           "Date Selected"=FIELD("Transaction Date")));
            Editable = false;
            FieldClass = FlowField; */
        }
        field(11;"Department Code";Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(1));
        }
        field(12;"Branch Code";Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(2));
        }
        field(13;"Value of Picked Item";Decimal)
        {
            CalcFormula = Sum("Vehicle Mth. Allocation Line".Amount WHERE ("Allocation Code"=FIELD("Allocation Code"),
                                                                           "Customer No."=FIELD("Customer No."),
                                                                           Selected=filter(true),
                                                                           "Date Selected"=FIELD("Transaction Date"),
                                                                           Released=filter(true),
                                                                           Picked=filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14;"Value of Released Item";Decimal)
        {
            CalcFormula = Sum("Vehicle Mth. Allocation Line".Amount WHERE ("Allocation Code"=FIELD("Allocation Code"),
                                                                           "Customer No."=FIELD("Customer No."),
                                                                           Selected=filter(true),
                                                                           "Date Selected"=FIELD("Transaction Date"),
                                                                           Released=filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Allocation Code","Customer No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        cusrec: Record 18;
        Requestrec: Record 50033;
        AllRec: Record 50035;
        ItemLedger: Record 32;
        detcount: Integer;
        LineNo: Integer;
        FiName: Text[50];
        Salehead: Record 36;
        SalesLine: Record 37;
        ReservRec: Record 337;
        AllRec2: Record 50035;
        SalesSetup: Record 311;
        RelList: Boolean;

    
    procedure AssignVehicle()
    var
        SerReser: Record 337;
    begin
        AllRec.SETRANGE(AllRec."Allocation Code","Allocation Code");
        AllRec.SETRANGE(AllRec."Customer No.","Customer No.");
        AllRec.SETRANGE(AllRec.Selected,TRUE);
        AllRec.SETRANGE(AllRec.Released,FALSE);
        AllRec.SETRANGE(AllRec.Picked,FALSE);
        AllRec.SETFILTER(AllRec."Order No.",'%1','');
        IF AllRec.FINDFIRST THEN
         REPEAT

           ItemLedger.SETRANGE(ItemLedger."Item No.",AllRec."Item No.");
           ItemLedger.SETFILTER(ItemLedger."Remaining Quantity",'>%1',0);
           ItemLedger.SETFILTER(ItemLedger."Serial No.",'<>%1','');
           ItemLedger.SETFILTER(ItemLedger."On Transfer Line",'%1',FALSE);
           IF ItemLedger.FINDFIRST THEN BEGIN
              AllRec.VALIDATE(AllRec.Tracking,ItemLedger."Entry No.");
              AllRec.Location := ItemLedger."Location Code";
              AllRec.MODIFY;
           END;
         UNTIL AllRec.NEXT = 0;
    end;

   
    procedure CreateInvoice()
    begin
        LineNo := 10000;
        Salehead.RESET;
        SalesLine.RESET;
        AllRec.SETRANGE(AllRec."Allocation Code","Allocation Code");
        AllRec.SETRANGE(AllRec."Customer No.","Customer No.");
        AllRec.SETRANGE(AllRec.Selected,TRUE);
        AllRec.SETRANGE(AllRec.Released,TRUE);
        AllRec.SETRANGE(AllRec.Picked,TRUE);
        AllRec.SETFILTER(AllRec."Order No.",'%1','');
        IF AllRec.FIND('-') THEN BEGIN
        AllRec.CALCFIELDS(AllRec."Picked Not Invoice");
         /*IF PartEnquiry."Document No." <> '' THEN
         BEGIN
           SaleHead.GET(dtype,PartEnquiry."Document No.");
           SalesLine.SETRANGE(SalesLine."Document No.",SaleHead."No.");
           SalesLine.SETRANGE(SalesLine."Document Type",dtype);
           IF SalesLine.FIND('+') THEN
           BEGIN
             LineNo := SalesLine."Line No." + 10000;
             PartEnquiry.SETFILTER(PartEnquiry."Document No.",'%1','');
           END;
         END
         ELSE*/
          BEGIN
           //SalesSetup.GET;
           Salehead.INIT;
           //Salehead.VALIDATE(Salehead."No. Series",SalesSetup."Auto Sale Invoice No.");
           Salehead."Document Type" := Salehead."Document Type"::Invoice;
           Salehead."No." := '';
           Salehead."Document Date" := "Transaction Date";
           Salehead.VALIDATE(Salehead."Posting Date",TODAY);
           Salehead.VALIDATE(Salehead."Sell-to Customer No.",AllRec."Customer No.");
           Salehead.VALIDATE(Salehead."Shortcut Dimension 1 Code","Department Code");
           Salehead.VALIDATE(Salehead."Shortcut Dimension 2 Code","Branch Code");
           Salehead."Location Code" := AllRec.Location;
           IF Salehead.INSERT(TRUE) THEN;
           END;
             REPEAT
               SalesLine.INIT;
               SalesLine."Document Type" :=SalesLine."Document Type"::Invoice;
               SalesLine.VALIDATE(SalesLine."Document No.",Salehead."No.");
               SalesLine."Line No." := LineNo;
               SalesLine.INSERT(TRUE);
               SalesLine.VALIDATE(SalesLine."Shortcut Dimension 1 Code",Salehead."Shortcut Dimension 1 Code");
               SalesLine.VALIDATE(SalesLine."Shortcut Dimension 2 Code",Salehead."Shortcut Dimension 2 Code");
               SalesLine.VALIDATE(SalesLine."Sell-to Customer No.",Salehead."Sell-to Customer No.");
               SalesLine.Type := SalesLine.Type::Item;
               SalesLine.VALIDATE(SalesLine."No.",AllRec."Item No.");
               SalesLine."Location Code" := AllRec.Location;
               SalesLine.VALIDATE(SalesLine."Variant Code",AllRec.Variant);
               SalesLine."Quantity Demanded" := AllRec."Picked Not Invoice";
               SalesLine.VALIDATE(SalesLine.Quantity,AllRec."Picked Not Invoice");
               SalesLine.MODIFY;
               AllRec2.COPYFILTERS(AllRec);
               AllRec2.SETRANGE(AllRec2."Item No.",AllRec."Item No.");
               IF AllRec2.FINDFIRST THEN
               REPEAT
               ReservRec.FINDLAST;
               ReservRec.INIT;
               ReservRec."Entry No." := ReservRec."Entry No."+ 1;
               ReservRec.VALIDATE(ReservRec."Item No.",AllRec."Item No.");
               ReservRec."Location Code":=AllRec2.Location;
               ReservRec."Quantity (Base)" := -1;
               ReservRec."Reservation Status" := ReservRec."Reservation Status"::Surplus;
               ReservRec."Creation Date" := TODAY;
               ReservRec."Source Type" := 37;
               //ReservRec."Source Subtype" := SalesLine."Document Type";
               ReservRec."Source ID" := SalesLine."Document No.";
               ReservRec."Source Ref. No." := SalesLine."Line No.";
               ReservRec.Description := AllRec2."Model Name";
               ReservRec."Serial No." := AllRec2."Serial No.";
               ReservRec.Quantity := 1;
               ReservRec."Qty. to Handle (Base)" := 1;
               ReservRec."Engine No." := AllRec2."Engine No.";
               ReservRec."Key No.":= AllRec2."Key No.";
               ReservRec.INSERT;
        
               AllRec2."Order No.":= Salehead."No.";
               AllRec2.Invoiced := TRUE;
               AllRec2.MODIFY;
        
             UNTIL AllRec2.NEXT = 0;
               LineNo := LineNo + 10000;
               AllRec := AllRec2;
             UNTIL AllRec.NEXT = 0;
           END;

    end;

   
    procedure Breakrequest()
    begin
        LineNo := 10000;
        Requestrec.SETRANGE(Requestrec."Customer Code","Customer No.");
        Requestrec.SETRANGE(Requestrec."Production Month","Allocation Code");
        Requestrec.SETFILTER(Requestrec."Allocated Quantity",'>0');
        Requestrec.SETFILTER(Requestrec.Approved,'yes');

        IF Requestrec.FIND('-') THEN
        REPEAT
          AllRec.INIT;
          AllRec."Allocation Code" := "Allocation Code";
          AllRec."Customer No." := "Customer No.";
          AllRec."Line No." := LineNo;
          AllRec."Model No." := Requestrec."Model No.";
          AllRec."Model Name" := Requestrec."Model Name";
          AllRec.Quantity := 1;
          AllRec.Colour := Requestrec.Colour;
          AllRec."Seat Option" := Requestrec."Seat Options";
          AllRec.Transimision := Requestrec.Transmission;
          AllRec."Item No." := Requestrec."Item No.";
          AllRec."A/C" := Requestrec."A/C";
          AllRec."Fuel Type":= Requestrec."Fuel Type";
          AllRec.Body := Requestrec.Body;
          AllRec."Colour Description" := Requestrec."Colour Description";
          AllRec.Type := Requestrec.Type;
          AllRec.Rim  := Requestrec.Rim;
          AllRec.INSERT;
          detcount := 1;
          LineNo := LineNo + 10000;
          IF Requestrec."Allocated Quantity" > 1 THEN
          REPEAT
            AllRec."Line No." := LineNo;
            detcount := detcount + 1;
            AllRec.INSERT;
            LineNo := LineNo + 10000;
           UNTIL detcount = Requestrec."Allocated Quantity";
          UNTIL Requestrec.NEXT = 0;
    end;
}

