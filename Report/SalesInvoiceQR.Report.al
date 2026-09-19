report 51001 "Sales Invoice with QR"
{
    DefaultLayout = RDLC;
    ApplicationArea = All;
    RDLCLayout = 'Layout/SalesInvoiceQR.rdl';
    Caption = 'QR Sales Invoice';
    UsageCategory = Lists;

    dataset
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";

            column(No; "No.")
            {
            }
            column(SellToCustomerName; "Sell-to Customer Name")
            {
            }
            /* column(QRCodeImage; "QR Code Image")
            {
            } */

            column(QRCodeImage; QRCode)
            {
            }


            trigger OnAfterGetRecord()
            begin
                GenerateQRCode();
            end;

        }
    }

    var

        QRCode: Text;
        BarcodeURL: Text;

    procedure GenerateQRCode()
    var
        BarcodeSymbology2D: Enum "Barcode Symbology 2D";
        BarcodeFontProvider2D: Interface "Barcode Font Provider 2D";
        BarcodeString: Text;
        eInvoiceSetup: record "e-Invoice Setup";
    begin
        eInvoiceSetup.GET;

        /*  BarcodeURL := 'https://api.tdmsportal.com/api/qr/generateqrcode?'
         + 'IRN=INV001-345SFG-20241011.1731618237'
         + '&PublicKey=LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0KTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUFyU0xpdDRtb1RMbFdjd1A4eEp6RQp3ZTdkRHExdC9kMi9zcXdQTlNVandablFPbklabVh4TXY4QUQxemMxdUErZ3VCc2tpUGdoSXd6ekxWYXJoNk1KCndEdVUxSC95V2FPZE1PTnZOQy9OWERybXB5cE5WUDZyQnV3LzVjSERMdEtoZlJ0YkdFa1JSVVF4MVAxUUJ6REsKVVRpaTRJOXJld29zcVQ4V1dBOE8zRVd5ZHJ5TEg1K3JpVmRUNVBPeU1jcU95YUR2bGRqWG9ZdnBSTHlkcmtDQQpkUWpMdkw0bG00TVNxS05WdGVJR0Y4ZWk4M3Juck5wR3hKTVVGYVMwekt5TzBJZlY0alBCK3ZXN3I1TXdzTjRvCkRnWVR2ME85Q050N3JoNlEvYi9XR3Ewakl3WHJ3c3JIQXE4TXNyUVlGV0JIOHpmejMwOHRWMTlRM1hPTnEyWEMKMHdJREFRQUIKLS0tLS1FTkQgUFVCTElDIEtFWS0tLS0tCg=='
         + '&Certificate=bHMrdllYN1lPVzlnblpyT1A5U0FMdklJOUMyQi9SMThVbktiTnlGNGJyUT0=&format=image&size=50x50';
  */
        BarcodeURL := 'https://api.tdmsportal.com/api/qr/generateqrcode?'
        + 'IRN=' + 'INV001-345SFG-20241011.1731618237'  //SalesInvoiceHeader.IRN
        + '&PublicKey=' + eInvoiceSetup.PubKey
        + '&Certificate=' + eInvoiceSetup.Certificate
        + '&format=image&size=50x50';

        BarcodeFontProvider2D := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
        BarcodeSymbology2D := Enum::"Barcode Symbology 2D"::"QR-Code";
        QRCode := BarcodeFontProvider2D.EncodeFont(BarcodeURL, BarcodeSymbology2D);
    end;






}