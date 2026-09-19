report 50284 "TNL Sales Waybill2"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/TNLSalesWaybill2.rdl';

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            column(DocumentType_SalesHeader; "Document Type")
            {
            }
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
            column(HODLogisticsSignature_SalesHeader; "HOD Logistics Signature")
            {
            }
            column(HODFinanceSignature_SalesHeader; "HOD Finance Signature")
            {
            }
            column(HODMarketingSignature_SalesHeader; "HOD Marketing Signature")
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
            dataitem(SalesLine; "Sales Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"),
                               "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.")
                                    WHERE("Qty. to Ship" = FILTER(> 0));
                column(DocumentType_SalesLine; "Document Type")
                {
                }
                column(SelltoCustomerNo_SalesLine; "Sell-to Customer No.")
                {
                }
                column(DocumentNo_SalesLine; "Document No.")
                {
                }
                column(LineNo_SalesLine; "Line No.")
                {
                }
                column(Type_SalesLine; Type)
                {
                }
                column(LocationCode_SalesLine; "Location Code")
                {
                }
                column(PostingGroup_SalesLine; "Posting Group")
                {
                }
                column(ShipmentDate_SalesLine; "Shipment Date")
                {
                }
                column(QtytoShip_SalesLine; "Qty. to Ship")
                {
                }
                column(Description_SalesLine; Description)
                {
                }
                column(Description2_SalesLine; "Description 2")
                {
                }
                column(Quantity_SalesLine; Quantity)
                {
                }
                column(UnitofMeasure_SalesLine; "Unit of Measure")
                {
                }
                column(OutstandingQuantity_SalesLine; "Outstanding Quantity")
                {
                }
                column(QtytoInvoice_SalesLine; "Qty. to Invoice")
                {
                }
                column(No_SalesLine; "No.")
                {
                }
                column(Colour_SalesLine; Colour)
                {
                }
                column(ChassisNumber_SalesLine; "Chassis Number")
                {
                }
                column(ExteriorColourName_SalesLine; "Exterior Colour Name")
                {
                }
                dataitem(ResrvationEntry; "Reservation Entry")
                {
                    DataItemLink = "Source ID" = FIELD("Document No."),
                                   "Source Ref. No." = FIELD("Line No.");
                    column(Reservation_Entry__Serial_No__; "Serial No.")
                    {
                    }
                    column(Reservation_Entry__Reservation_Entry___Exterior_Colour_Name_; "Exterior Colour Name")
                    {
                    }
                    column(Reservation_Entry__Reservation_Entry___Location_Code_; "Location Code")
                    {
                    }
                    column(Reservation_Entry_Source_ID; "Source ID")
                    {
                    }
                    column(Reservation_Entry_Source_Ref__No_; "Source Ref. No.")
                    {
                    }
                    column(ColourName; ColourName)
                    {
                    }
                    column(Sales_Line__Description; Description)
                    {
                    }
                    column(Reservation_Entry_Entry_No_; "Entry No.")
                    {
                    }
                    column(Reservation_Entry_Positive; Positive)
                    {
                    }
                    column(Reservation_Entry__Item_No__; "Item No.")
                    {
                    }
                    column(ABS__Quantity__Base___; ABS("Quantity (Base)"))
                    {
                        DecimalPlaces = 0 : 0;
                    }
                    column(EngineNo_ReservationEntry; "Engine No.")
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        ItemLedgEntry.SETCURRENTKEY("Serial No.");
                        ItemLedgEntry.SETRANGE("Serial No.", "Serial No.");
                        IF ItemLedgEntry.FINDFIRST THEN BEGIN
                            ColourName := ItemLedgEntry."Exterior Colour Name";
                            "Exterior Colour Code" := ItemLedgEntry."Exterior Colour Name";
                        END;
                    end;
                }

                trigger OnAfterGetRecord()
                begin

                    IF "Amount Including VAT" - Amount <> 0 THEN
                        VATLiable := VATLiable + Amount;
                    TotalGross := TotalGross + "Amount Including VAT";
                    TotalNet := TotalNet + Amount;
                    //UNDEFINED('genSELECTLINES',Type+1);

                    IF itemRec.GET("No.") THEN
                        binlocvar := itemRec."Shelf No."
                    ELSE
                        binlocvar := '';


                    ReservationEntry.SETCURRENTKEY("Source ID", "Source Ref. No.", "Source Type", "Source Subtype", "Source Batch Name", "Source Prod. Order Line", "Reservation Status", "Shipment Date", "Expected Receipt Date");
                    ReservationEntry.SETRANGE("Source ID", "Document No.");
                    ReservationEntry.SETRANGE("Source Ref. No.", "Line No.");
                    IF ReservationEntry.FINDFIRST THEN
                        "Chassis Number" := ReservationEntry."Serial No.";
                end;

                trigger OnPreDataItem()
                begin

                    VATLiable := 0;
                    TotalGross := 0;
                    TotalNet := 0;
                    MoreLines := FIND('+');
                    WHILE (MoreLines) AND
                          (Description = '') AND
                          ("No." = '') AND
                          (Quantity = 0) AND
                          (Amount = 0)
                    DO
                        MoreLines := NEXT(-1) <> 0;
                    IF MoreLines THEN
                        SETRANGE("Line No.", 0, "Line No.")
                    ELSE
                        CurrReport.BREAK;
                end;
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
                    IF SalesPerson.GET("Salesperson Code") THEN;
                    SalesPersonTxt := 'Salesperson :';
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
                PrintPiclist.RUN;
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
        SalesCountPrinted.RUN(SalesHeader);
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
}

