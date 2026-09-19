report 50387 EFCC2
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/EFCC2.rdl';

    dataset
    {
        dataitem(DataItem7069; "G/L Entry")
        {
            DataItemTableView = SORTING("Document No.", "Posting Date")
                                WHERE("Document No." = FILTER('TREP*|TPQ*|TRET*|TRQ*|JTRE*|JTP*|JTRE*|JTR*|TGLJ*'),
                                      "Source Type" = FILTER('Vendor|Customer'),
                                      "Source Code" = FILTER(''));
            RequestFilterFields = "Posting Date";
            RequestFilterHeading = 'EFCC';
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(G_L_Entry_Description; Description)
            {
            }
            column(G_L_Entry__Posting_Date_; "Posting Date")
            {
            }
            column(G_L_Entry__Debit_Amount_; "Debit Amount")
            {
            }
            column(G_L_Entry__G_L_Account_No__; "G/L Account No.")
            {
            }
            column(G_L_Entry__Document_No__; "Document No.")
            {
            }
            column(G_L_Entry__Credit_Amount_; "Credit Amount")
            {
            }
            column(G_L_Entry__Source_Type_; "Source Type")
            {
            }
            column(EFCC_Cash_OutCaption; EFCC_Cash_OutCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(G_L_Entry_DescriptionCaption; FIELDCAPTION(Description))
            {
            }
            column(G_L_Entry__Posting_Date_Caption; FIELDCAPTION("Posting Date"))
            {
            }
            column(G_L_Entry__Debit_Amount_Caption; FIELDCAPTION("Debit Amount"))
            {
            }
            column(G_L_Entry__G_L_Account_No__Caption; FIELDCAPTION("G/L Account No."))
            {
            }
            column(G_L_Entry__Document_No__Caption; FIELDCAPTION("Document No."))
            {
            }
            column(G_L_Entry__Credit_Amount_Caption; FIELDCAPTION("Credit Amount"))
            {
            }
            column(G_L_Entry__Source_Type_Caption; FIELDCAPTION("Source Type"))
            {
            }
            column(G_L_Entry_Entry_No_; "Entry No.")
            {
            }
            column(Name; Name)
            {
            }
            column(Address; Addr)
            {
            }
            column(Occupation; Occptn)
            {
            }
            column(ID; ID)
            {
            }
            column(DOB; DOB)
            {
            }
            column(NATION; Nation)
            {
            }
            column(Trans_Date; "Trans Date")
            {
            }
            column(Loc; Loc)
            {
            }
            column(ModeOf_Transactn; "Mode of Transctn")
            {
            }
            column(Currcy; Currcy)
            {
            }
            column(Amount; Amount)
            {
            }
            column(CahCheque; CashCheque)
            {
            }
            column(Incorp; Incorp)
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF ABS(Amount) < 5000000 THEN
                    CurrReport.SKIP;


                "Mode of Transctn" := 0;
                DOB := 0;
                Incorp := '';

                IF "Source Type" = "Source Type"::Vendor THEN BEGIN
                    VendorRec.GET("Source No.");
                    Name := VendorRec.Name;
                    Addr := VendorRec.Address;
                    Occptn := '';
                    //ID  := '';
                    //DOB := 0D;
                    Nation := VendorRec."Country/Region Code";
                    Decriptn := COPYSTR(Description, 1, 30);
                    "Trans Date" := "Posting Date";
                    Loc := "Global Dimension 2 Code";
                    CashCheque := "Journal Batch Name";
                    Currcy := VendorRec."Currency Code";
                END ELSE BEGIN
                    IF "Source Type" = "Source Type"::Customer THEN BEGIN
                        CustRec.GET("Source No.");
                        Name := CustRec.Name;
                        Addr := CustRec.Address + CustRec."Address 2" + ',' + CustRec.City;
                        Occptn := '';
                        ID := CustRec."Type of ID";
                        DOB := CustRec."Birthday/Date of Incorp";
                        Nation := CustRec."Country/Region Code";
                        Decriptn := COPYSTR(Description, 1, 30);
                        "Trans Date" := "Posting Date";
                        Loc := "Global Dimension 2 Code";
                        CashCheque := "Journal Batch Name";
                        Currcy := CustRec."Currency Code";
                    END;
                END;


                IF Currcy = '' THEN
                    Currcy := 'NGN';
                IF ID = 4 THEN
                    Incorp := 'RC No.';
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Document Type");
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

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        VendorRec: Record 23;
        CustRec: Record 18;
        Name: Text[50];
        Addr: Text[100];
        Occptn: Text[30];
        ID: Option " ","Driver License","National ID","Int. Passport","RC No";
        DOB: Integer;
        Nation: Code[10];
        Decriptn: Text[50];
        "Trans Date": Date;
        Loc: Code[10];
        "Mode of Transctn": Option CASH,CHEQUE;
        Currcy: Code[10];
        Text000: Label 'Period: %1';
        Text001: Label 'Data';
        Text002: Label ' ';
        Text003: Label 'Company Name';
        Text004: Label 'Report No.';
        Text005: Label 'Report Name';
        Text006: Label 'User ID';
        Text007: Label 'Date';
        Text008: Label ' ';
        Text009: Label ' ';
        Text010: Label 'Qty';
        Text011: Label 'Transaction Date';
        Text012: Label 'Location of Transaction';
        Text013: Label 'Mode of Transaction';
        Text014: Label 'Currency';
        Text015: Label 'Cash In';
        Text016: Label 'Cash Out';
        Text017: Label 'Name/Name of Company';
        Amount: Decimal;
        CashCheque: Text[30];
        Incorp: Text[30];
        EFCC_Cash_OutCaptionLbl: Label 'EFCC Cash Out';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}

