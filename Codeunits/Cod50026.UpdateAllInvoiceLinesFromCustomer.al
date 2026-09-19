codeunit 50026 "Update Invoice Lines Customer"
{
    Permissions = TableData "Sales Invoice Line" = RM;

    procedure UpdateAllSalesInvoiceLines()
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
        Customer: Record Customer;
        UpdatedCount: Integer;
        SkippedCount: Integer;
    begin
        if not Confirm('Update customer fields on all Sales Invoice Lines?', false) then
            exit;

        if SalesInvoiceLine.FindSet(true) then
            repeat
                if Customer.Get(SalesInvoiceLine."Sell-to Customer No.") then begin
                    SalesInvoiceLine."TIN" := Customer."VAT Registration No.";
                    SalesInvoiceLine."Email" := Customer."E-mail";
                    SalesInvoiceLine."Postal Address" := Customer.Address;
                    SalesInvoiceLine."Street Name" := Customer."Address 2";
                    SalesInvoiceLine."City Name" := Customer.City;
                    SalesInvoiceLine."Postal Zone" := Customer."Post Code";
                    SalesInvoiceLine.Modify(true);
                    UpdatedCount += 1;
                end else
                    SkippedCount += 1;
            until SalesInvoiceLine.Next() = 0;

        Message('%1 Sales Invoice Line(s) updated. %2 skipped (no matching customer).', UpdatedCount, SkippedCount);
    end;
}
