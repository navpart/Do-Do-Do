codeunit 50000 MySubscribers
{
    Permissions = tabledata "Sales Invoice Header" = rimd, tabledata "Sales Cr.Memo Header" = rimd, tabledata "Sales Invoice Line" = rimd,
        tabledata "Sales Shipment Header" = rimd, tabledata "Sales Cr.Memo Line" = rimd, tabledata "Service Invoice Header" = rimd,
        tabledata "Service Cr.Memo Header" = rimd, tabledata "Service Invoice Line" = rimd, tabledata "Service Cr.Memo Line" = rimd;

    EventSubscriberInstance = StaticAutomatic;


    [EventSubscriber(ObjectType::Table, 17, 'OnAfterCopyGLEntryFromGenJnlLine', '', false, false)]

    procedure UpdateGLEntry_OnAfterCopyGLEntryFromGenJnlLine(var GLEntry: Record "G/L Entry"; var GenJournalLine: Record "Gen. Journal Line")

    var

    begin

        GLEntry."Procument No." := GenJournalLine."Procurement No.";
    end;


    [EventSubscriber(ObjectType::Table, 21, 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', false, false)]

    procedure UpdateCustLedEntry_OnAfterCopyCustLedgerEntryFromGenJnlLine(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")

    var


    Begin
        CustLedgerEntry."Serial No" := GenJournalLine."Serial No";
        CustLedgerEntry."Loan ID" := GenJournalLine."Loan ID";
        CustLedgerEntry."Loan Type" := GenJournalLine."Loan Type";
    End;


    [EventSubscriber(ObjectType::Table, 37, 'OnAfterValidateEvent', 'Location Code', true, true)]

    procedure LocationCode_OnValidate(VAR Rec: Record "Sales Line"; VAR xRec: Record "Sales Line"; CurrFieldNo: Integer)
    var
        SalesLine: Record "Sales Line";
        Location: Record Location;
        UserSetup: Record "User Setup";

    begin
        IF Location.GET(SalesLine."Location Code") THEN
            IF Location."With Accessory" THEN
                SalesLine.Accessory := TRUE ELSE
                SalesLine.Accessory := FALSE;

        IF Location.GET(SalesLine."Location Code") THEN
            IF Location."VRI Location" = TRUE THEN
                MESSAGE('You are picking from a VRI Location!');

        UserSetup.GET(USERID);
        IF ((SalesLine.Type = SalesLine.Type::Item) AND (SalesLine."Posting Group" = 'N_CARS')) THEN BEGIN
            IF Location.GET(SalesLine."Location Code") THEN BEGIN
                IF (Location."Monitored Location" = TRUE) AND (UserSetup."Access to Monitor Location" = FALSE) THEN
                    ERROR('You are not allowed to sell from this Location. Please Contact your Superior for Authorization!')
            END
        end;
    end;

    [EventSubscriber(ObjectType::Table, 37, 'OnAfterValidateEvent', 'Quantity', true, true)]

    procedure Quantity_OnValidate(VAR Rec: Record "Sales Line"; VAR xRec: Record "Sales Line"; CurrFieldNo: Integer)

    var
        SalesLine: Record "Sales Line";
        PurchInvLine: Record "Purch. Inv. Line";

    begin
        IF SalesLine."Variant Code" = 'AIR' THEN BEGIN
            PurchInvLine.SETRANGE("No.", SalesLine."No.");
            IF PurchInvLine.FINDLAST THEN
                SalesLine.Validate("Unit Price", PurchInvLine."Total Retail Price Excl. VAT");
        END;
    end;

    [EventSubscriber(ObjectType::Table, 37, 'OnAfterValidateEvent', 'Variant Code', true, true)]

    procedure VariantCode_OnValidate(VAR Rec: Record "Sales Line"; VAR xRec: Record "Sales Line"; CurrFieldNo: Integer)

    var
        SalesLine: Record "Sales Line";
        PurchInvLine: Record "Purch. Inv. Line";

    begin
        IF SalesLine."Variant Code" = 'AIR' THEN BEGIN
            PurchInvLine.SETRANGE("No.", SalesLine."No.");
            IF PurchInvLine.FINDLAST THEN
                SalesLine.Validate("Unit Price", PurchInvLine."Total Retail Price Excl. VAT");
        END;
    end;

    [EventSubscriber(ObjectType::Table, 39, 'OnAfterValidateEvent', 'Direct Unit Cost', true, true)]

    procedure DirectUnitCost_OnAfterValidate(VAR Rec: Record "Purchase Line"; VAR xRec: Record "Purchase Line"; CurrFieldNo: Integer)

    var
        PurchLine: Record "Purchase Line";
        Item: Record Item;

    begin
        IF Item.GET(PurchLine."No.") THEN BEGIN
            // "Landing Cost" := Item."Factor (Air)" * "Direct Unit Cost";
            PurchLine."Landing Cost" := 1.7 * PurchLine."Direct Unit Cost";
            PurchLine."Landing Cost (LCY)" := PurchLine."Landing Cost" * 400;
            PurchLine."Profit Margin" := PurchLine."Landing Cost (LCY)" * 0.15;
            PurchLine."Total Retail Price Excl. VAT" := PurchLine."Landing Cost (LCY)" + PurchLine."Profit Margin";
            PurchLine."VAT on Retail Price" := PurchLine."Total Retail Price Excl. VAT" * 0.05;
            PurchLine."Total Retail Price Inclu. VAT" := PurchLine."Total Retail Price Excl. VAT" + PurchLine."VAT on Retail Price";
        END;

    end;

    [EventSubscriber(ObjectType::Table, 39, 'OnCopyFromItemOnAfterCheck', '', true, true)]

    procedure Add_OnCopyFromItemOnAfterCheck(PurchaseLine: Record "Purchase Line"; Item: Record Item)

    Begin
        PurchaseLine.Colour := Item."Pre-Owned Colour";
        PurchaseLine."Year of Production" := Item."Year of Production";
        PurchaseLine."Estimated Mileage" := Item."Estimated Mileage";
    End;

    [EventSubscriber(ObjectType::Table, 83, 'OnAfterCopyItemJnlLineFromPurchHeader', '', true, true)]

    procedure Add_OnAfterCopyItemJnlLineFromPurchHeader(VAR ItemJnlLine: Record "Item Journal Line"; PurchHeader: Record "Purchase Header")

    begin
        ItemJnlLine.Description := PurchHeader."Posting Description";
    end;

    [EventSubscriber(ObjectType::Table, 83, 'OnAfterCopyItemJnlLineFromPurchLine', '', true, true)]

    procedure Add_OnAfterCopyItemJnlLineFromPurchLine(VAR ItemJnlLine: Record "Item Journal Line"; PurchLine: Record "Purchase Line")

    var

    begin
        ItemJnlLine."Year of Production" := PurchLine."Year of Production";
    end;

    [EventSubscriber(ObjectType::Table, 383, 'OnAfterCopyFromGenJnlLine', '', true, true)]

    procedure Add_OnAfterCopyFromGenJnlLine(VAR DtldCVLedgEntryBuffer: Record 383; GenJnlLine: Record "Gen. Journal Line")

    var

    begin
        DtldCVLedgEntryBuffer."Loan ID" := GenJnlLine."Loan ID";
    end;

    [EventSubscriber(ObjectType::Table, 5740, 'OnAfterCheckBeforePost', '', true, true)]

    procedure Add_OnAfterCheckBeforePost(var TransferHeader: Record "Transfer Header")

    Begin
        TransferHeader.TransferControl();
    End;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnBeforeActionEvent', 'PreviewPosting', false, false)]

    procedure ValidatePreviewPosting(var Rec: Record "Sales Header")

    begin
        Rec.PostingControl();
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnBeforeActionEvent', 'Post', false, false)]

    procedure ValidatePost(var Rec: Record "Sales Header")
    begin
        Rec.PostingControl();
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnAfterActionEvent', 'Post', false, false)]

    procedure CallAPIAfterSalesOrderPost(var Rec: Record "Sales Header")
    var
        CallAPI: Codeunit "Call API";
    begin
        CallAPI.SendDealerNotification(Rec."No.", 'Parts');
    end;


    [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnBeforeActionEvent', 'PostAndNew', false, false)]

    procedure ValidatePostAndNew(var Rec: Record "Sales Header")

    begin
        Rec.PostingControl();
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnBeforeActionEvent', 'PostAndSend', false, false)]

    procedure ValidatePostAndSend(var Rec: Record "Sales Header")

    begin
        Rec.PostingControl();
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Credit Memo", 'OnBeforeActionEvent', 'Post', false, false)]

    procedure ValidatePostSalesCrMemo(var Rec: Record "Sales Header")

    Begin
        Rec.PostSalesCreditMemoControl();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', true, true)]
    procedure ChangeFinancialReport(ReportId: Integer; var NewReportId: Integer)

    begin
        if ReportId = Report::"Account Schedule" then
            NewReportId := Report::"Account Schedule2";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', true, true)]
    procedure ChangeCustmerItemSalesReport(ReportId: Integer; var NewReportId: Integer)

    begin
        if ReportId = Report::"Customer/Item Sales" then
            NewReportId := Report::"Customer/Item Sales2";
    end;

    /* [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', true, true)]
    procedure ChangeCustmerDetailTrialBal(ReportId: Integer; var NewReportId: Integer)

    begin
        if ReportId = Report::"Customer - Detail Trial Bal." then
            NewReportId := Report::"Customer - Detail Trial Bal.2";
    end;
 */
    [EventSubscriber(ObjectType::Codeunit, codeunit::"TransferOrder-Post Shipment", 'OnAfterInsertTransShptHeader', '', false, false)]
    procedure AddOnAfterInsertTransShptHeader(var TransferHeader: Record "Transfer Header"; var TransferShipmentHeader: Record "Transfer Shipment Header")

    Begin
        TransferShipmentHeader."COF No." := TransferHeader."COF No.";
        TransferShipmentHeader.Modify();
    End;


    [EventSubscriber(ObjectType::Codeunit, codeunit::"TransferOrder-Post Receipt", 'OnAfterInsertTransRcptHeader', '', false, false)]
    procedure AddOnAfterInsertTransRcptHeader(var TransRcptHeader: Record "Transfer Receipt Header"; var TransHeader: Record "Transfer Header")

    Begin
        TransRcptHeader."COF No." := TransHeader."COF No.";
        TransRcptHeader.Modify();
    End;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterOnInsert', '', false, false)]
    procedure OnAfterInsertSalesHeader(var SalesHeader: Record "Sales Header")
    var
        UserSetup: Record "User Setup";
    begin

        IF UserSetup.GET(USERID) THEN
            SalesHeader."Shortcut Dimension 1 Code" := UserSetup.Department;

    end;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"Shipment Header - Edit", 'OnBeforeSalesShptHeaderModify', '', false, false)]
    procedure AddOnBeforeSalesShptHeaderModify(var SalesShptHeader: Record "Sales Shipment Header"; FromSalesShptHeader: Record "Sales Shipment Header")

    begin
        SalesShptHeader."Acknowledged Doc Link" := FromSalesShptHeader."Acknowledged Doc Link";
        SalesShptHeader."Audit Summary" := FromSalesShptHeader."Audit Summary";
    end;


    [EventSubscriber(ObjectType::Page, Page::"Service Order", 'OnBeforeActionEvent', 'Post', false, false)]

    procedure ValidateServPost(var Rec: Record "Service Header")

    begin
        Rec.CheckControls();
    end;

    [EventSubscriber(ObjectType::Page, Page::"Service Order", 'OnBeforeActionEvent', 'Preview', false, false)]

    procedure ValidateServPreview(var Rec: Record "Service Header")

    begin
        Rec.CheckControls();
    end;

    [EventSubscriber(ObjectType::Page, Page::"Service Lines", 'OnBeforeActionEvent', 'Post', false, false)]

    procedure ValidateServLinePost(var Rec: Record "Service Line")

    begin
        Rec.ServLineCheckControls();
    end;

    [EventSubscriber(ObjectType::Page, Page::"Service Lines", 'OnBeforeActionEvent', 'Preview', false, false)]

    procedure ValidateServLinePreview(var Rec: Record "Service Line")

    begin
        Rec.ServLineCheckControls();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', false, false)]
    procedure UpdatePurchaseDateOnAfterInitItemLedgEntry(var NewItemLedgEntry: Record "Item Ledger Entry"; var ItemJournalLine: Record "Item Journal Line")
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        ItemLedgerEntry.SetRange("Serial No.", ItemJournalLine."Serial No.");
        if ItemLedgerEntry.FindFirst() then
            NewItemLedgEntry."Purchase Date" := ItemLedgerEntry."Posting Date";
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Tracking Summary", 'OnAfterUpdateSelectedQuantity', '', false, false)]
    local procedure OnAfterUpdateSelectedQuantity(var EntrySummary: Record "Entry Summary"; var SelectedQuantity: Decimal)
    var

    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterInsertInvoiceHeader', '', false, false)]
    procedure IRNOnAfterInsertInvoiceHeader(var SalesHeader: Record "Sales Header"; var SalesInvHeader: Record "Sales Invoice Header")
    var
        Yr: Text;
        Mth: Text;
        Dy: Text;

    begin
        Yr := Format(CurrentDateTime, 0, '<Year4>');
        Mth := Format(CurrentDateTime, 0, '<Month,2>');
        Dy := Format(CurrentDateTime, 0, '<Day,2>');

        SalesInvHeader.IRN := SalesInvHeader."No." + '-' + 'B17E2F91' + '-' + Yr + Mth + Dy;
        SalesInvHeader.Modify();

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterInsertCrMemoHeader', '', false, false)]
    procedure IRNOnAfterInsertCrMemoHeader(var SalesHeader: Record "Sales Header"; var SalesCrMemoHeader: Record "Sales Cr.Memo Header")
    var
        Yr: Text;
        Mth: Text;
        Dy: Text;

    begin
        Yr := Format(CurrentDateTime, 0, '<Year4>');
        Mth := Format(CurrentDateTime, 0, '<Month,2>');
        Dy := Format(CurrentDateTime, 0, '<Day,2>');

        SalesCrMemoHeader.IRN := SalesCrMemoHeader."No." + '-' + 'B17E2F91' + '-' + Yr + Mth + Dy;
        SalesCrMemoHeader.Modify();

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesLines', '', false, false)]
    procedure OnAfterPostSalesLines(var SalesHeader: Record "Sales Header"; var SalesShipmentHeader: Record "Sales Shipment Header"; var SalesInvoiceHeader: Record "Sales Invoice Header"; var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; var ReturnReceiptHeader: Record "Return Receipt Header"; WhseShip: Boolean; WhseReceive: Boolean; var SalesLinesProcessed: Boolean; CommitIsSuppressed: Boolean; EverythingInvoiced: Boolean; var TempSalesLineGlobal: Record "Sales Line" temporary)
    var
        Customer: Record Customer;
        SalesInvLine: Record "Sales Invoice Line";

    begin
        Customer.Get(SalesHeader."Sell-to Customer No.");
        SalesInvLine.SetRange("Document No.", SalesInvoiceHeader."No.");
        if SalesInvLine.FindSet() then
            repeat
                SalesInvLine."IRN" := SalesInvoiceHeader.IRN;
                SalesInvLine.TIN := Customer."VAT Registration No.";
                SalesInvLine.Email := Customer."E-Mail";
                SalesInvLine."Postal Address" := Customer."Address";
                SalesInvLine."Street Name" := Customer."Address 2";
                SalesInvLine."City Name" := Customer."City";
                SalesInvLine."Postal Zone" := Customer."Post Code";
                SalesInvLine.Modify();
            until SalesInvLine.Next() = 0;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesLines', '', false, false)]
    procedure OnAfterPostSalesCrMemoLines(var SalesHeader: Record "Sales Header"; var SalesShipmentHeader: Record "Sales Shipment Header"; var SalesInvoiceHeader: Record "Sales Invoice Header"; var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; var ReturnReceiptHeader: Record "Return Receipt Header"; WhseShip: Boolean; WhseReceive: Boolean; var SalesLinesProcessed: Boolean; CommitIsSuppressed: Boolean; EverythingInvoiced: Boolean; var TempSalesLineGlobal: Record "Sales Line" temporary)
    var
        Customer: Record Customer;
        SalesCrMemoLine: Record "Sales Cr.Memo Line";
        OrigSalesInvHeader: Record "Sales Invoice Header";
        OrigSalesInvLine: Record "Sales Invoice Line";
        IsReversal: Boolean;

    begin
        Customer.Get(SalesHeader."Sell-to Customer No.");

        // credit memo reverses a posted invoice line by line via Applies-to Doc.
        IsReversal := (SalesHeader."Applies-to Doc. Type" = SalesHeader."Applies-to Doc. Type"::Invoice) and
            (SalesHeader."Applies-to Doc. No." <> '') and OrigSalesInvHeader.Get(SalesHeader."Applies-to Doc. No.");

        SalesCrMemoLine.SetRange("Document No.", SalesCrMemoHeader."No.");
        if SalesCrMemoLine.FindSet() then
            repeat
                SalesCrMemoLine."IRN" := SalesCrMemoHeader.IRN;
                SalesCrMemoLine.TIN := Customer."VAT Registration No.";
                SalesCrMemoLine.Email := Customer."E-Mail";
                SalesCrMemoLine."Postal Address" := Customer."Address";
                SalesCrMemoLine."Street Name" := Customer."Address 2";
                SalesCrMemoLine."City Name" := Customer."City";
                SalesCrMemoLine."Postal Zone" := Customer."Post Code";

                if IsReversal then begin
                    OrigSalesInvLine.SetRange("Document No.", OrigSalesInvHeader."No.");
                    OrigSalesInvLine.SetRange("Line No.", SalesCrMemoLine."Line No.");
                    if OrigSalesInvLine.FindFirst() then begin
                        SalesCrMemoLine."Original Document No." := OrigSalesInvLine."Document No.";
                        SalesCrMemoLine."Original IRN" := OrigSalesInvLine."IRN";
                        SalesCrMemoLine."Original Posting Date" := OrigSalesInvHeader."Posting Date";
                    end;
                end;

                SalesCrMemoLine.Modify();
            until SalesCrMemoLine.Next() = 0;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Service Invoice Header", 'OnAfterInsertEvent', '', false, false)]
    procedure IRNOnAfterInsertServiceInvoiceHeader(var Rec: Record "Service Invoice Header"; RunTrigger: Boolean)
    var
        Yr: Text;
        Mth: Text;
        Dy: Text;

    begin
        Yr := Format(CurrentDateTime, 0, '<Year4>');
        Mth := Format(CurrentDateTime, 0, '<Month,2>');
        Dy := Format(CurrentDateTime, 0, '<Day,2>');

        Rec.IRN := Rec."No." + '-' + 'B17E2F91' + '-' + Yr + Mth + Dy;
        Rec.Modify();

    end;

    [EventSubscriber(ObjectType::Table, Database::"Service Cr.Memo Header", 'OnAfterInsertEvent', '', false, false)]
    procedure IRNOnAfterInsertServiceCrMemoHeader(var Rec: Record "Service Cr.Memo Header"; RunTrigger: Boolean)
    var
        Yr: Text;
        Mth: Text;
        Dy: Text;

    begin
        Yr := Format(CurrentDateTime, 0, '<Year4>');
        Mth := Format(CurrentDateTime, 0, '<Month,2>');
        Dy := Format(CurrentDateTime, 0, '<Day,2>');

        Rec.IRN := Rec."No." + '-' + 'B17E2F91' + '-' + Yr + Mth + Dy;
        Rec.Modify();

    end;

    [EventSubscriber(ObjectType::Table, Database::"Service Invoice Line", 'OnAfterInsertEvent', '', false, false)]
    procedure OnAfterInsertServiceInvoiceLine(var Rec: Record "Service Invoice Line"; RunTrigger: Boolean)
    var
        Customer: Record Customer;
        ServiceInvHeader: Record "Service Invoice Header";

    begin
        if ServiceInvHeader.Get(Rec."Document No.") then begin
            if Customer.Get(Rec."Bill-to Customer No.") then begin
                Rec."IRN" := ServiceInvHeader.IRN;
                Rec.TIN := Customer."VAT Registration No.";
                Rec.Email := Customer."E-Mail";
                Rec."Postal Address" := Customer."Address";
                Rec."Street Name" := Customer."Address 2";
                Rec."City Name" := Customer."City";
                Rec."Postal Zone" := Customer."Post Code";
                Rec.Modify();
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Service Cr.Memo Line", 'OnAfterInsertEvent', '', false, false)]
    procedure OnAfterInsertServiceCrMemoLine(var Rec: Record "Service Cr.Memo Line"; RunTrigger: Boolean)
    var
        Customer: Record Customer;
        ServiceCrMemoHeader: Record "Service Cr.Memo Header";

    begin
        if ServiceCrMemoHeader.Get(Rec."Document No.") then begin
            if Customer.Get(Rec."Bill-to Customer No.") then begin
                Rec."IRN" := ServiceCrMemoHeader.IRN;
                Rec.TIN := Customer."VAT Registration No.";
                Rec.Email := Customer."E-Mail";
                Rec."Postal Address" := Customer."Address";
                Rec."Street Name" := Customer."Address 2";
                Rec."City Name" := Customer."City";
                Rec."Postal Zone" := Customer."Post Code";
                Rec."Sell-to Customer Name" := Customer.Name;
                Rec.Modify();
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Service-Post", 'OnDeleteHeaderOnBeforeServiceCrMemoLineInsert', '', false, false)]
    procedure OnDeleteHeaderOnBeforeServiceCrMemoLineInsert(var ServiceHeader: Record "Service Header"; var ServiceCrMemoHeader: Record "Service Cr.Memo Header"; var ServiceCrMemoLine: Record "Service Cr.Memo Line")
    var
        OrigServiceInvHeader: Record "Service Invoice Header";
        OrigServiceInvLine: Record "Service Invoice Line";
    begin
        // credit memo reverses a posted invoice line by line via Applies-to Doc.
        if (ServiceHeader."Applies-to Doc. Type" <> ServiceHeader."Applies-to Doc. Type"::Invoice) or
            (ServiceHeader."Applies-to Doc. No." = '') or not OrigServiceInvHeader.Get(ServiceHeader."Applies-to Doc. No.")
        then
            exit;

        OrigServiceInvLine.SetRange("Document No.", OrigServiceInvHeader."No.");
        OrigServiceInvLine.SetRange("Line No.", ServiceCrMemoLine."Line No.");
        if OrigServiceInvLine.FindFirst() then begin
            ServiceCrMemoLine."Original Document No." := OrigServiceInvLine."Document No.";
            ServiceCrMemoLine."Original IRN" := OrigServiceInvLine."IRN";
            ServiceCrMemoLine."Original Posting Date" := OrigServiceInvHeader."Posting Date";
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Quote to Order", 'OnAfterInsertSalesOrderHeader', '', false, false)]
    procedure SendEmailAfterQuoteToOrder(var SalesOrderHeader: Record "Sales Header"; SalesQuoteHeader: Record "Sales Header")
    var
        Customer: Record Customer;
        UserSetup: Record "User Setup";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        RecipientEmail: Text;
        CustomEmail: Record "Custom Emails";

    begin
        // Get the customer information
        if Customer.Get(SalesOrderHeader."Sell-to Customer No.") then begin

            CustomEmail.Get();
            RecipientEmail := CustomEmail."Finance/Accounts";

            // Build email subject
            EmailSubject := StrSubstNo('Sales Quote %1 Converted to Order %2', SalesQuoteHeader."No.", SalesOrderHeader."No.");

            // Build email body with HTML formatting
            EmailBody := 'Dear Team,';
            EmailBody += '<br><br>';
            EmailBody += StrSubstNo('The Sales Quote <b>%1</b> for customer <b>%2</b> has been successfully converted to Sales Order <b>%3</b>.',
                SalesQuoteHeader."No.",
                Customer.Name,
                SalesOrderHeader."No.");
            EmailBody += '<br><br>';
            EmailBody += '<b>Order Details:</b>';
            EmailBody += '<br>';
            EmailBody += StrSubstNo('Customer: %1', Customer.Name);
            EmailBody += '<br>';
            EmailBody += StrSubstNo('Order Date: %1', SalesOrderHeader."Order Date");
            EmailBody += '<br>';
            EmailBody += StrSubstNo('Order Amount: %1', SalesOrderHeader.Amount);
            EmailBody += '<br><br>';
            EmailBody += 'Please proceed with the necessary order processing.';
            EmailBody += '<br><br>';
            EmailBody += 'Regards,';
            EmailBody += '<br>';
            EmailBody += 'Sales System';

            // Send the email
            if RecipientEmail <> '' then begin
                EmailMessage.Create(RecipientEmail, EmailSubject, EmailBody, true);
                Email.OpenInEditorModally(EmailMessage, Enum::"Email Scenario"::Default);
            end else begin
                Message('Email recipient not found. Please configure email in User Setup for user %1', UserId);
            end;
        end
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order", 'OnBeforeActionEvent', 'Approve', false, false)]
    procedure OnBeforeApproveAction(var Rec: Record "Purchase Header")
    begin
        // Add logic before the Approve action is executed
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order", 'OnAfterActionEvent', 'Approve', false, false)]
    procedure OnAfterApproveAction(var Rec: Record "Purchase Header")
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.Get(USERID);
        if UserSetup."CC Emails" <> '' then begin
            SendApprovalNotification('Purchase Order', Rec."No.", Rec."Posting Description", Rec.UrlText, UserSetup."CC Emails");
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order", 'OnAfterActionEvent', 'Post', false, false)]

    procedure OnAfterPostAction(var Rec: Record "Purchase Header")
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.Get(USERID);
        if UserSetup."CC Emails" <> '' then begin
            SendApprovalNotification('Purchase Order', Rec."No.", Rec."Posting Description", Rec.UrlText, UserSetup."CC Emails");
        end;
    end;

    procedure SendApprovalNotification(DocumentType: Text; DocumentNo: Code[20]; PostingDescription: Text; UrlText: Text; CCEmails: Text)
    var
        NotifierCU: Codeunit "Notifier";
        EmailList: List of [Text];
        EmailArray: array[100] of Text;
        EmailCount: Integer;
        i: Integer;
    begin
        // Convert CCEmails string to List of Text
        if CCEmails <> '' then begin
            EmailCount := StrLen(CCEmails) - StrLen(DelChr(CCEmails, '=', ';')) + 1;
            if EmailCount = 0 then
                EmailCount := 1;

            for i := 1 to EmailCount do begin
                if i < EmailCount then
                    EmailList.Add(DelStr(CCEmails, StrPos(CCEmails, ';')))
                else
                    EmailList.Add(CCEmails);
            end;
        end;

        NotifierCU.NotifyUsersFromUserSetupCC(DocumentType, DocumentNo, PostingDescription, UrlText, EmailList);
    end;



}
