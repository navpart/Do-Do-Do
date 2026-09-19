report 50289 "TNL Sales Waybill3"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/TNLSalesWaybill3.rdl';

    dataset
    {
        dataitem(SalesInvHeader; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            column(SelltoCustomerNo_SalesHeader; "Sell-to Customer No.")
            {
            }
            column(No_SalesHeader; "No.")
            {
            }
            column(BilltoCustomerNo_SalesHeader; "Bill-to Customer No.")
            {
            }
            column(BilltoName_SalesHeader; "Bill-to Name")
            {
            }
            column(BilltoName2_SalesHeader; "Bill-to Name 2")
            {
            }
            column(BilltoAddress_SalesHeader; "Bill-to Address")
            {
            }
            column(BilltoAddress2_SalesHeader; "Bill-to Address 2")
            {
            }
            column(CoyAddress_2; "CoyAddress 2")
            {
            }
            column(CoyAddress; CoyAddress)
            {
            }
            column(CoyCity; CoyCity)
            {
            }
            column(CoyName; CoyName)
            {
            }
            column(CoyTelInt; CoyTelInt)
            {
            }
            column(PostingDate_SalesHeader; "Posting Date")
            {
            }

            column(SalesPerson_Name; SalesPerson.Name)
            {
            }
            column(CoyTel; CoyTel)
            {
            }
            column(ReferenceTxt; ReferenceTxt)
            {
            }
            column(CoyVat; CoyVat)
            {
            }
            column(CoyReg; CoyReg)
            {
            }
            column(BilltoCity_SalesHeader; "Bill-to City")
            {
            }
            column(BilltoContact_SalesHeader; "Bill-to Contact")
            {
            }
            column(SalespersonCode_SalesHeader; "Salesperson Code")
            {
            }
            column(SalespersonName_SalesHeader; "Salesperson Name")
            {
            }
            column(YourReference_SalesHeader; "Your Reference")
            {
            }
            column(ShiptoCode_SalesHeader; "Ship-to Code")
            {
            }
            column(ShiptoName_SalesHeader; "Ship-to Name")
            {
            }
            column(ShiptoName2_SalesHeader; "Ship-to Name 2")
            {
            }
            column(ShiptoAddress_SalesHeader; "Ship-to Address")
            {
            }
            column(SalesTime_SalesHeader; "Sales Time")
            {
            }
            column(LogisticsApprovedBy_SalesHeader; "Logistics Approved By")
            {
            }
            column(FinanceApprovedBy_SalesHeader; "Finance Approved By")
            {
            }
            column(MarketingApprovedBy_SalesHeader; "Marketing Approved By")
            {
            }

            column(MKTDesignation; MKTDesignation)
            {
            }
            column(FADDesignation; FADDesignation)
            {
            }
            column(OLDesignation; OLDesignation)
            {
            }
            column(SalesName; SalesName)
            {
            }
            dataitem(SalesShipmtHeader; "Sales Shipment Header")
            {
                DataItemLink = "Order No." = FIELD("Order No.");
                column(No_SalesShipmentHeader; "No.")
                {
                }
                dataitem(ItemLedgEntryData; "Item Ledger Entry")
                {
                    DataItemLink = "Document No." = FIELD("No.");
                    column(SerialNo_ItemLedgerEntry; "Serial No.")
                    {
                    }
                    column(ExteriorColourName_ItemLedgerEntry; "Exterior Colour Name")
                    {
                    }
                    column(Description_ItemLedgerEntry; Description)
                    {
                    }
                    column(Quantity_ItemLedgerEntry; ABS(Quantity))
                    {
                    }
                    column(ItemNo_ItemLedgerEntry; "Item No.")
                    {
                    }
                    column(EngineNo_ItemLedgerEntry; "Engine No.")
                    {
                    }
                    column(LocationCode_ItemLedgerEntry; "Location Code")
                    {
                    }
                    column(QRCodeImage; QRCode)
                    {
                    }
                }
            }

            trigger OnAfterGetRecord()
            begin

                //CurrReport.PAGENO := 1;
                PrintBottom := FALSE;
                IF "Salesperson Code" = '' THEN BEGIN
                    CLEAR(SalesPerson);
                    CLEAR(SalesPersonTxt);
                END
                ELSE BEGIN
                    IF SalesPerson.GET("Salesperson Code") THEN
                        SalesName := SalesPerson.Name
                    // SalesPersonTxt := 'Salesperson :';
                END;

                IF "Your Reference" = '' THEN
                    CLEAR(ReferenceTxt)
                ELSE
                    ReferenceTxt := 'Reference';

                IF "Shipment Date" = 0D THEN
                    CLEAR(ShipmentTxt)
                ELSE
                    ShipmentTxt := 'Shipment Date';

                IF "Location Code" = '100PH' THEN BEGIN
                    CoyName := 'Toyota (Nigeria) Limited (PH)';
                    CoyAddress := 'Plot 114 Trans Amadi';
                    "CoyAddress 2" := 'Trans Amadi Industrial Layout';
                    CoyCity := 'Port Harcourt, Rivers State';
                    CoyTelInt := '';
                    CoyTel := '084-488907, 233679';
                    CoyFax := '';
                    CoyReg := 'Reg No.: R.C. 281837';
                    CoyVat := 'VAT No.: IKV080021482';
                END ELSE BEGIN
                    IF "Location Code" = '111EKET' THEN BEGIN
                        CoyName := 'Toyota (Nigeria) Limited';
                        CoyAddress := 'Eddynco Complex,';
                        "CoyAddress 2" := 'Jetty Road, Mkpanak';
                        CoyCity := 'Ibeno Local Govt. Eket';
                        CoyTelInt := 'Akwa Ibom State, Nigeria';
                        CoyTel := '08034938518, 08051995176';
                        CoyFax := '';
                        CoyReg := 'Reg No.: R.C. 281837';
                        CoyVat := 'VAT No.: IKV080021482';
                    END ELSE BEGIN
                        IF "Location Code" = '112ABJ' THEN BEGIN
                            CoyName := 'Toyota (Nigeria) Limited (ABJ)';
                            CoyAddress := 'Plot 1259 Aminu Kano Crescent';
                            "CoyAddress 2" := 'Beside Tulip Press';
                            CoyCity := 'Wuse II, Abuja, Nigeria';
                            CoyTelInt := '';
                            CoyTel := 'Tel No.: 09-6720701';
                            CoyFax := '';
                            CoyReg := 'Reg No.: R.C. 281837';
                            CoyVat := 'VAT No.: IKV080021482';

                        END ELSE BEGIN
                            IF "Location Code" = '114SER' THEN BEGIN
                                CoyName := 'Toyota (Nigeria) Limited';
                                CoyAddress := 'Toyota Training Sch. Complex';
                                "CoyAddress 2" := 'TPAO 992, Ojulari Road';
                                CoyCity := 'Lekki Peninsula Scheme';
                                CoyTelInt := 'P.O. Box 14504, Lagos, Nigeria';
                                CoyTel := 'Tel No.: 234-1-4401311-5';
                                CoyFax := 'Fax No.: 01-4401321-2';
                                CoyReg := 'Reg No.: R.C. 281837';
                                CoyVat := 'VAT No.: IKV080021482';
                            END ELSE BEGIN
                                IF "Location Code" = '113LEK' THEN BEGIN
                                    CoyName := 'Toyota (Nigeria) Limited';
                                    CoyAddress := 'Toyota Training Sch. Complex';
                                    "CoyAddress 2" := 'TPAO 992, Ojulari Road';
                                    CoyCity := 'Lekki Peninsula Scheme';
                                    CoyTelInt := 'P.O. Box 14504, Lagos, Nigeria';
                                    CoyTel := 'Tel No.: 234-1-4401311-5';
                                    CoyFax := 'Fax No.: 01-4401321-2';
                                    CoyReg := 'Reg No.: R.C. 281837';
                                    CoyVat := 'VAT No.: IKV080021482';

                                END;
                            END;
                        END;
                    END;
                END;

                CustomerAddr[1] := "Bill-to Name";
                CustomerAddr[2] := "Bill-to Name 2";
                CustomerAddr[3] := "Bill-to Address";
                CustomerAddr[4] := "Bill-to Address 2";
                CustomerAddr[5] := "Del.Add. 3";
                CustomerAddr[6] := "P.O.Box";
                CustomerAddr[7] := "Bill-to City";
                CustomerAddr[8] := "Bill-to Contact";

                COMPRESSARRAY(CustomerAddr);
                PrintBottom := FALSE;

                IF DepRec.GET("Shortcut Dimension 1 Code") THEN;


                /*   IF UserSetup.GET("Finance Send to") THEN BEGIN
                      UserSetup.CALCFIELDS(Signature);
                      FADDesignation := UserSetup.Designation;
                  END;

                  IF UserSetup1.GET("Logistics Send to") THEN BEGIN
                      UserSetup1.CALCFIELDS(Signature);
                      OLDesignation := UserSetup1.Designation;
                  END;

                  IF UserSetup2.GET("Marketing Send To") THEN BEGIN
                      UserSetup2.CALCFIELDS(Signature);
                      MKTDesignation := UserSetup2.Designation;
                  END; */

                

            end;

            trigger OnPreDataItem()
            begin
                //PrintPiclist.RUN;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport()
    begin
        //SalesCountPrinted.RUN("Sales Invoice Header");
    end;

    var
        binlocvar: Code[20];
        itemRec: Record 27;
        "VehicleNo.": Code[10];
        NoPr: Boolean;
        i: Integer;
        AmT: array[15] of Text[4];
        AmT1: array[15] of Text[4];
        AmT2: array[15] of Text[4];
        AmT3: array[15] of Text[4];
        DepRec: Record 11;
        TotalNet: Decimal;
        VATLiable: Decimal;
        TotalGross: Decimal;
        Delivery: Record 10;
        Payment: Record 3;
        CustomerAddr: array[8] of Text[50];
        SalesPerson: Record 13;
        OrderNoTxt: Text[10];
        SalesPersonTxt: Text[20];
        ReferenceTxt: Text[15];
        CompanyData: Record 79;
        PrintBottom: Boolean;
        MoreLines: Boolean;
        NoCopies: Integer;
        NoLoops: Integer;
        CopyNo: Integer;
        CopyTxt: Text[10];
        Customer: Record 18;
        PrintPiclist: Codeunit 229;
        ShipmentTxt: Text[20];
        CoyName: Text[50];
        CoyAddress: Text[50];
        "CoyAddress 2": Text[50];
        CoyCity: Text[30];
        CoyTelInt: Text[30];
        CoyTel: Text[30];
        CoyFax: Text[30];
        CoyReg: Text[30];
        CoyVat: Text[30];
        SalesPrint: Codeunit 313;
        SalesCountPrinted: Codeunit 313;
        ReservationEntry: Record 337;
        UserSetup: Record 91;
        UserSetup1: Record 91;
        UserSetup2: Record 91;
        MKTDesignation: Text[50];
        FADDesignation: Text[50];
        OLDesignation: Text[50];
        ItemLedgEntry: Record 32;
        ColourName: Text;
        SalesName: Text[50];
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

