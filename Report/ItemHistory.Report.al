report 50402 "Item History"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/ItemHistory.rdl';

    dataset
    {
        dataitem(ItemLedEntry; "Item Ledger Entry")
        {
            DataItemTableView = SORTING("Entry No.");
            RequestFilterFields = "Item No.", "Posting Date", "Location Code";
            RequestFilterHeading = 'Item History';
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(OpeningBal; OpeningBal)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Item_Ledger_Entry__Posting_Date_; "Posting Date")
            {
            }
            column(Item_Ledger_Entry__Item_No__; "Item No.")
            {
            }
            column(Item_Ledger_Entry_Description; Description)
            {
            }
            column(Item_Ledger_Entry__Location_Code_; "Location Code")
            {
            }
            column(Item_Ledger_Entry_Quantity; Quantity)
            {
            }
            column(RemainingQty; RemainingQty)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Item_Ledger_Entry__Document_Type_; "Document Type")
            {
            }
            column(Item_Ledger_Entry__Document_No__; "Document No.")
            {
            }
            column(Item_HistoryCaption; Item_HistoryCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Item_Ledger_Entry_QuantityCaption; FIELDCAPTION(Quantity))
            {
            }
            column(Item_Ledger_Entry__Location_Code_Caption; FIELDCAPTION("Location Code"))
            {
            }
            column(Item_Ledger_Entry_DescriptionCaption; FIELDCAPTION(Description))
            {
            }
            column(Item_Ledger_Entry__Item_No__Caption; FIELDCAPTION("Item No."))
            {
            }
            column(Item_Ledger_Entry__Posting_Date_Caption; FIELDCAPTION("Posting Date"))
            {
            }
            column(Remaining_QuantityCaption; Remaining_QuantityCaptionLbl)
            {
            }
            column(Transaction_TypeCaption; Transaction_TypeCaptionLbl)
            {
            }
            column(Document_No_Caption; Document_No_CaptionLbl)
            {
            }
            column(Opening_BalanceCaption; Opening_BalanceCaptionLbl)
            {
            }
            column(Item_Ledger_Entry_Entry_No_; "Entry No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF GETFILTER("Location Code") = '' THEN BEGIN
                    ItemLedgEntry.SETCURRENTKEY("Item No.", "Posting Date", "Location Code");
                    ItemLedgEntry.SETRANGE("Item No.", "Item No.");
                    ItemLedgEntry.SETFILTER("Posting Date", '%1..%2', 0D, GETRANGEMIN("Posting Date") - 1);
                    ItemLedgEntry.CALCSUMS(Quantity);
                    OpeningBal := ItemLedgEntry.Quantity;
                END ELSE BEGIN
                    ItemLedgEntry.SETCURRENTKEY("Item No.", "Posting Date", "Location Code");
                    ItemLedgEntry.SETRANGE("Item No.", "Item No.");
                    ItemLedgEntry.SETFILTER("Posting Date", '%1..%2', 0D, GETRANGEMIN("Posting Date") - 1);
                    ItemLedgEntry.SETRANGE("Location Code", "Location Code");
                    ItemLedgEntry.CALCSUMS(Quantity);
                    OpeningBal := ItemLedgEntry.Quantity;
                END;

                BalanceQty += Quantity;
                RemainingQty := OpeningBal + BalanceQty;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Entry No.");
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
        TotalFor: Label 'Total for ';
        ItemLedgEntry: Record 32;
        OpeningBal: Decimal;
        RemainingQty: Decimal;
        BalanceQty: Decimal;
        Item_HistoryCaptionLbl: Label 'Item History';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Remaining_QuantityCaptionLbl: Label 'Remaining Quantity';
        Transaction_TypeCaptionLbl: Label 'Transaction Type';
        Document_No_CaptionLbl: Label 'Document No.';
        Opening_BalanceCaptionLbl: Label 'Opening Balance';
}

