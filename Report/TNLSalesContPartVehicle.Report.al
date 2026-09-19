report 50325 "TNL Sales Cont.Part & Vehicle"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/TNLSalesContPartVehicle.rdl';
    Caption = 'TNL Sales Contribution-Part & Vehicle Accessories';

    dataset
    {
        dataitem(DataItem5444; Integer)
        {
            DataItemTableView = SORTING(Number);
            MaxIteration = 1;
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(StartDate; StartDate)
            {
            }
            column(EndDate; EndDate)
            {
            }
            column(TIME; TIME)
            {
            }
            column(TNL_CONTRIBUTIONCaption; TNL_CONTRIBUTIONCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Sales_Invoice_Header__No__Caption; SalesInvHeaderData.FIELDCAPTION("No."))
            {
            }
            column(Customer_No_Caption; Customer_No_CaptionLbl)
            {
            }
            column(ShowInvoice; ShowInvoice)
            {
            }
            column(ShowFleet; ShowFleet)
            {
            }
            column(ShowWarranty; ShowWarranty)
            {
            }
            column(ShowCreditMemo; ShowCreditMemo)
            {
            }
            column(AmtCaption; AmtCaptionLbl)
            {
            }
            column(Sales_Invoice_Header__Cost_Value_Caption; SalesInvHeaderData.FIELDCAPTION("Cost Value"))
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
            column(Line_Item_CountCaption; Line_Item_CountCaptionLbl)
            {
            }
            column(Sales_Invoice_Header__Posting_Date_Caption; SalesInvHeaderData.FIELDCAPTION("Posting Date"))
            {
            }
            column(Integer_Number; Number)
            {
            }
            dataitem(SalesInvHeaderData; "Sales Invoice Header")
            {
                CalcFields = Amount, "Cost Value", Quantity, "Line Item Count";
                DataItemTableView = SORTING("Posting Date", "No.")
                                    WHERE("Source Code" = FILTER('<>DELETED'));
                RequestFilterFields = "No.", "Sell-to Customer No.", "Shortcut Dimension 1 Code", "Order Type", "Gen. Bus. Posting Group", "Customer Posting Group", "Location Code", "Shortcut Dimension 2 Code";
                column(FILTERS_______GETFILTERS__; 'FILTERS := ' + GETFILTERS())
                {
                }
                column(Quantity_SalesInvoiceHeader; SalesInvHeaderData.Quantity)
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
                column(OrderType_SalesInvoiceHeader; SalesInvHeaderData."Order Type")
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
                column(Sales_Invoice_Header__Line_Item_Count_; "Line Item Count")
                {

                }
                column(Sales_Invoice_Header__Posting_Date_; "Posting Date")
                {
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
                column(L1; L1)
                {

                }
                column(Total_For_____FORMAT_InvCount______Invoices_; 'Total For ' + FORMAT(InvCount) + ' Invoices')
                {

                }
                column(Sales_InvoiceCaption; Sales_InvoiceCaptionLbl)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    IF NOT ShowInvoice THEN CurrReport.SKIP;

                    IF (SalesInvHeaderData."Currency Factor" <> 0) THEN
                        Amt := SalesInvHeaderData.Amount / SalesInvHeaderData."Currency Factor"
                    ELSE
                        Amt := SalesInvHeaderData.Amount;

                    Cont := Amt - SalesInvHeaderData."Cost Value";

                    IF Amt <> 0 THEN
                        ContPercent := (Cont / Amt) * 100
                    ELSE
                        Cont := 0;


                    InvCount := InvCount + 1;
                    L1 := L1 + SalesInvHeaderData."Line Item Count";
                end;

                trigger OnPreDataItem()
                begin
                    //CurrReport.CREATETOTALS(Cont);

                    CASE ItemType OF
                        1:
                            SalesInvHeaderData.SETRANGE(SalesInvHeaderData."Shortcut Dimension 1 Code", '05PARTS');
                        2:
                            SalesInvHeaderData.SETRANGE(SalesInvHeaderData."Shortcut Dimension 1 Code", '09MARKET');
                        3:
                            SalesInvHeaderData.SETRANGE(SalesInvHeaderData."Shortcut Dimension 1 Code", '06SERVICE');
                    END;

                    SalesInvHeaderData.SETFILTER(SalesInvHeaderData."Posting Date", '%1..%2', StartDate, EndDate);
                    IF CustPGrp <> '' THEN
                        SalesInvHeaderData.SETRANGE(SalesInvHeaderData."Customer Posting Group", CustPGrp);


                    InvCount := 0;
                    CrCount := 0;
                end;
            }
            dataitem(SalesCrMemoData; "Sales Cr.Memo Header")
            {
                CalcFields = "Lines Shortcut Dimension 1", "Cost Value", Amount, Quantity, "Line Item Count";
                DataItemTableView = SORTING("Posting Date", "No.")
                                    WHERE("Source Code" = FILTER('<>DELETED'));
                RequestFilterFields = "No.", "Sell-to Customer No.", "Shortcut Dimension 1 Code", "Order Type", "Gen. Bus. Posting Group", "Customer Posting Group", "Location Code", "Shortcut Dimension 2 Code";
                column(FILTERS_______GETFILTERS___Control1000000050; 'FILTERS := ' + GETFILTERS())
                {
                }
                column(Sales_Cr_Memo_Header__No__; "No.")
                {
                }
                column(Sales_Cr_Memo_Header__Sell_to_Customer_No__; "Sell-to Customer No.")
                {
                }
                column(Quantity_SalesCrMemoHeader; SalesCrMemoData.Quantity)
                {
                }
                column(Amt2; Amt2)
                {
                }
                column(CostValue2; "Cost Value")
                {
                }
                column(Cont2; Cont2)
                {
                }
                column(ContPercent2; ContPercent2)
                {
                }
                column(Sales_Cr_Memo_Header__Sell_to_Customer_Name_; "Sell-to Customer Name")
                {
                }
                column(LineCount2; "Line Item Count")
                {

                }
                column(PostingDate2; "Posting Date")
                {
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
                column(L2; L2)
                {

                }
                column(Total_For_____FORMAT_CrCount______Credit_Notes_; 'Total For ' + FORMAT(CrCount) + ' Credit Notes')
                {

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
                column(Inv_Line_Item_Count; "Inv Line Item Count")
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
                column(L1_Control1000000068; L1)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(L2_Control1000000069; L2)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(InvCount; InvCount)
                {

                }
                column(CrCount; CrCount)
                {

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

                trigger OnAfterGetRecord()
                begin
                    IF NOT ShowCreditMemo THEN CurrReport.SKIP;

                    IF (SalesCrMemoData."Currency Factor" <> 0) THEN
                        Amt2 := SalesCrMemoData.Amount / SalesCrMemoData."Currency Factor"
                    ELSE
                        Amt2 := SalesCrMemoData.Amount;

                    Cont2 := Amt2 - SalesCrMemoData."Cost Value";

                    IF Amt2 <> 0 THEN
                        ContPercent2 := (Cont2 / Amt2) * 100
                    ELSE
                        ContPercent2 := 0;

                    CrCount := CrCount + 1;
                    L2 := L2 + SalesCrMemoData."Line Item Count";
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
                            SalesCrMemoData.SETRANGE(SalesCrMemoData."Shortcut Dimension 1 Code", '05PARTS');
                        2:
                            SalesCrMemoData.SETRANGE(SalesCrMemoData."Shortcut Dimension 1 Code", '09MARKET');
                        3:
                            SalesCrMemoData.SETRANGE(SalesCrMemoData."Shortcut Dimension 1 Code", '06SERVICE');
                    END;


                    SalesCrMemoData.SETFILTER(SalesCrMemoData."Posting Date", '%1..%2', StartDate, EndDate);
                    IF CustPGrp <> '' THEN
                        SalesCrMemoData.SETRANGE(SalesCrMemoData."Customer Posting Group", CustPGrp);
                end;
            }
            dataitem(ItemLedEntryData; "Item Ledger Entry")
            {
                CalcFields = "Cost Amount (Actual)";
                DataItemTableView = SORTING("Document No.", "Document Type", "Document Line No.")
                                    WHERE("Source No." = FILTER('TDV*'),
                                          "Inventory Posting Group" = FILTER('N_PARTS|ACCESSORY'),
                                          "Product Grp Code" = FILTER('ACCESORIES'));
                column(SourceNo_ItemLedgerEntry; ItemLedEntryData."Source No.")
                {
                }
                column(Item_Ledger_Entry__Cost_Amount__Actual__; "Cost Amount (Actual)")
                {
                }
                column(Quantity_ItemLedgerEntry; ItemLedEntryData.Quantity)
                {
                }
                column(Item_Ledger_Entry__Document_No__; "Document No.")
                {
                }
                column(Item_Ledger_Entry__Posting_Date_; "Posting Date")
                {
                }
                column(FCount; FCount)
                {

                }
                column(InvCount_Control1000000097; InvCount)
                {

                }
                column(CrCount_Control1000000098; CrCount)
                {

                }
                column(WtCount_Control1000000128; WtCount)
                {

                }
                column(L1_Control1000000129; L1)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(L2_Control1000000130; L2)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(L3_Control1000000131; L3)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(TAmountInv_Control1000000135; TAmountInv)
                {
                }
                column(TAmountCr_Control1000000136; TAmountCr)
                {
                }
                column(AllAmount_Control1000000137; AllAmount)
                {
                }
                column(TAmountWt_Control1000000138; TAmountWt)
                {
                }
                column(TCostInv_Control1000000139; TCostInv)
                {
                }
                column(TCostCr_Control1000000140; TCostCr)
                {
                }
                column(AllCost_Control1000000141; AllCost)
                {
                }
                column(TCostWt_Control1000000142; TCostWt)
                {
                }
                column(TContInv_Control1000000143; TContInv)
                {
                }
                column(TContCr_Control1000000144; TContCr)
                {
                }
                column(AllCont_Control1000000145; AllCont)
                {
                }
                column(TContPctInv_Control1000000146; TContPctInv)
                {
                }
                column(TContPctCr_Control1000000147; TContPctCr)
                {
                }
                column(AllPct_Control1000000148; AllPct)
                {
                }
                column(TotalCostAmount; TotalCostAmount)
                {
                }
                column(TotalCostAmount_Control1000000150; TotalCostAmount)
                {
                }
                column(FLTCount; FLTCount)
                {

                }
                column(TNL_Fleet_Parts_ConsumptionCaption; TNL_Fleet_Parts_ConsumptionCaptionLbl)
                {
                }
                column(Total_Sales_InvoiceCaption_Control1000000092; Total_Sales_InvoiceCaption_Control1000000092Lbl)
                {
                }
                column(Total_Credit_MemoCaption_Control1000000094; Total_Credit_MemoCaption_Control1000000094Lbl)
                {
                }
                column(Total_Warranty_ClaimCaption_Control1000000096; Total_Warranty_ClaimCaption_Control1000000096Lbl)
                {
                }
                column(Overall_SalesCaption_Control1000000132; Overall_SalesCaption_Control1000000132Lbl)
                {
                }
                column(Total_TNL_FleetCaption; Total_TNL_FleetCaptionLbl)
                {
                }
                column(Item_Ledger_Entry_Entry_No_; "Entry No.")
                {
                }
                column(CustomerNo; CustomerNo)
                {
                }
                column(SalesAmountActual_ItemLedgerEntry; ItemLedEntryData."Sales Amount (Actual)")
                {
                }
                column(CustomerName; CustomerName)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //ItemLedEntryData.SETFILTER(ItemLedEntryData."Document No.",'TCOF*');
                    Quantity := ABS(Quantity);
                    FLTCount := FLTCount + 1;
                    L4 := 0;
                    L4 := L4 + 1;

                    //CurrReport.CREATETOTALS(L4);
                    FCount := L4;
                    //CurrReport.CREATETOTALS(FCount);


                    IF "Shipment Header".GET("Document No.") THEN BEGIN
                        CustomerNo := "Shipment Header"."Sell-to Customer No.";
                        CustomerName := "Shipment Header"."Ship-to Name";
                    END;
                end;

                trigger OnPreDataItem()
                begin
                    IF NOT ShowFleet THEN CurrReport.SKIP;
                    SETFILTER("Posting Date", '%1..%2', StartDate, EndDate);

                    LastFieldNo := FIELDNO("Document No.");
                end;
            }
            dataitem("<Item Ledger Entry2>"; "Item Ledger Entry")
            {
                CalcFields = "Cost Amount (Actual)";
                DataItemTableView = SORTING("Document No.", "Document Type", "Document Line No.")
                                    WHERE("Source No." = FILTER('TDP*'),
                                          "Inventory Posting Group" = FILTER('N_PARTS|ACCESSORY'),
                                          "Product Grp Code" = FILTER('ACCESORIES'));
                column(SourceNo_ItemLedgerEntry2; ItemLedEntryData."Source No.")
                {
                }
                column(Item_Ledger_Entry__Cost_Amount__Actual__2; "Cost Amount (Actual)")
                {
                }
                column(Item_Ledger_Entry__Document_No__2; "Document No.")
                {
                }
                column(Quantity_ItemLedgerEntry2; "<Item Ledger Entry2>".Quantity)
                {
                }
                column(Item_Ledger_Entry__Posting_Date_2; "Posting Date")
                {
                }
                column(FCount2; FCount)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(InvCount_Control10000000972; InvCount)
                {

                }
                column(CrCount_Control10000000982; CrCount)
                {

                }
                column(WtCount_Control10000001282; WtCount)
                {

                }
                column(L1_Control10000001292; L1)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(L2_Control10000001302; L2)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(L3_Control10000001312; L3)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(TAmountInv_Control10000001352; TAmountInv)
                {
                }
                column(TAmountCr_Control10000001362; TAmountCr)
                {
                }
                column(AllAmount_Control10000001372; AllAmount)
                {
                }
                column(TAmountWt_Control10000001382; TAmountWt)
                {
                }
                column(TCostInv_Control100000013922; TCostInv)
                {
                }
                column(TCostCr_Control10000001402; TCostCr)
                {
                }
                column(AllCost_Control10000001412; AllCost)
                {
                }
                column(TCostWt_Control10000001422; TCostWt)
                {
                }
                column(TContInv_Control10000001432; TContInv)
                {
                }
                column(TContCr_Control10000001442; TContCr)
                {
                }
                column(AllCont_Control10000001452; AllCont)
                {
                }
                column(TContPctInv_Control10000001462; TContPctInv)
                {
                }
                column(TContPctCr_Control10000001472; TContPctCr)
                {
                }
                column(AllPct_Control10000001482; AllPct)
                {
                }
                column(TotalCostAmount2; TotalCostAmount)
                {
                }
                column(TotalCostAmount_Control10000001502; TotalCostAmount)
                {
                }
                column(FLTCount2; FLTCount)
                {

                }
                column(TNL_Fleet_Parts_ConsumptionCaption2; TNL_Fleet_Parts_ConsumptionCaptionLbl)
                {
                }
                column(Total_Sales_InvoiceCaption_Control10000000922; Total_Sales_InvoiceCaption_Control1000000092Lbl)
                {
                }
                column(Total_Credit_MemoCaption_Control10000000942; Total_Credit_MemoCaption_Control1000000094Lbl)
                {
                }
                column(Total_Warranty_ClaimCaption_Control10000000962; Total_Warranty_ClaimCaption_Control1000000096Lbl)
                {
                }
                column(Overall_SalesCaption_Control10000001322; Overall_SalesCaption_Control1000000132Lbl)
                {
                }
                column(Total_TNL_FleetCaption2; Total_TNL_FleetCaptionLbl)
                {
                }
                column(Item_Ledger_Entry_Entry_No_2; "Entry No.")
                {
                }
                column(CustomerNo2; CustomerNo)
                {
                }
                column(SalesAmountActual_ItemLedgerEntry2; "<Item Ledger Entry2>"."Sales Amount (Actual)")
                {
                }
                column(CustomerName2; CustomerName)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //ItemLedEntryData.SETFILTER(ItemLedEntryData."Document No.",'TCOF*');
                    Quantity := ABS(Quantity);
                    FLTCount := FLTCount + 1;
                    L4 := 0;
                    L4 := L4 + 1;

                    //CurrReport.CREATETOTALS(L4);
                    FCount := L4;
                    //CurrReport.CREATETOTALS(FCount);


                    IF "Shipment Header".GET("Document No.") THEN BEGIN
                        CustomerNo := "Shipment Header"."Sell-to Customer No.";
                        CustomerName := "Shipment Header"."Ship-to Name";
                    END;
                end;

                trigger OnPreDataItem()
                begin
                    IF NOT ShowFleet THEN CurrReport.SKIP;
                    SETFILTER("Posting Date", '%1..%2', StartDate, EndDate);

                    LastFieldNo := FIELDNO("Document No.");
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Starting Date"; StartDate)
                {
                    Caption = 'Starting Date';
                    ApplicationArea = All;
                }
                field("Ending Date"; EndDate)
                {
                    Caption = 'Ending Date';
                    ApplicationArea = All;
                }
                field("Item Type"; ItemType)
                {
                    Caption = 'Item Type';
                    ApplicationArea = All;
                }
                field("Customer Posting Group"; CustPGrp)
                {
                    Caption = 'Customer Posting Group';
                    ApplicationArea = All;
                }
                field("Show Invoice"; ShowInvoice)
                {
                    Caption = 'Show Invoice';
                    ApplicationArea = All;
                }
                field("Show Credit_Memo"; ShowCreditMemo)
                {
                    Caption = 'Show Credit_Memo';
                    ApplicationArea = All;
                }
                field("Show TNL Fleet"; ShowFleet)
                {
                    Caption = 'Show Accessories';
                    ApplicationArea = All;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        ContPercent2: Decimal;
        Cont2: Decimal;
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
        Amt2: Decimal;
        WtCount: Integer;
        L3: Decimal;
        "Warranty Line Item Count": Integer;
        TAmountWt: Decimal;
        TCostWt: Decimal;
        ShowWarranty: Boolean;
        LastFieldNo: Integer;
        FLTCount: Integer;
        ShowFleet: Boolean;
        DocCount: Integer;
        FCount: Decimal;
        L4: Decimal;
        TotalCostAmount: Decimal;
        TNL_CONTRIBUTIONCaptionLbl: Label 'TNL CONTRIBUTION';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Customer_No_CaptionLbl: Label 'Customer No.';
        AmtCaptionLbl: Label 'Amount';
        Customer_NameCaptionLbl: Label 'Customer Name';
        Contribution_MarginCaptionLbl: Label 'Contribution Margin';
        Contr___CaptionLbl: Label 'Contr. %';
        Line_Item_CountCaptionLbl: Label 'Line Item Count';
        Sales_InvoiceCaptionLbl: Label 'Sales Invoice';
        Credit_MemoCaptionLbl: Label 'Credit Memo';
        Total_Sales_InvoiceCaptionLbl: Label 'Total Sales Invoice';
        Total_Credit_MemoCaptionLbl: Label 'Total Credit Memo';
        Overall_SalesCaptionLbl: Label 'Overall Sales';
        Warranty_ClaimCaptionLbl: Label 'Warranty Claim';
        Total_Sales_InvoiceCaption_Control1000000115Lbl: Label 'Total Sales Invoice';
        Total_Credit_MemoCaption_Control1000000116Lbl: Label 'Total Credit Memo';
        Overall_SalesCaption_Control1000000117Lbl: Label 'Overall Sales';
        Total_Warranty_ClaimCaptionLbl: Label 'Total Warranty Claim';
        TNL_Fleet_Parts_ConsumptionCaptionLbl: Label 'TNL Fleet Parts Consumption';
        Total_Sales_InvoiceCaption_Control1000000092Lbl: Label 'Total Sales Invoice';
        Total_Credit_MemoCaption_Control1000000094Lbl: Label 'Total Credit Memo';
        Total_Warranty_ClaimCaption_Control1000000096Lbl: Label 'Total Warranty Claim';
        Overall_SalesCaption_Control1000000132Lbl: Label 'Overall Sales';
        Total_TNL_FleetCaptionLbl: Label 'Total TNL Fleet';
        CustomerNo: Code[15];
        CustomerName: Text[50];
        "Shipment Header": Record 110;
        VCount: Decimal;
        L5: Decimal;
        VLTCount: Integer;
        Customer: Code[15];
        Customer_Name: Text[50];
}

