report 50234 "MVO Stock Per Model Code NET2"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/MVOStockPerModelCodeNET2.rdl';

    dataset
    {
        dataitem(ValueEntryData; "Value Entry")
        {
            DataItemTableView = SORTING("Item No.", "Item Ledger Entry Type", "Posting Date", "Serial No.")
                                WHERE("Item Ledger Entry Type" = FILTER(Purchase | "Positive Adjmt."));
            RequestFilterFields = "Item No.", "Posting Date", "Location Code", "External Document No.";
            RequestFilterHeading = 'MVO Filter';
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(Filter_______GETFILTERS; 'Filter : ' + GETFILTERS)
            {
            }
            column(Value_Entry__Item_No__; "Item No.")
            {
            }
            column(Value_Entry_Description; Description)
            {
            }
            column(Value_Entry__Item_Ledger_Entry_Quantity_; "Item Ledger Entry Quantity")
            {
            }
            column(Value_Entry__Serial_No__; "Serial No.")
            {
            }
            column(ItemLedgEntry__Engine_No__; ItemLedgEntry."Engine No.")
            {
            }
            column(ItemLedgEntry__Exterior_Colour_Name_; ItemLedgEntry."Exterior Colour Name")
            {
            }
            column(ItemLedgEntry__Cost_Amount__Actual__; ItemLedgEntry."Cost Amount (Actual)")
            {
            }
            column(ItemLedgEntry__External_Document_No__; ItemLedgEntry."External Document No.")
            {
            }
            column(Value_Entry__Item_Ledger_Entry_Quantity__Control1000000009; "Item Ledger Entry Quantity")
            {
            }
            column(Value_Entry__Serial_No___Control1000000010; "Serial No.")
            {
            }
            column(ItemLedgEntry__Engine_No___Control1000000013; ItemLedgEntry."Engine No.")
            {
            }
            column(ItemLedgEntry__Exterior_Colour_Name__Control1000000016; ItemLedgEntry."Exterior Colour Name")
            {
            }
            column(ItemLedgEntry__Cost_Amount__Actual___Control1000000019; ItemLedgEntry."Cost Amount (Actual)")
            {
            }
            column(ItemLedgEntry__External_Document_No___Control1000000038; ItemLedgEntry."External Document No.")
            {
            }
            column(Value_Entry__Item_Ledger_Entry_Quantity__Control1000000029; "Item Ledger Entry Quantity")
            {
            }
            column(CostAmount; CostAmount)
            {
            }
            column(AvgCost; AvgCost)
            {
            }
            column(Value_Entry__Item_Ledger_Entry_Quantity__Control1000000032; "Item Ledger Entry Quantity")
            {
            }
            column(CostAmount_Control1000000033; CostAmount)
            {
            }
            column(Inventory_Position_ReportCaption; Inventory_Position_ReportCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Value_Entry__Item_No__Caption; FIELDCAPTION("Item No."))
            {
            }
            column(UnitsCaption; UnitsCaptionLbl)
            {
            }
            column(Value_Entry__Serial_No__Caption; FIELDCAPTION("Serial No."))
            {
            }
            column(ItemLedgEntry__Engine_No__Caption; ItemLedgEntry__Engine_No__CaptionLbl)
            {
            }
            column(ItemLedgEntry__Exterior_Colour_Name_Caption; ItemLedgEntry__Exterior_Colour_Name_CaptionLbl)
            {
            }
            column(Unit_CostCaption; Unit_CostCaptionLbl)
            {
            }
            column(LC_NumberCaption; LC_NumberCaptionLbl)
            {
            }
            column(Average_CostCaption; Average_CostCaptionLbl)
            {
            }
            column(Value_Entry_Entry_No_; "Entry No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                iCount := 0;
                CostAmount := 0;

                IF ValueEntryData."Inventory Posting Group" <> 'N_CARS' THEN
                    CurrReport.SKIP;

                IF ValueEntryData."Item Ledger Entry Quantity" = 0 THEN
                    CurrReport.SKIP;

                ValuEntry.SETCURRENTKEY("Item No.", "Item Ledger Entry Type", "Posting Date", "Serial No.");
                ValuEntry.SETRANGE("Item No.", ValueEntryData."Item No.");
                ValuEntry.SETFILTER("Posting Date", '%1..%2', 0D, EndDate);
                ValuEntry.SETRANGE("Serial No.", ValueEntryData."Serial No.");
                IF ValuEntry.FINDSET THEN
                    REPEAT
                        IF ValuEntry."Item Ledger Entry Quantity" <> 0 THEN
                            iCount := iCount + 1;
                    UNTIL ValuEntry.NEXT = 0;
                IF iCount <> 0 THEN
                    IF (iCount = 1) OR ((iCount MOD 2) <> 0) THEN BEGIN
                        ItemLedgEntry.GET(ValueEntryData."Item Ledger Entry No.");
                        ItemLedgEntry.CALCFIELDS(ItemLedgEntry."Cost Amount (Actual)");
                        CostAmount := ItemLedgEntry."Cost Amount (Actual)";
                    END ELSE
                        CurrReport.SKIP;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Item No.");

                //CurrReport.CREATETOTALS(UCost, TCost);

                EndDate := GETRANGEMAX("Posting Date");
                ValueEntryData.SETFILTER("Posting Date", '%1..%2', 0D, EndDate);
                //CurrReport.CREATETOTALS(CostAmount);
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
        IF ValueEntryData.GETFILTER(ValueEntryData."Posting Date") = '' THEN
            ERROR('Please specify Posting Date filter!!');
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total for ';
        ColourDesc: Text[30];
        ItemRec: Record 27;
        ValuEntry: Record 5802;
        ItemLedgEntry: Record 32;
        ShowZeroInventory: Boolean;
        ColourRec: Record 50067;
        UCost: Decimal;
        AvgCost: Decimal;
        TCost: Decimal;
        EndDate: Date;
        iCount: Integer;
        CostAmount: Decimal;
        ValuEntry2: Record 5802;
        Inventory_Position_ReportCaptionLbl: Label 'Inventory Position Report';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        DescriptionCaptionLbl: Label 'Description';
        UnitsCaptionLbl: Label 'Units';
        ItemLedgEntry__Engine_No__CaptionLbl: Label 'Engine No.';
        ItemLedgEntry__Exterior_Colour_Name_CaptionLbl: Label 'Colour';
        Unit_CostCaptionLbl: Label 'Unit Cost';
        LC_NumberCaptionLbl: Label 'LC Number';
        Average_CostCaptionLbl: Label 'Average Cost';
}

