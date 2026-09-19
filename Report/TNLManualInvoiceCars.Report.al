report 50439 "TNL Manual Invoice- Cars"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/TNLManualInvoiceCars.rdl';

    dataset
    {
        dataitem(DataItem6640; "Sales Header")
        {
            DataItemTableView = SORTING("Document Type", "No.")
                                WHERE("Document Type" = FILTER('>Quote&<Credit Memo'));
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            column(TOTAL_Caption; TOTAL_CaptionLbl)
            {
            }
            column(Marketing_ManagerCaption; Marketing_ManagerCaptionLbl)
            {
            }
            column(Operation_Logistics_ManagerCaption; Operation_Logistics_ManagerCaptionLbl)
            {
            }
            column(PostingDate_SalesHeader; "Posting Date")
            {
            }
            column(YourReference_SalesHeader; "Your Reference")
            {
            }
            column(Sales_Header_Document_Type; "Document Type")
            {
            }
            column(SelltoCustomerNo_SalesHeader; "Sell-to Customer No.")
            {
            }
            column(SalespersonCode_SalesHeader; "Salesperson Code")
            {
            }
            column(CustomerAddr_1_; CustomerAddr[1])
            {
            }
            column(ExternalDocumentNo_SalesHeader; "External Document No.")
            {
            }
            column(Sales_Header_No_; "No.")
            {
            }
            column(AmountInWords; AmountInWords)
            {
            }
            dataitem(Counter; Integer)
            {
                DataItemTableView = SORTING(Number);
                dataitem(DataItem2844; "Sales Line")
                {
                    DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                    DataItemLinkReference = "DataItem6640";
                    DataItemTableView = SORTING("Document Type", "Document No.", "Line No.")
                                        WHERE(Type = CONST(Item),
                                              "Quantity Shipped" = FILTER(> 0));
                    column(CompanyData_Name; CompanyData.Name)
                    {
                    }
                    column(CompanyData_Address; CompanyData.Address)
                    {
                    }
                    column(CompanyData__Address_2_; CompanyData."Address 2")
                    {
                    }
                    column(CustomerAddr_2_; CustomerAddr[2])
                    {
                    }
                    column(No_SalesLine; "No.")
                    {
                    }
                    column(CompanyData_City; CompanyData.City)
                    {
                    }
                    column(Description_SalesLine; Description)
                    {
                    }
                    column(CustomerAddr_3_; CustomerAddr[3])
                    {
                    }
                    column(LineDiscountAmount_SalesLine; "Line Discount Amount")
                    {
                    }
                    column(LineDiscount_SalesLine; "Line Discount %")
                    {
                    }
                    column(CompanyData__Address_4_; CompanyData."Address 4")
                    {
                    }
                    column(Quantity_SalesLine; Quantity)
                    {
                    }
                    column(Amount_SalesLine; Amount)
                    {
                    }
                    column(AmountIncludingVAT_SalesLine; "Amount Including VAT")
                    {
                    }
                    column(LineAmount_SalesLine; "Line Amount")
                    {
                    }
                    column(UnitPrice_SalesLine; "Unit Price")
                    {
                    }
                    column(CustomerAddr_4_; CustomerAddr[4])
                    {
                    }
                    column(CustomerAddr_5_; CustomerAddr[5])
                    {
                    }
                    column(Tel_____CompanyData__Internation_phone_; 'Tel.: ' + CompanyData."Internation phone")
                    {
                    }
                    column(CustomerAddr_6_; CustomerAddr[6])
                    {
                    }
                    column(CompanyData__Phone_No__; CompanyData."Phone No.")
                    {
                    }
                    column(CompanyData__Phone_No__2_; CompanyData."Phone No. 2")
                    {
                    }
                    column(Fax____CompanyData__Fax_No__; 'Fax: ' + CompanyData."Fax No.")
                    {
                    }
                    column(Reg__No_____CompanyData__Registration_No__; 'Reg. No.: ' + CompanyData."Registration No.")
                    {
                    }
                    column(Vat_No_____CompanyData__VAT_Reg__No__; 'Vat No.: ' + CompanyData."VAT Reg. No.")
                    {
                    }
                    column(Sales_Header___No__; "No.")
                    {
                    }
                    column(Sales_Header___Shipment_Date_; "Shipment Date")
                    {
                    }
                    column(Bill_to_Customer_No________Shortcut_Dimension_1_Code_______Shortcut_Dimension_2_Code_; "Bill-to Customer No." + '-' + "Shortcut Dimension 1 Code" + '-' + "Shortcut Dimension 2 Code")
                    {
                    }
                    column(SalesPerson_Name; SalesPerson.Name)
                    {
                    }
                    column(Order_No_Caption; Order_No_CaptionLbl)
                    {
                    }
                    column(Date_Caption; Date_CaptionLbl)
                    {
                    }
                    column(Customer_No_Caption; Customer_No_CaptionLbl)
                    {
                    }
                    column(Toyota__Nigeria__LimitedCaption; Toyota__Nigeria__LimitedCaptionLbl)
                    {
                    }
                    column(Plot_2__Block_GCaption; Plot_2__Block_GCaptionLbl)
                    {
                    }
                    column(Isolo_Express_Road__IsoloCaption; Isolo_Express_Road__IsoloCaptionLbl)
                    {
                    }
                    column(P__O__Box_14504__Lagos__NigeriaCaption; P__O__Box_14504__Lagos__NigeriaCaptionLbl)
                    {
                    }
                    column(Tel__4528320__4527912Caption; Tel__4528320__4527912CaptionLbl)
                    {
                    }
                    column(Fax__4524637Caption; Fax__4524637CaptionLbl)
                    {
                    }
                    column(Reg_No___RC_281837Caption; Reg_No___RC_281837CaptionLbl)
                    {
                    }
                    column(VAT_No___IKV_080021482Caption; VAT_No___IKV_080021482CaptionLbl)
                    {
                    }
                    column(Page_No_Caption; Page_No_CaptionLbl)
                    {
                    }
                    column(Product_No_Caption; Product_No_CaptionLbl)
                    {
                    }
                    column(DescriptionCaption; DescriptionCaptionLbl)
                    {
                    }
                    column(LocationCaption; LocationCaptionLbl)
                    {
                    }
                    column(ColourCaption; ColourCaptionLbl)
                    {
                    }
                    column(Chassis_No_Caption; Chassis_No_CaptionLbl)
                    {
                    }
                    column(QtyCaption; QtyCaptionLbl)
                    {
                    }
                    column(PICKING_LISTCaption; PICKING_LISTCaptionLbl)
                    {
                    }
                    column(Sales_Person_Caption; Sales_Person_CaptionLbl)
                    {
                    }
                    column(Sales_Line_Document_Type; "Document Type")
                    {
                    }
                    column(Sales_Line_Document_No_; "Document No.")
                    {
                    }
                    column(Sales_Line_Line_No_; "Line No.")
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        IF "Amount Including VAT" - Amount <> 0 THEN
                            VATLiable := VATLiable + Amount;
                        TotalGross := TotalGross + "Amount Including VAT";
                        TotalNet := TotalNet + Amount;

                        IF itemRec.GET("No.") THEN
                            binlocvar := itemRec."Shelf No."
                        ELSE
                            binlocvar := '';

                        IF SKU.GET("Location Code", "No.", "Variant Code") THEN BEGIN
                            IF ColourRec.GET(SKU."Product Group Code", SKU.Colour) THEN
                                ColourTxt := ColourRec.Description
                            ELSE
                                ColourTxt := '';
                        END;


                        /*  IF ColourRec.GET("Product Group Code", Colour) THEN
                             ColourTxt := ColourRec.Description
                         ELSE
                             ColourTxt := ''; */
                    end;

                    trigger OnPreDataItem()
                    begin
                        /*VATLiable := 0;
                        TotalGross  := 0;
                        TotalNet   := 0;
                        MoreLines := FIND('+');
                        WHILE (MoreLines) AND
                              (Description = '') AND
                              ("No." = '') AND
                              (Quantity = 0) AND
                              (Amount = 0)
                        DO
                          MoreLines := NEXT(-1) <> 0;
                        IF MoreLines THEN
                          SETRANGE("Line No.",0,"Line No.")
                        ELSE
                          CurrReport.BREAK;
                        
                        CurrReport.CREATETOTALS("Qty. to Ship");
                          */

                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    PrintBottom := FALSE;
                    IF CopyNo = NoLoops THEN BEGIN
                        CurrReport.BREAK;
                    END ELSE
                        CopyNo := CopyNo + 1;
                    IF CopyNo = 1 THEN /*Original*/
                        CLEAR(CopyTxt)
                    ELSE
                        CopyTxt := 'COPY';

                end;

                trigger OnPreDataItem()
                begin
                    NoLoops := 1 + ABS(NoCopies);
                    IF NoLoops <= 0 THEN
                        NoLoops := 1;
                    CopyNo := 0;
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

                Curr := 'Naira';
                CurrUnit := 'Kobo';
                CALCFIELDS("Amount Including VAT");
                AmountInWords := Library.ToWords("Amount Including VAT", Curr, CurrUnit, 100, '');
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

    trigger OnPreReport()
    begin
        CompanyData.GET;
    end;

    var
        binlocvar: Code[20];
        itemRec: Record 27;
        "VehicleNo.": Code[20];
        NoPr: Boolean;
        i: Integer;
        AmT: array[15] of Text[4];
        AmT1: array[15] of Text[4];
        AmT2: array[15] of Text[4];
        AmT3: array[15] of Text[4];
        TotalNet: Decimal;
        VATLiable: Decimal;
        TotalGross: Decimal;
        Delivery: Record 10;
        Payment: Record 3;
        CustomerAddr: array[8] of Text[50];
        SalesPerson: Record 13;
        OrderNoTxt: Text[20];
        SalesPersonTxt: Text[20];
        ReferenceTxt: Text[15];
        CompanyData: Record 79;
        PrintBottom: Boolean;
        MoreLines: Boolean;
        NoCopies: Integer;
        NoLoops: Integer;
        CopyNo: Integer;
        CopyTxt: Text[20];
        Customer: Record 18;
        PrintPiclist: Codeunit 229;
        ShipmentTxt: Text[20];
        ColourRec: Record 50067;
        ColourTxt: Text[30];
        SKU: Record 5700;
        TOTAL_CaptionLbl: Label 'TOTAL:';
        Marketing_ManagerCaptionLbl: Label 'Marketing Manager';
        Operation_Logistics_ManagerCaptionLbl: Label 'Operation/Logistics Manager';
        Order_No_CaptionLbl: Label 'Order No:';
        Date_CaptionLbl: Label 'Date:';
        Customer_No_CaptionLbl: Label 'Customer No:';
        Toyota__Nigeria__LimitedCaptionLbl: Label 'Toyota (Nigeria) Limited';
        Plot_2__Block_GCaptionLbl: Label 'Plot 2, Block G';
        Isolo_Express_Road__IsoloCaptionLbl: Label 'Isolo Express Road, Isolo';
        P__O__Box_14504__Lagos__NigeriaCaptionLbl: Label 'P. O. Box 14504, Lagos, Nigeria';
        Tel__4528320__4527912CaptionLbl: Label 'Tel: 4528320, 4527912';
        Fax__4524637CaptionLbl: Label 'Fax: 4524637';
        Reg_No___RC_281837CaptionLbl: Label 'Reg.No.: RC 281837';
        VAT_No___IKV_080021482CaptionLbl: Label 'VAT No.: IKV 080021482';
        Page_No_CaptionLbl: Label 'Page No.';
        Product_No_CaptionLbl: Label 'Product No.';
        DescriptionCaptionLbl: Label 'Description';
        LocationCaptionLbl: Label 'Location';
        ColourCaptionLbl: Label 'Colour';
        Chassis_No_CaptionLbl: Label 'Chassis No.';
        QtyCaptionLbl: Label 'Qty';
        PICKING_LISTCaptionLbl: Label 'PICKING LIST';
        Sales_Person_CaptionLbl: Label 'Sales Person:';
        CustomerDetails: array[8] of Text;
        ItemLedgEntry: Record 32;
        ColourName: Text;
        deci: Text[3];
        AmountInWords: Text[300];
        a: Integer;
        value1: Integer;
        value2: Integer;
        value3: Decimal;
        value4: Integer;
        value5: Integer;
        valueword1: Text[10];
        valueword2: Text[10];
        valueword3: Text[10];
        valueword4: Text[20];
        valueword5: Text[200];
        word1: Text[60];
        word2: Text[100];
        word3: Text[60];
        word5: Text[30];
        wordarray: array[20] of Text[10];
        arrayval: array[20] of Text[10];
        VALLENT: Integer;
        valent: Integer;
        CurrUnit: Code[10];
        CurrencyRec: Record 4;
        Curr: Text[30];
        Library: Codeunit 50003;

    procedure figure(fig: Decimal; Currency: Text[30]; CurrencyUnit: Text[30]) figureinword: Text[200]
    begin
        figureinword := '';
        value1 := 0;
        value2 := 0;
        value3 := 0;
        value4 := 0;
        value5 := 0;
        valueword1 := '';
        valueword2 := '';
        valueword3 := '';
        valueword4 := '';
        valueword5 := '';
        word1 := '';
        word2 := '';
        word3 := '';
        word5 := '';

        IF ABS(fig) > 0 THEN BEGIN
            wordarray[1] := 'ONE';
            wordarray[2] := 'TWO';
            wordarray[3] := 'THREE';
            wordarray[4] := 'FOUR';
            wordarray[5] := 'FIVE';
            wordarray[6] := 'SIX';
            wordarray[7] := 'SEVEN';
            wordarray[8] := 'EIGHT';
            wordarray[9] := 'NINE';
            wordarray[10] := 'TEN';
            wordarray[11] := 'ELEVEN';
            wordarray[12] := 'TWELVE';
            wordarray[13] := 'THIRTEEN';
            wordarray[14] := 'FOURTEEN';
            wordarray[15] := 'FIFTEEN';
            wordarray[16] := 'SIXTEEN';
            wordarray[17] := 'SEVENTEEN';
            wordarray[18] := 'EIGHTEEN';
            wordarray[19] := 'NINETEEN';
            wordarray[20] := 'TWENTY';
            arrayval[1] := 'TEN';
            arrayval[2] := 'TWENTY';
            arrayval[3] := 'THIRTY';
            arrayval[4] := 'FORTY';
            arrayval[5] := 'FIFTY';
            arrayval[6] := 'SIXTY';
            arrayval[7] := 'SEVENTY';
            arrayval[8] := 'EIGHTY';
            arrayval[9] := 'NINETY';
            arrayval[10] := 'HUNDRED';
            arrayval[11] := 'THOUSAND';
            arrayval[12] := 'MILLION';
            arrayval[13] := 'BILLION';
            arrayval[14] := 'TRILLION';
            valueword4 := FORMAT(ABS(ROUND(fig, 0.01, '>')));
            valueword4 := DELCHR(valueword4, '=', ',');
            value4 := STRPOS(valueword4, '.');
            IF value4 > 0 THEN BEGIN
                VALLENT := value4 - 1;
                deci := COPYSTR(valueword4, (STRPOS(valueword4, '.') + 1));
                IF STRLEN(deci) < 2 THEN deci := deci + '0'
            END
            ELSE
                VALLENT := STRLEN(valueword4);
            IF VALLENT > 15 THEN
                ERROR('VALUE IS TOO BIG TO CONVERT');
            value5 := VALLENT MOD 3;
            IF value5 > 0 THEN BEGIN                                             // unit and tens conversion begin
                valueword1 := COPYSTR(valueword4, 1, value5);
                EVALUATE(value3, valueword1);
                IF (value3 > 0) AND (value3 <= 20) THEN
                    word1 := wordarray[value3]
                ELSE BEGIN
                    valueword2 := COPYSTR(valueword1, 1, 1);
                    valueword3 := COPYSTR(valueword1, 2, 1);
                    EVALUATE(value3, valueword2);
                    word1 := arrayval[value3];
                    EVALUATE(value3, valueword3);
                    IF value3 > 0 THEN
                        word1 := word1 + ' ' + wordarray[value3];
                END;
                IF (VALLENT > 3) AND (VALLENT < 7) THEN
                    word1 := word1 + ' ' + arrayval[11];
                IF (VALLENT > 6) AND (VALLENT < 10) THEN
                    word1 := word1 + ' ' + arrayval[12];
                IF (VALLENT > 9) AND (VALLENT < 13) THEN
                    word1 := word1 + ' ' + arrayval[13];
                IF (VALLENT > 12) AND (VALLENT < 16) THEN
                    word1 := word1 + ' ' + arrayval[14];
            END;

            // Figure normal conversion begin by Hassan Sharafadeen
            IF VALLENT > 2 THEN BEGIN
                a := value5 + 1;
                REPEAT
                    valueword2 := COPYSTR(valueword4, a, 3);
                    EVALUATE(value4, valueword2);
                    IF value4 = 0 THEN BEGIN
                        word2 := '';
                        IF (VALLENT > 6) AND (VALLENT < 10) THEN
                            word2 := word2 + ' ' + arrayval[11];
                        IF (VALLENT > 9) AND (VALLENT < 13) THEN
                            word2 := word2 + ' ' + arrayval[12];
                        IF (VALLENT > 12) AND (VALLENT < 16) THEN
                            word2 := word2 + ' ' + arrayval[13];
                        a := a + 3;
                    END
                    ELSE BEGIN
                        valueword1 := COPYSTR(valueword2, 1, 1);
                        EVALUATE(value3, valueword1);
                        IF value3 > 0 THEN BEGIN
                            word2 := wordarray[value3];
                            word2 := word2 + ' ' + arrayval[10];
                        END
                        ELSE
                            word2 := '';
                        valueword1 := COPYSTR(valueword2, 2);
                        EVALUATE(value3, valueword1);
                        IF value3 > 0 THEN BEGIN
                            IF (value3 > 0) AND (value3 <= 20) THEN
                                IF word2 <> '' THEN
                                    word2 := word2 + ' ' + 'AND' + ' ' + wordarray[value3]
                                ELSE
                                    word2 := wordarray[value3]
                            ELSE
                                IF value3 > 20 THEN BEGIN
                                    valueword2 := COPYSTR(valueword1, 1, 1);
                                    valueword3 := COPYSTR(valueword1, 2, 1);
                                    EVALUATE(value3, valueword2);
                                    IF word2 <> '' THEN
                                        word2 := word2 + ' ' + 'AND' + ' ' + arrayval[value3]
                                    ELSE
                                        word2 := arrayval[value3];
                                    EVALUATE(value3, valueword3);
                                    IF value3 > 0 THEN
                                        word2 := word2 + ' ' + wordarray[value3];
                                END;
                        END;
                        a := a + 3;
                        IF a < VALLENT THEN BEGIN
                            IF i > 0 THEN BEGIN
                                CASE i OF
                                    3:
                                        BEGIN
                                            IF (VALLENT > 8) AND (VALLENT < 12) THEN
                                                word2 := word2 + ' ' + arrayval[11];
                                            IF (VALLENT > 11) AND (VALLENT < 15) THEN
                                                word2 := word2 + ' ' + arrayval[12];
                                            IF VALLENT = 15 THEN
                                                word2 := word2 + ' ' + arrayval[13];
                                        END;
                                    6:
                                        BEGIN
                                            IF (VALLENT > 11) AND (VALLENT < 15) THEN
                                                word2 := word2 + ' ' + arrayval[11];
                                            IF VALLENT = 15 THEN
                                                word2 := word2 + ' ' + arrayval[12];
                                        END;
                                    9:
                                        IF VALLENT = 15 THEN
                                            word2 := word2 + ' ' + arrayval[11];
                                END;
                            END
                            ELSE BEGIN
                                CASE a OF
                                    4:
                                        BEGIN
                                            IF VALLENT = 6 THEN
                                                word2 := word2 + ' ' + arrayval[11];
                                            IF VALLENT = 9 THEN
                                                word2 := word2 + ' ' + arrayval[12];
                                            IF VALLENT = 12 THEN
                                                word2 := word2 + ' ' + arrayval[13];
                                            IF VALLENT = 15 THEN
                                                word2 := word2 + ' ' + arrayval[14];
                                        END;
                                    5, 6:
                                        BEGIN
                                            IF (VALLENT > 6) AND (VALLENT < 9) THEN
                                                word2 := word2 + ' ' + arrayval[11];
                                            IF (VALLENT > 9) AND (VALLENT < 12) THEN
                                                word2 := word2 + ' ' + arrayval[12];
                                            IF (VALLENT > 12) AND (VALLENT < 15) THEN
                                                word2 := word2 + ' ' + arrayval[13];
                                        END;
                                END;
                            END;
                        END;
                        valueword5 := valueword5 + ' ' + word2;
                        i := i + 3;
                    END;
                UNTIL a > VALLENT;
            END;
            figureinword := word1 + ' ' + valueword5 + ' ' + Currency;
            IF deci <> '' THEN                 //Decimal conversion begin
            BEGIN
                EVALUATE(value3, deci);
                IF value3 <= 20 THEN
                    word3 := wordarray[value3]
                ELSE BEGIN
                    valueword2 := COPYSTR(deci, 1, 1);
                    valueword3 := COPYSTR(deci, 2, 1);
                    EVALUATE(value3, valueword2);
                    word3 := arrayval[value3];
                    EVALUATE(value3, valueword3);
                    IF value3 > 0 THEN
                        word3 := word3 + ' ' + wordarray[value3];
                END;
                word5 := word3 + ' ' + CurrencyUnit;           // Attach Decimal Unit of counting
            END
            ELSE
                word5 := ' ';
            figureinword := figureinword + ' ' + word5;
        END
        ELSE
            figureinword := '';
    end;
}

