report 50184 "TNL Sales Contribution"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/TNLSalesContribution.rdl';

    dataset
    {
        dataitem(DataItem5581; "Sales Invoice Header")
        {
            CalcFields = Amount, "Cost Value", Quantity, "Line Item Count";
            DataItemTableView = SORTING("Posting Date", "No.")
                                WHERE("Source Code" = FILTER('<>*DELETE'));
            RequestFilterFields = "No.", "Sell-to Customer No.", "Shortcut Dimension 1 Code", "Order Type", "Gen. Bus. Posting Group", "Customer Posting Group", "Location Code", "Shortcut Dimension 2 Code";
            column(FILTERS_______GETFILTERS__; 'FILTERS := ' + GETFILTERS())
            {
            }
            column(Sales_Invoice_Header__No__; "No.")
            {
            }
            column(Sales_Invoice_Header__Sell_to_Customer_No__; "Sell-to Customer No.")
            {
            }
            column(Amt; Amt)
            {
            }
            column(Sales_Invoice_Header__Cost_Value_; "Cost Value")
            {
            }
            column(Cont; Cont)
            {
            }
            column(ContPercent; ContPercent)
            {
            }
            column(Sales_Invoice_Header__Sell_to_Customer_Name_; "Sell-to Customer Name")
            {
            }
            column(Sales_Invoice_Header__Posting_Date_; "Posting Date")
            {
            }
            column(Sales_Invoice_Header_Quantity; Quantity)
            {
                DecimalPlaces = 0 : 0;
            }
            column(TAmountInv; TAmountInv)
            {
            }
            column(TCostInv; TCostInv)
            {
            }
            column(TContInv; TContInv)
            {
            }
            column(TContPctInv; TContPctInv)
            {
            }
            column(Total_For_____FORMAT_InvCount______Invoices_; 'Total For ' + FORMAT(InvCount) + ' Invoices')
            {
                //DecimalPlaces = 0 : 0;
            }
            column(Qty1; Qty1)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Sales_InvoiceCaption; Sales_InvoiceCaptionLbl)
            {
            }
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(InvCount; InvCount)
            {
            }
            column(TNL_CONTRIBUTIONCaption; TNL_CONTRIBUTIONCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Inv_Line_Item_Count; "Inv Line Item Count")
            {
            }
            column(Sales_Invoice_Header__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Customer_No_Caption; Customer_No_CaptionLbl)
            {
            }
            column(AmtCaption; AmtCaptionLbl)
            {
            }
            column(Sales_Invoice_Header__Cost_Value_Caption; FIELDCAPTION("Cost Value"))
            {
            }
            column(Customer_NameCaption; Customer_NameCaptionLbl)
            {
            }
            column(Contribution_MarginCaption; Contribution_MarginCaptionLbl)
            {
            }
            column(Contr___Caption; Contr___CaptionLbl)
            {
            }
            column(QtyCaption; QtyCaptionLbl)
            {
            }
            column(Sales_Invoice_Header__Posting_Date_Caption; FIELDCAPTION("Posting Date"))
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF NOT ShowInvoice THEN CurrReport.SKIP;

                IF ("Currency Factor" <> 0) THEN
                    Amt := Amount / "Currency Factor"
                ELSE
                    Amt := Amount;

                Cont := Amt - "Cost Value";

                IF Amt <> 0 THEN
                    ContPercent := (Cont / Amt) * 100
                ELSE
                    Cont := 0;

                InvCount := InvCount + 1;
                L1 := L1 + "Line Item Count";
            end;

            trigger OnPreDataItem()
            begin
                //CurrReport.CREATETOTALS(Cont);

                CASE ItemType OF
                    1:
                        BEGIN
                            SETRANGE("Shortcut Dimension 1 Code", '05PARTS');
                        END;
                    2:
                        BEGIN
                            SETRANGE("Shortcut Dimension 1 Code", '09MARKET');
                        END;
                    3:
                        BEGIN
                            SETRANGE("Shortcut Dimension 1 Code", '06SERVICE');
                        END;
                END;

                SETFILTER("Posting Date", '%1..%2', StartDate, EndDate);
                IF CustPGrp <> '' THEN
                    SETRANGE("Customer Posting Group", CustPGrp);

                InvCount := 0;
                CrCount := 0;
            end;
        }
        dataitem(DataItem8098; "Sales Cr.Memo Header")
        {
            CalcFields = "Lines Shortcut Dimension 1", "Cost Value", Amount, Quantity, "Line Item Count";
            DataItemTableView = SORTING("Posting Date", "No.")
                                WHERE("Source Code" = FILTER('<>*DELETED'));
            RequestFilterFields = "No.", "Sell-to Customer No.", "Shortcut Dimension 1 Code", "Order Type", "Gen. Bus. Posting Group", "Customer Posting Group", "Location Code", "Shortcut Dimension 2 Code";
            column(FILTERS_______GETFILTERS___Control1000000050; 'FILTERS := ' + GETFILTERS())
            {
            }
            column(Sales_Cr_Memo_Header__Line_Item_Count_; "Line Item Count")
            {
                //DecimalPlaces = 0:0;
            }
            column(Sales_Cr_Memo_Header__No__; "No.")
            {
            }
            column(Sales_Cr_Memo_Header__Sell_to_Customer_No__; "Sell-to Customer No.")
            {
            }
            column(Amt_Control1000000023; Amt)
            {
            }
            column(Sales_Cr_Memo_Header__Cost_Value_; "Cost Value")
            {
            }
            column(Cont_Control1000000025; Cont)
            {
            }
            column(ContPercent_Control1000000026; ContPercent)
            {
            }
            column(Sales_Cr_Memo_Header__Sell_to_Customer_Name_; "Sell-to Customer Name")
            {
            }
            column(Sales_Cr_Memo_Header__Posting_Date_; "Posting Date")
            {
            }
            column(Sales_Cr_Memo_Header_Quantity; Quantity)
            {
                DecimalPlaces = 0 : 0;
            }
            column(TAmountCr; TAmountCr)
            {
            }
            column(TCostCr; TCostCr)
            {
            }
            column(TContCr; TContCr)
            {
            }
            column(TContPctCr; TContPctCr)
            {
            }
            column(Total_For_____FORMAT_CrCount______Credit_Notes_; 'Total For ' + FORMAT(CrCount) + ' Credit Notes')
            {
                //DecimalPlaces = 0:0;
            }
            column(Qty2; Qty2)
            {
                DecimalPlaces = 0 : 0;
            }
            column(TAmountInv_Control1000000028; TAmountInv)
            {
            }
            column(TCostInv_Control1000000029; TCostInv)
            {
            }
            column(TContInv_Control1000000034; TContInv)
            {
            }
            column(TContPctInv_Control1000000035; TContPctInv)
            {
            }
            column(TAmountCr_Control1000000046; TAmountCr)
            {
            }
            column(TCostCr_Control1000000047; TCostCr)
            {
            }
            column(TContCr_Control1000000048; TContCr)
            {
            }
            column(TContPctCr_Control1000000049; TContPctCr)
            {
            }
            column(AllAmount; AllAmount)
            {
            }
            column(AllCost; AllCost)
            {
            }
            column(AllCont; AllCont)
            {
            }
            column(AllPct; AllPct)
            {
            }
            column(Qty1_Control1000000068; Qty1)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Qty2_Control1000000069; Qty2)
            {
                DecimalPlaces = 0 : 0;
            }
            column(CrCount; CrCount)
            {
                //DecimalPlaces = 0:0;
            }
            column(Credit_MemoCaption; Credit_MemoCaptionLbl)
            {
            }
            column(Total_Sales_InvoiceCaption; Total_Sales_InvoiceCaptionLbl)
            {
            }
            column(Total_Credit_MemoCaption; Total_Credit_MemoCaptionLbl)
            {
            }
            column(Overall_SalesCaption; Overall_SalesCaptionLbl)
            {
            }
            column(ShowCreditMemo; ShowCreditMemo)
            {
            }
            column(ShowInvoice; ShowInvoice)
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF NOT ShowCreditMemo THEN CurrReport.SKIP;

                IF ("Currency Factor" <> 0) THEN
                    Amt := Amount / "Currency Factor"
                ELSE
                    Amt := Amount;

                Cont := Amt - "Cost Value";


                IF Amt <> 0 THEN
                    ContPercent := (Cont / Amt) * 100
                ELSE
                    ContPercent := 0;

                CrCount := CrCount + 1;
                L2 := L2 + "Line Item Count";
            end;

            trigger OnPreDataItem()
            begin
                //CurrReport.CREATETOTALS(Cont);
                Cont := 0;
                Amount := 0;
                TContCr := 0;
                TAmountCr := 0;

                CASE ItemType OF
                    1:
                        SETRANGE("Shortcut Dimension 1 Code", '05PARTS');
                    2:
                        SETRANGE("Shortcut Dimension 1 Code", '09MARKET');
                    3:
                        SETRANGE("Shortcut Dimension 1 Code", '06SERVICE');
                END;

                SETFILTER("Posting Date", '%1..%2', StartDate, EndDate);
                IF CustPGrp <> '' THEN
                    SETRANGE("Customer Posting Group", CustPGrp);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Start Date"; StartDate)
                {
                    ApplicationArea = All;
                }
                field("End Date"; EndDate)
                {
                    ApplicationArea = All;
                }
                field("Item Type"; ItemType)
                {
                    ApplicationArea = All;
                }
                field("Customer Posting Group"; CustPGrp)
                {
                    ApplicationArea = All;
                }
                field("Show Invoice"; ShowInvoice)
                {
                    ApplicationArea = All;
                }
                field("Show Credit Memo"; ShowCreditMemo)
                {
                    ApplicationArea = All;
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin

            //StartDate := CALCDATE('-1M',TODAY);
            //EndDate := TODAY;
            ShowCreditMemo := TRUE;
            ShowInvoice := TRUE;
        end;
    }

    labels
    {
    }

    var
        Cont: Decimal;
        ContCr: Decimal;
        ContPercent: Decimal;
        TContPctInv: Decimal;
        TContPctCr: Decimal;
        TContInv: Decimal;
        TAmountInv: Decimal;
        TContCr: Decimal;
        TAmountCr: Decimal;
        TCostInv: Decimal;
        TCostCr: Decimal;
        AllAmount: Decimal;
        AllCost: Decimal;
        AllCont: Decimal;
        AllPct: Decimal;
        StartDate: Date;
        EndDate: Date;
        ItemType: Option All,"Spare Parts",Vehicles,Training;
        CustFilter: Code[100];
        InvoiceFilter: Code[100];
        CrMemoFilter: Code[100];
        CustPGrp: Code[20];
        ShowCreditMemo: Boolean;
        ShowInvoice: Boolean;
        "Inv Line Item Count": Integer;
        "Cr Line Item Count": Integer;
        InvCount: Integer;
        CrCount: Integer;
        L1: Decimal;
        L2: Decimal;
        Amt: Decimal;
        Qty1: Decimal;
        Qty2: Decimal;
        TNL_CONTRIBUTIONCaptionLbl: Label 'TNL CONTRIBUTION';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Customer_No_CaptionLbl: Label 'Customer No.';
        AmtCaptionLbl: Label 'Amount';
        Customer_NameCaptionLbl: Label 'Customer Name';
        Contribution_MarginCaptionLbl: Label 'Contribution Margin';
        Contr___CaptionLbl: Label 'Contr. %';
        QtyCaptionLbl: Label 'Qty';
        Sales_InvoiceCaptionLbl: Label 'Sales Invoice';
        Credit_MemoCaptionLbl: Label 'Credit Memo';
        Total_Sales_InvoiceCaptionLbl: Label 'Total Sales Invoice';
        Total_Credit_MemoCaptionLbl: Label 'Total Credit Memo';
        Overall_SalesCaptionLbl: Label 'Overall Sales';
}

