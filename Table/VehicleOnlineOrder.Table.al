table 70049 "Vehicle Online Order"
{

    fields
    {
        field(1; "Order No."; Code[30])
        {
        }
        field(2; "Payment Notification Date"; DateTime)
        {
        }
        field(3; "Order Instruction"; Text[250])
        {
        }
        field(4; "Payment Mode"; Option)
        {
            OptionCaption = ',Available Deposit,Bank Transfer,Cheque,Draft,Available Credit';
            OptionMembers = ,"Available Deposit","Bank Transfer",Cheque,Draft,"Available Credit";
        }
        field(5; "Payment Details"; Text[250])
        {
        }
        field(6; "Payment Instruction"; Text[250])
        {
        }
        field(7; "Dealer Order Date"; DateTime)
        {
        }
        field(8; "Online Order"; Boolean)
        {
        }
        field(10; "FAD Payment Confirmation"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "FAD Payment Confirmation" = TRUE THEN BEGIN
                    CreateSales;
                    CreateSalesLine;

                    DesignatedApprovers.Get();
                    UserSetup2.GET(USERID);
                    SendersName := UserSetup2.Initials;
                    SenderAddress := UserSetup2."E-Mail";
                    "FAD Name" := UserSetup2.Name;
                    "Dealer Payment Date" := CURRENTDATETIME;
                    //"Sales Person" := UserSetup2."Salespers./Purch. Code";
                    "FAD Confirmation DateTime" := CURRENTDATETIME;
                    COMMIT;

                    ReceiverEmail := 'akinmutimi@toyotanigeria.com;adebayo@toyotanigeria.com;chima@toyotanigeria.com;samir@toyotanigeria.com;olukoya@toyotanigeria.com;sunday@toyotanigeria.com';
                    ReceiverEmail := DesignatedApprovers."Payment Notifications";
                    BccAddresses := '';

                    Subject := STRSUBSTNO(PmtText, "Order No.");
                    BodyTxt := STRSUBSTNO(Text003, "Order No.");
                    CreateEmailBody("Order No.", '', BodyTxt);
                    SendEmail(ReceiverEmail, Subject, EmailBody, CcAddresses, SenderAddress);

                    "Approval Status Changed" := TRUE;
                    MODIFY;

                    CallAPI.OnlineOrderingStatus("Order No.", 'Payment', "FAD Name");

                END;
            end;
        }
        field(11; "FAD Name"; Text[100])
        {
        }
        field(12; "FAD Confirmation DateTime"; DateTime)
        {
            Description = 'FAD';
            Editable = false;
        }
        field(13; "Document No."; Code[30])
        {
        }
        field(14; "Customer Name"; Text[30])
        {
        }
        field(15; "Customer No"; Code[10])
        {
        }
        field(16; "Document Type"; Option)
        {
            Editable = true;
            OptionCaption = ' ,Sales Quote,Sales Order,Sales Invoice';
            OptionMembers = " ","Sales Quote","Sales Order","Sales Invoice";
        }
        field(17; "Sent  to Portal"; Boolean)
        {
        }
        field(18; "Approval Status Changed"; Boolean)
        {
        }
        field(19; "Dealer Payment Date"; DateTime)
        {
            Editable = false;
        }
        field(20; "TNL Sales Order No."; Code[10])
        {
        }
        field(21; "Dealer Bank"; Text[250])
        {
        }
        field(22; "TNL Bank"; Text[250])
        {
        }
        field(23; "Amount Paid"; Decimal)
        {
        }
        field(24; "Proof of Payment"; Text[250])
        {
        }
        field(25; "Discount Required"; Boolean)
        {
        }
        field(26; "Additional Instruction"; Text[250])
        {
        }
        field(27; "Discount Reason"; Text[250])
        {
        }
        field(28; "Discount Document URL"; Text[250])
        {
        }
        field(29; "Discount Approved By"; Code[10])
        {

            trigger OnValidate()
            begin
                "Discount Approved Date" := CURRENTDATETIME;
            end;
        }
        field(30; "Discount Approved Date"; DateTime)
        {
        }
        field(31; "Sales Person"; Text[30])
        {
        }
        field(32; "Amount Due"; Decimal)
        {

            trigger OnValidate()
            begin
                Balance := "Amount Due" - "Amount Recieved";
            end;
        }
        field(33; Balance; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                Balance := "Amount Due" - "Amount Recieved";
            end;
        }
        field(34; "Amount Recieved"; Decimal)
        {

            trigger OnValidate()
            begin
                Balance := "Amount Due" - "Amount Recieved";
            end;
        }
        field(35; "Available Credit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Credit Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Customer Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Customer Deposit Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Order No.")
        {
            Clustered = true;
        }
        key(Key2; "Dealer Order Date")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        ERROR('You Cannot delete this record, contact your system administrator!');
    end;

    trigger OnInsert()
    begin
        "Dealer Order Date" := CURRENTDATETIME;
    end;

    var
        SalesHeader: Record 36;
        SalesLine: Record 37;
        SalesLine2: Record 37;
        OrderHeader: Record 70020;
        LineNo: Integer;
        OrderLine: Record 70050;
        ToName: Text[100];
        CCName: Text[100];
        Subject: Text[100];
        Body: Text[500];
        attachement: Text[260];
        Opendialog: Boolean;
        Bcc: Text[100];
        CRLF: Text[2];
        SendersName: Text;
        Addressee: Text;
        UserSetup2: Record 91;
        Mail: Codeunit 397;
        CcAddresses: Text;
        BccAddresses: Text;
        SenderAddress: Text;
        ToAddresses: Text;
        //SMTPMail: Codeunit "400;
        UserSetup: Record 91;
        PmtText: Label 'Payment confirmation: %1';
        Text001: Label 'Order %1 requires your approval.';
        Text002: Label 'Dear';
        SalutationAll: Label 'Dear colleagues,';
        Text003: Label 'Payment for Order %1 has been confirmed. Kindly process the Sales Order.';
        Text004: Label 'Regards,';
        Text005: Label 'Mail sent successfully.';
        Created: Boolean;
        Text006: Label 'Sales Order has been created.';
        ReservationEntry: Record 337;
        ReservationEntry2: Record 337;
        EntryNo: Integer;
        i: Integer;
        Text007: Label 'Serial No.: %1 , Count %2';
        QtyCount: Integer;
        OnlineLocation: Record 70057;
        OnlineLocation2: Record 70057;
        OnlineSelection: Record 70058;
        OnlineSelection2: Record 70058;
        OnlineLocation3: Record 70057;
        OnlineSelection3: Record 70058;
        LineQty: Decimal;
        j: Integer;
        SerialCount: Decimal;
        SerialSelection: Record 70058;
        SelectLocation: Record 70057;
        OnlineSelection5: Record 70058;
        OnlineSelection4: Record 70058;
        OnlineOrderLine: Record 70050;
        SplitItems: Record 70039;
        Item: Record 27;
        OnlineLocationX: Record 70057;
        OnlineSelectionX: Record 70058;
        BodyTxt: Text;
        BodyStream: OutStream;
        NoSeriesManagement: Codeunit "No. Series";
        SalesReceivablesSetup: Record 311;
        SalesReceivablesSetup2: Record 311;
        DesignatedApprovers: Record "Designated Approvers";
        TextApproval: Label 'Your Order %1 has been approved.';
        SenderName: Text[30];
        RecipientAll: Text;
        EmailBody: Text[1024];
        ReceiverEmail: Text;
        CallAPI: Codeunit "Call API";


    procedure CreateSales()
    var
        ItemLedgerEntry: Record 32;
    begin
        OnlineLocationX.DELETEALL;
        OnlineSelectionX.DELETEALL;


        OrderLine.SETCURRENTKEY("Document No", "Line No.");
        OrderLine.SETRANGE("Document No", "Order No.");
        IF OrderLine.FINDSET THEN BEGIN
            REPEAT

                LineQty := OrderLine.Quantity;
                QtyCount := 0;

                ItemLedgerEntry.SETCURRENTKEY("Item No.", Open, "Variant Code", Positive, "Location Code", "Posting Date", "Expiration Date", "Lot No.", "Serial No.", "Exterior Colour Name");
                ItemLedgerEntry.SETRANGE("Item No.", OrderLine."Item No.");
                ItemLedgerEntry.SETRANGE(Open, TRUE);
                ItemLedgerEntry.SETRANGE("Exterior Colour Name", OrderLine."Desired Colour");
                ItemLedgerEntry.SETFILTER("Location Code", '123ORE|129IKO|113LEK|CONSIGNMEN|EXIBITION');
                IF ItemLedgerEntry.FINDSET THEN
                    REPEAT
                        QtyCount := QtyCount + 1;

                        IF NOT OnlineLocation.GET(ItemLedgerEntry."Location Code", ItemLedgerEntry."Item No.") THEN BEGIN
                            OnlineLocation.Location := ItemLedgerEntry."Location Code";
                            OnlineLocation."No." := "Order No.";
                            OnlineLocation."Item No." := ItemLedgerEntry."Item No.";
                            OnlineLocation.INSERT;
                        END;

                        OnlineSelection.INIT;
                        OnlineSelection."Entry No." := ItemLedgerEntry."Entry No.";
                        OnlineSelection."Item No." := ItemLedgerEntry."Item No.";
                        OnlineOrderLine.SETRANGE("Document No", "Order No.");
                        OnlineOrderLine.SETRANGE("Item No.", ItemLedgerEntry."Item No.");
                        IF OnlineOrderLine.FINDFIRST THEN
                            OnlineSelection."Discount Approved" := OnlineOrderLine."Discount Amount Approved";
                        OnlineSelection.Location := ItemLedgerEntry."Location Code";
                        OnlineSelection."Serial No." := ItemLedgerEntry."Serial No.";
                        OnlineSelection."Exterior Color Name" := ItemLedgerEntry."Exterior Colour Name";
                        OnlineSelection."Exterior Color Code" := ItemLedgerEntry."Exterior Colour Code";
                        OnlineSelection."Key No." := ItemLedgerEntry."Key No.";
                        OnlineSelection.Quantity := ItemLedgerEntry.Quantity;
                        OnlineSelection."Online Order No." := "Order No.";
                        OnlineSelection.INSERT;

                    UNTIL (QtyCount = LineQty) OR (ItemLedgerEntry.NEXT = 0);
            UNTIL OrderLine.NEXT = 0;
        END;
    end;

    procedure CreateSalesLine()
    begin
        DesignatedApprovers.Get();
        SalesReceivablesSetup.GET;
        SalesReceivablesSetup."Order Nos." := 'SOV';
        SalesReceivablesSetup.MODIFY;

        OnlineLocation3.SETRANGE("No.", "Order No.");
        IF OnlineLocation3.FINDFIRST THEN BEGIN
            SalesHeader.INIT;
            SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
            SalesHeader."No." := NoSeriesManagement.GetNextNo(SalesReceivablesSetup."Order Nos.", 0D, TRUE);
            SalesHeader."Vehicle Order No." := "Order No.";
            SalesHeader."Online Order" := TRUE;
            SalesHeader."Salesperson Code" := 'CHIM';
            SalesHeader.VALIDATE("Salesperson Code", 'CHIM');
            SalesHeader."Logistics Send to" := DesignatedApprovers.Logistics;
            SalesHeader.INSERT(TRUE);
            SalesHeader.VALIDATE("Sell-to Customer No.", "Customer No");
            SalesHeader.MODIFY;
            REPEAT
                OnlineSelection3.SETRANGE(Location, OnlineLocation3.Location);
                OnlineSelection3.SETRANGE("Item No.", OnlineLocation3."Item No.");
                IF OnlineSelection3.FINDFIRST THEN BEGIN
                    OnlineSelection3.CALCSUMS(Quantity);
                    SalesLine.INIT;
                    SalesLine."Document Type" := SalesLine."Document Type"::Order;
                    SalesLine."Document No." := SalesHeader."No.";
                    SalesLine."Line No." += 10000;
                    SalesLine.Type := SalesLine.Type::Item;
                    SalesLine.VALIDATE("No.", OnlineSelection3."Item No.");
                    SalesLine.VALIDATE("Location Code", OnlineSelection3.Location);
                    SalesLine.VALIDATE(Quantity, OnlineSelection3.Quantity);
                    SalesLine."Exterior Colour Name" := OnlineSelection3."Exterior Color Name";
                    SalesLine.VALIDATE("Line Discount Amount", OnlineSelection3."Discount Approved");
                    SalesLine.INSERT;
                END;
            UNTIL OnlineLocation3.NEXT = 0;
        END;

        "TNL Sales Order No." := SalesHeader."No.";
        "Dealer Payment Date" := CREATEDATETIME(SalesHeader."Order Date", 0T);
        MODIFY;


        SalesLine2.SETRANGE("Document No.", "TNL Sales Order No.");
        IF SalesLine2.FINDFIRST THEN BEGIN
            REPEAT
                OnlineSelection4.SETRANGE("Item No.", SalesLine2."No.");
                OnlineSelection4.SETRANGE(Location, SalesLine2."Location Code");
                IF OnlineSelection4.FINDFIRST THEN BEGIN
                    REPEAT
                        OnlineSelection4."Sales Line No." := SalesLine2."Line No.";
                        OnlineSelection4.MODIFY;
                    UNTIL OnlineSelection4.NEXT = 0;
                END;
            UNTIL SalesLine2.NEXT = 0;
        END;


        ReservationEntry2.FINDLAST;
        EntryNo := ReservationEntry2."Entry No." + 1;

        OnlineSelection5.SETCURRENTKEY("Online Order No.");
        OnlineSelection5.SETRANGE("Online Order No.", "Order No.");
        IF OnlineSelection5.FINDFIRST THEN BEGIN

            REPEAT
                ReservationEntry.INIT;
                ReservationEntry."Entry No." := EntryNo;
                ReservationEntry.Positive := TRUE;
                ReservationEntry.VALIDATE(ReservationEntry."Creation Date", TODAY);
                ReservationEntry."Source Type" := 37;
                ReservationEntry."Source Subtype" := 1;
                ReservationEntry."Source ID" := SalesHeader."No.";
                ReservationEntry."Expected Receipt Date" := SalesHeader."Order Date";
                ReservationEntry."Reservation Status" := ReservationEntry."Reservation Status"::Prospect;
                ReservationEntry."Item Tracking" := ReservationEntry."Item Tracking"::"Serial No.";
                ReservationEntry.VALIDATE(ReservationEntry."Created By", USERID);
                ReservationEntry.VALIDATE("Quantity (Base)", -1);
                ReservationEntry.VALIDATE(Quantity, -1);
                ReservationEntry."Item No." := OnlineSelection5."Item No.";
                ReservationEntry."Source Ref. No." := OnlineSelection5."Sales Line No.";
                ReservationEntry."Location Code" := OnlineSelection5.Location;
                ReservationEntry.VALIDATE("Serial No.", OnlineSelection5."Serial No.");
                ReservationEntry."Exterior Colour Code" := OnlineSelection5."Exterior Color Code";
                ReservationEntry."Engine No." := OnlineSelection5."Engine No.";
                ReservationEntry."Key No." := OnlineSelection5."Key No.";
                ReservationEntry.INSERT(TRUE);
                EntryNo += 1;
            UNTIL OnlineSelection5.NEXT = 0;
        END;

        SalesReceivablesSetup2.GET;
        SalesReceivablesSetup2."Order Nos." := 'SO';
        SalesReceivablesSetup2.MODIFY;
    end;


    procedure CreateEmailBody(DocNo: Code[20]; RecipientInitials: Text; BodyMsg: Text);

    begin

        UserSetup.Get(UserId);

        EmailBody := STRSUBSTNO(SalutationAll, RecipientInitials);
        EmailBody += '<br><br>';
        EmailBody += STRSUBSTNO(BodyMsg, DocNo);
        EmailBody += '<br><br>';
        EmailBody += 'Regards,';
        EmailBody += '<br>';
        EmailBody += UserSetup.Initials;

    end;

    procedure SendEmail(ReceiverEmail: Text; Subject: Text; Body: Text; CCRecipients: Text; BCCRecipients: Text)
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";

    begin
        EmailMessage.Create(ReceiverEmail, Subject, EmailBody, true);
        EmailMessage.AddRecipient(enum::"Email Recipient Type"::Cc, CCRecipients);
        EmailMessage.AddRecipient(Enum::"Email Recipient Type"::Bcc, BCCRecipients);
        Email.OpenInEditorModally(EmailMessage, Enum::"Email Scenario"::Default)

    end;

}

