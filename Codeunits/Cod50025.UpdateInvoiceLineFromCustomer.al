codeunit 50025 "Update Invoice Line Customer"
{

    Permissions = TableData "Sales Invoice Line" = RM;

    procedure UpdateSalesInvoiceLineFromCustomer(var SalesInvoiceLine: Record "Sales Invoice Line")
    var
        Customer: Record Customer;
        CustomerNo: Code[20];
    begin
        // Show dialog to select customer
        CustomerNo := SelectCustomer();
        if CustomerNo = '' then
            exit;

        // Get customer record
        if not Customer.Get(CustomerNo) then
            Error('Customer %1 not found.', CustomerNo);

        // Update Sales Invoice Line fields from Customer
        UpdateFieldsFromCustomer(SalesInvoiceLine, Customer);
    end;

    local procedure SelectCustomer(): Code[20]
    var
        Customer: Record Customer;
        CustomerList: Page "Customer List";
    begin
        CustomerList.LookupMode(true);
        if CustomerList.RunModal() = Action::LookupOK then begin
            CustomerList.GetRecord(Customer);
            exit(Customer."No.");
        end;
        exit('');
    end;

    local procedure UpdateFieldsFromCustomer(var SalesInvoiceLine: Record "Sales Invoice Line"; Customer: Record Customer)
    begin
        SalesInvoiceLine."TIN" := Customer."VAT Registration No.";
        SalesInvoiceLine."Email" := Customer."E-mail";
        SalesInvoiceLine."Postal Address" := Customer.Address;
        SalesInvoiceLine."Street Name" := Customer."Address 2";
        SalesInvoiceLine."City Name" := Customer.City;
        SalesInvoiceLine."Postal Zone" := Customer."Post Code";
        SalesInvoiceLine.Modify(true);

        Message('Sales Invoice Line updated successfully with data from Customer %1.', Customer."No.");
    end;

    procedure UpdateMultipleSalesInvoiceLines()
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
        Customer: Record Customer;
        CustomerNo: Code[20];
        DocumentNo: Code[20];
        UpdatedCount: Integer;
    begin
        // Show dialog to select customer
        CustomerNo := SelectCustomer();
        if CustomerNo = '' then
            exit;

        // Get customer record
        if not Customer.Get(CustomerNo) then
            Error('Customer %1 not found.', CustomerNo);

        // Prompt for document number
        DocumentNo := SelectDocumentNo();
        if DocumentNo = '' then
            exit;

        // Update all lines for the selected document
        if not Confirm('Do you want to update all Sales Invoice Lines for Document %1?', false, DocumentNo) then
            exit;

        SalesInvoiceLine.SetRange("Document No.", DocumentNo);
        if SalesInvoiceLine.FindSet(true) then
            repeat
                UpdateFieldsFromCustomer(SalesInvoiceLine, Customer);
                UpdatedCount += 1;
            until SalesInvoiceLine.Next() = 0;

        Message('%1 Sales Invoice Line(s) updated successfully.', UpdatedCount);
    end;

    local procedure SelectDocumentNo(): Code[20]
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        PostedSalesInvoices: Page "Posted Sales Invoices";
    begin
        PostedSalesInvoices.LookupMode(true);
        if PostedSalesInvoices.RunModal() = Action::LookupOK then begin
            PostedSalesInvoices.GetRecord(SalesInvoiceHeader);
            exit(SalesInvoiceHeader."No.");
        end;
        exit('');
    end;

    procedure UpdateSalesInvoiceLinesByDocument(DocumentNo: Code[20])
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        Customer: Record Customer;
        CustomerNo: Code[20];
        UpdatedCount: Integer;
    begin
        // Get customer from the document header
        if not SalesInvoiceHeader.Get(DocumentNo) then
            Error('Sales Invoice %1 not found.', DocumentNo);

        CustomerNo := SalesInvoiceHeader."Sell-to Customer No.";
        if CustomerNo = '' then
            Error('No customer found on Sales Invoice %1.', DocumentNo);

        // Get customer record
        if not Customer.Get(CustomerNo) then
            Error('Customer %1 not found.', CustomerNo);

        // Confirm update
        if not Confirm('Update all lines with customer information from %1 - %2?', false, CustomerNo, Customer.Name) then
            exit;

        // Update all lines for the specified document
        SalesInvoiceLine.SetRange("Document No.", DocumentNo);
        if SalesInvoiceLine.FindSet(true) then
            repeat
                UpdateFieldsFromCustomer(SalesInvoiceLine, Customer);
                UpdatedCount += 1;
            until SalesInvoiceLine.Next() = 0;

        Message('%1 Sales Invoice Line(s) updated successfully for Document %2.', UpdatedCount, DocumentNo);
    end;

    procedure UpdateSalesInvoiceLinesByDocumentAndCustomer(DocumentNo: Code[20]; CustomerNo: Code[20])
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
        Customer: Record Customer;
        UpdatedCount: Integer;
    begin
        // Get customer record
        if not Customer.Get(CustomerNo) then
            Error('Customer %1 not found.', CustomerNo);

        // Update all lines for the specified document
        SalesInvoiceLine.SetRange("Document No.", DocumentNo);
        if SalesInvoiceLine.FindSet(true) then
            repeat
                UpdateFieldsFromCustomer(SalesInvoiceLine, Customer);
                UpdatedCount += 1;
            until SalesInvoiceLine.Next() = 0;

        Message('%1 Sales Invoice Line(s) updated successfully for Document %2.', UpdatedCount, DocumentNo);
    end;
}
