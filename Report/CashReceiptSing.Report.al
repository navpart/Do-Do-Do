report 50007 "Cash Receipt-Sing."
{
    ApplicationArea = All;
    Caption = 'Cash Receipt';
    UsageCategory = ReportsAndAnalysis;
    PreviewMode = PrintLayout;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/CashReceiptSing.rdl';

    dataset
    {
        dataitem(DataItem5195; "Payment/Receipt.")
        {
            DataItemTableView = SORTING("No.") where("Document Type" = filter('Receipt'));
            RequestFilterFields = "No.", "Document Type", "Cash/Cheque";
            column(CompanyData_Name; CompanyData.Name)
            {
            }
            column(CompanyData_Address; CompanyData.Address)
            {
            }
            column(CompanyData__Address_2_; CompanyData."Address 2")
            {
            }
            column(CompanyData_City; CompanyData.City)
            {
            }
            column(CompanyData__Address_4_; CompanyData."Address 4")
            {
            }
            column(Tel_____CompanyData__Internation_phone_; 'Tel.: ' + CompanyData."Internation phone")
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
            column(CompanyAddr1; CompanyAddr[1])
            {
            }
            column(CompanyAddr2; CompanyAddr[2])
            {
            }
            column(CompanyAddr3; CompanyAddr[3])
            {
            }
            column(CompanyAddr4; CompanyAddr[4])
            {
            }
            column(CompanyAddr5; CompanyAddr[5])
            {
            }
            column(CompanyAddr6; CompanyAddr[6])
            {
            }
            column(CompanyAddr7; CompanyAddr[7])
            {
            }
            column(CompanyAddr8; CompanyAddr[8])
            {
            }
            column(CustomerAddr_1_; CustomerAddr[1])
            {
            }
            column(CustomerAddr_2_; CustomerAddr[2])
            {
            }
            column(CustomerAddr_3_; CustomerAddr[3])
            {
            }
            column(CustomerAddr_4_; CustomerAddr[4])
            {
            }
            column(CustomerAddr_5_; CustomerAddr[5])
            {
            }
            column(CustomerAddr_6_; CustomerAddr[6])
            {
            }
            column(CustomerAddr_7_; CustomerAddr[7])
            {
            }
            column(CustomerAddr_8_; CustomerAddr[8])
            {
            }
            column(Payment_Receipt___Received_by_; "Received by")
            {
            }
            column(Payment_Receipt___No__; "No.")
            {
            }
            column(Payment_Receipt___Posting_Date_; "Posting Date")
            {
            }
            column(Payment_Receipt___Transaction_Description_; "Transaction Description")
            {
            }
            column(FORMAT__Cash_Cheque__________FORMAT__Document_Type________COPY_Not_Valid_Without_Authorisation_; FORMAT("Cash/Cheque") + '  ' + FORMAT("Document Type") + '  COPY Not Valid Without Authorisation')
            {
            }
            column(Payment_Receipt___Global_Dimension_2_Code_; "Global Dimension 2 Code")
            {
            }
            column(Payment_Receipt___Global_Dimension_1_Code_; "Global Dimension 1 Code")
            {
            }
            column(Payment_Receipt___Account_No__; "Account No.")
            {
            }
            column(ABS__Amount__LCY___; ABS("Amount (LCY)"))
            {
            }
            column(Payment_Receipt___Account_Description_; "Account Description")
            {
            }
            column(Payment_Receipt___Multiple_Account; "Multiple Account")
            {
            }
            column(AMOUNTINWORD; AMOUNTINWORD)
            {
            }
            column(Date_Caption; Date_CaptionLbl)
            {
            }
            column(BankName_PaymentReceipt; "Bank Name")
            {
            }
            column(ChequeNo_PaymentReceipt; "Cheque No.")
            {
            }
            column(Receipt_No_Caption; Receipt_No_CaptionLbl)
            {
            }
            column(Cash_ReceiptCaption; Cash_ReceiptCaptionLbl)
            {
            }
            column(BranchCaption; BranchCaptionLbl)
            {
            }
            column(DeptCaption; DeptCaptionLbl)
            {
            }
            column(Account_DescriptionCaption; Account_DescriptionCaptionLbl)
            {
            }
            column(Payment_Receipt___Account_No__Caption; FIELDCAPTION("Account No."))
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(Cashier_Signature_Caption; Cashier_Signature_CaptionLbl)
            {
            }
            column(AMOUNTINWORDCaption; AMOUNTINWORDCaptionLbl)
            {
            }
            column(AccountType_PaymentReceipt; "Account Type")
            {
            }
            column(AmountLCY_PaymentReceipt; ABS("Amount (LCY)"))
            {
            }
            dataitem(DataItem1385; "Payment/Receipt Bal. Line.")
            {
                DataItemLink = "No." = FIELD("No."), Type = FIELD("Document Type"), "Cash/Cheque" = FIELD("Cash/Cheque");
                DataItemTableView = SORTING(Type, "Cash/Cheque", "No.", "Line No.");
                column(Payment_Receipt_Bal__Line___Account_Description_; "Account Description")
                {
                }
                column(Payment_Receipt_Bal__Line___Branch_Code_; "Branch Code")
                {
                }
                column(Payment_Receipt_Bal__Line___Department_Code_; "Department Code")
                {
                }
                column(Payment_Receipt_Bal__Line___Account_No__; "Account No.")
                {
                }
                column(ABS__Amount__LCY____Control1000000005; ABS("Amount (LCY)"))
                {
                }
                column(TransactionDescription_PaymentReceiptBalLine; "Transaction Description")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //CurrReport.CREATETOTALS("Amount (LCY)");
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CompanyAddr[1] := CompanyData.Name;


                IF ("Account Type" IN ["Account Type"::"G/L Account", "Account Type"::"Bank Account"]) AND ("Balance Account Type" IN
                   ["Balance Account Type"::Customer, "Balance Account Type"::Vendor])
                  THEN BEGIN
                    CASE "Balance Account Type" OF
                        "Balance Account Type"::Customer:
                            IF Customer.GET("Balance Account No.") THEN BEGIN
                                CustomerAddr[1] := COPYSTR(Customer.Name, 1, 30);
                                CustomerAddr[2] := Customer."Name 2";
                                CustomerAddr[3] := Customer.Address;
                                CustomerAddr[4] := Customer."Address 2";
                                CustomerAddr[7] := Customer.City;
                                CustomerAddr[8] := Customer.Contact;
                                COMPRESSARRAY(CustomerAddr);
                            END;

                        "Balance Account Type"::Vendor:
                            IF vendor.GET("Balance Account No.") THEN BEGIN
                                CustomerAddr[1] := vendor.Name;
                                CustomerAddr[2] := vendor."Name 2";
                                CustomerAddr[3] := vendor.Address;
                                CustomerAddr[4] := vendor."Address 2";
                                CustomerAddr[5] := vendor."Address 3";
                                //CustomerAddr[6] := "P.O.Box";
                                CustomerAddr[7] := vendor.City;
                                CustomerAddr[8] := vendor.Contact;
                                COMPRESSARRAY(CustomerAddr);
                            END;
                        "Balance Account Type"::"Bank Account":
                            IF bank.GET("Balance Account No.") THEN BEGIN
                                CustomerAddr[1] := bank.Name;
                                CustomerAddr[2] := bank."Name 2";
                                CustomerAddr[3] := bank.Address;
                                CustomerAddr[4] := bank."Address 2";
                                CustomerAddr[7] := bank.City;
                                CustomerAddr[8] := bank.Contact;
                                COMPRESSARRAY(CustomerAddr);
                            END;
                        "Balance Account Type"::"Fixed Asset":
                            IF fixed.GET("Balance Account No.") THEN BEGIN
                                CustomerAddr[1] := fixed.Description;
                                CustomerAddr[2] := fixed."Description 2";
                                CustomerAddr[3] := fixed."Location Code";
                                CustomerAddr[4] := fixed."Responsible Employee";
                                COMPRESSARRAY(CustomerAddr);
                            END;
                    END;
                END
                ELSE BEGIN
                    CASE "Account Type" OF
                        "Account Type"::Customer:
                            IF Customer.GET("Account No.") THEN BEGIN
                                CustomerAddr[1] := COPYSTR(Customer.Name, 1, 30);
                                CustomerAddr[2] := Customer."Name 2";
                                CustomerAddr[3] := Customer.Address;
                                CustomerAddr[4] := Customer."Address 2";
                                CustomerAddr[7] := Customer.City;
                                CustomerAddr[8] := Customer.Contact;
                                COMPRESSARRAY(CustomerAddr);
                            END;
                        "Account Type"::"Staff Loan":
                            IF Customer.GET("Account No.") THEN BEGIN
                                CustomerAddr[1] := Customer.Name;
                                CustomerAddr[2] := Customer."Name 2";
                                CustomerAddr[3] := Customer.Address;
                                CustomerAddr[4] := Customer."Address 2";
                                CustomerAddr[7] := Customer.City;
                                CustomerAddr[8] := Customer.Contact;
                                COMPRESSARRAY(CustomerAddr);
                            END;

                        "Account Type"::Vendor:
                            IF vendor.GET("Account No.") THEN BEGIN
                                CustomerAddr[1] := vendor.Name;
                                CustomerAddr[2] := vendor."Name 2";
                                CustomerAddr[3] := vendor.Address;
                                CustomerAddr[4] := vendor."Address 2";
                                CustomerAddr[7] := vendor.City;
                                CustomerAddr[8] := vendor.Contact;
                                COMPRESSARRAY(CustomerAddr);
                            END;
                        "Account Type"::"Bank Account":
                            IF bank.GET("Account No.") THEN BEGIN
                                CustomerAddr[1] := bank.Name;
                                CustomerAddr[2] := bank."Name 2";
                                CustomerAddr[3] := bank.Address;
                                CustomerAddr[4] := bank."Address 2";
                                CustomerAddr[7] := bank.City;
                                CustomerAddr[8] := bank.Contact;
                                COMPRESSARRAY(CustomerAddr);
                            END;
                        "Account Type"::"Fixed Asset":
                            IF fixed.GET("Account No.") THEN BEGIN
                                CustomerAddr[1] := fixed.Description;
                                CustomerAddr[2] := fixed."Description 2";
                                CustomerAddr[3] := fixed."Location Code";
                                CustomerAddr[4] := fixed."Responsible Employee";
                                COMPRESSARRAY(CustomerAddr);
                            END;
                    END;
                END;

                AMOUNTINWORD := figure("Amount (LCY)", 'NAIRA', 'KOBO');
                AMOUNTINWORD := AMOUNTINWORD + ' ONLY.';
                IF ("Multiple Balance Account" = TRUE) OR ("Multiple Account" = TRUE) THEN
                    detatype := TRUE
                ELSE
                    detatype := FALSE;
                IF "Amount (LCY)" = 0 THEN
                    "Amount (LCY)" := Amount;
                MODIFY;



                IF NOT CurrReport.PREVIEW AND reprint THEN BEGIN
                    //"No. Printed" := "No. Printed" + 1;
                    MODIFY;
                END;
            end;

            trigger OnPreDataItem()
            begin
                CompanyData.GET;
                //SETRANGE("No.", ReceiptNo);
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

    trigger OnInitReport()
    begin
        TOTAMOUNT := 0;
        AMOUNTINWORD := '';
    end;

    trigger OnPreReport()
    begin
        //ReceiptNo := GETRANGEMIN("No.");
        //IF ReceiptNo = '' THEN
        //ERROR('Please enter receipt no.!');
    end;

    var
        headertxt: Text[30];
        ipotxt1: Text[30];
        ipotxt2: Text[30];
        paymentot: array[3] of Text[30];
        Changed: Boolean;
        AccRec: Record 98;
        NameOfReceiver: Text[30];
        FinRec: Record 15;
        ipotxt: Text[30];
        "CRNo.": Code[10];
        Product: Record 27;
        purchasetxt: Text[30];
        NoPr: Boolean;
        AmT: array[15] of Text[4];
        AmT1: array[15] of Text[4];
        AmT2: array[15] of Text[4];
        detatype: Boolean;
        AmT3: array[15] of Text[4];
        DepRec: Record 349;
        TotalNet: Decimal;
        VATLiable: Decimal;
        TotalGross: Decimal;
        Delivery: Record 10;
        Payment: Record 3;
        SupplierAddr: array[8] of Text[40];
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
        vendor: Record 23;
        bank: Record 270;
        CustomerAddr: array[8] of Text[40];
        "fixed": Record 5600;
        "Paid/Receipt": Text[50];
        TOTAMOUNT: Decimal;
        AMOUNTINWORD: Text[250];
        value1: Integer;
        value2: Integer;
        value3: Decimal;
        value4: Integer;
        value5: Integer;
        SerialNo: Integer;
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
        a: Integer;
        VALLENT: Integer;
        valent: Integer;
        i: Integer;
        deci: Text[3];
        reprint: Boolean;
        valid: Boolean;
        //ReceiptNo: Code[20];
        Date_CaptionLbl: Label 'Date:';
        Transaction_DescriptionCaptionLbl: Label 'Transaction Description';
        Receipt_No_CaptionLbl: Label 'Receipt No:';
        Cash_ReceiptCaptionLbl: Label 'Cash Receipt';
        BranchCaptionLbl: Label 'Branch';
        DeptCaptionLbl: Label 'Dept';
        Account_DescriptionCaptionLbl: Label 'Account Description';
        AmountCaptionLbl: Label 'Amount';
        Cashier_Signature_CaptionLbl: Label 'Cashier Signature:';
        AMOUNTINWORDCaptionLbl: Label 'Amount In Words :';
        CompanyAddr: array[8] of Text[50];


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

