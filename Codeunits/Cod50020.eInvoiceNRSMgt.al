codeunit 50020 "eInvoice NRS Mgt."
{
    Permissions = TableData "Sales Invoice Header" = rm;

    procedure SendInvoiceToNRS(var SalesInvoiceHeader: Record "Sales Invoice Header")
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        URL: Text;
    begin
        URL := 'https://testapi.tdmsportal.com/api/qr/invoicesignfromorder?supplier_key=tnl-787867676'
                + '&order_number=' + SalesInvoiceHeader."No.";

        if Client.get(URL, Response) then begin
            if Response.IsSuccessStatusCode() then begin
                SalesInvoiceHeader."Sent to NRS" := true;
                SalesInvoiceHeader.Modify();
                Message('Invoice sent to NRS successfully.');
            end else begin
                SalesInvoiceHeader."Error Message" := Response.ReasonPhrase();
                SalesInvoiceHeader.Modify();
                Error('Invoice failed to send to NRS');
            end;
        end;
    end;

    procedure SendServiceInvoiceToNRS(var ServiceInvoiceHeader: Record "Service Invoice Header")
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        URL: Text;
    begin
        URL :=  'https://testapi.tdmsportal.com/api/qr/invoicesignfromorder?supplier_key=tnl-787867676&type=service'
                + '&order_number=' + ServiceInvoiceHeader."No.";

        if Client.get(URL, Response) then begin
            if Response.IsSuccessStatusCode() then begin
                ServiceInvoiceHeader."Sent to NRS" := true;
                ServiceInvoiceHeader.Modify();
                Message('Invoice sent to NRS successfully.');
            end else begin
                ServiceInvoiceHeader."Error Message" := Response.ReasonPhrase();
                ServiceInvoiceHeader.Modify();
                Error('Invoice failed to send to NRS');
            end;
        end;
    end;

   
}
