namespace AL_TNL.AL_TNL;
using Microsoft.Sales.History;
using System.Utilities;

codeunit 50007 "e-InvoiceAPI"
{
    Permissions = tabledata "Sales Invoice Header" = rimd;

    procedure GetIRN(var Rec: Record "Sales Invoice Header")
    var
        HttpClient: HttpClient;
        HttpContent: HttpContent;
        HttpResponseMessage: HttpResponseMessage;
        HttpRequestMessage: HttpRequestMessage;
        HttpHeaders: HttpHeaders;
        JsonObject: JsonObject;
        JsonArray: JsonArray;
        JsonResponse: JsonObject;
        eInvoiceSetup: Record "e-Invoice Setup";
        PubKeyText: Text;
        IRNtext: Text;
        CertText: Text;
        ToSend: Text;
        Window: Dialog;
        ResponseText: Text;
        OutStream: OutStream;
        RespJson: JsonObject;
        Token: JsonToken;

    begin
        // Show "Please Wait" message
        Window.Open('Please Wait...');
        eInvoiceSetup.Get();

        // Format values for JSON payload
        IRNtext := Rec."No." + '-' + '345SFG';
        PubKeyText := eInvoiceSetup.PubKey;
        CertText := eInvoiceSetup.Certificate;

        // Construct JSON object
        JsonObject.Add('PublicKey', PubKeyText);
        JsonObject.Add('Certificate', CertText);
        JsonObject.Add('IRN', IRNtext);


        JsonObject.WriteTo(ToSend);
        HttpContent.WriteFrom(ToSend);

        HttpHeaders.Clear();
        HttpRequestMessage.Method := 'POST';
        HttpRequestMessage.SetRequestUri(eInvoiceSetup."Webservice Url");
        HttpRequestMessage.Content := HttpContent;
        HttpRequestMessage.GetHeaders(HttpHeaders);
        HttpClient.Send(HttpRequestMessage, HttpResponseMessage);

        if HttpResponseMessage.IsSuccessStatusCode() then begin
            HttpResponseMessage.Content.ReadAs(ResponseText);

            if not RespJson.ReadFrom(ResponseText) then
                Error('Invalid JSON: %1', CopyStr(ResponseText, 1, 250));

            RespJson.Get('qrCodeDataUrl', Token);

            //Rec."QR Code Data".CreateOutStream(OutStream, TextEncoding::UTF8);
            OutStream.WriteText(Token.AsValue().AsText());

           
            
            Rec.Modify();

            Message('Successfully!');
        end else begin
            Error('Not successful!');
        end;

        Window.Close();
    end;



 

}
