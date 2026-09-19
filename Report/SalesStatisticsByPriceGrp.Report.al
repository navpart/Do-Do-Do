report 50124 "Sales Statistics By Price Grp"
{
    // 90919-01059..90919-02105
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/SalesStatisticsByPriceGrp.rdl';

    Caption = 'Inventory - Sales Statistics By Item Price Groups';

    dataset
    {
        dataitem(ItemData; Item)
        {
            DataItemTableView = SORTING("Inventory Posting Group", "Item Price Group")
                                WHERE("Inventory Posting Group" = FILTER('N_PARTS'));
            RequestFilterFields = "No.", "Statistics Group", "Date Filter", "Item Price Group";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(STRSUBSTNO_Text000_PeriodText_; STRSUBSTNO(Text000, PeriodText))
            {
            }

            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(USERID; USERID)
            {
            }
            column(STRSUBSTNO___1___2__Item_TABLECAPTION_ItemFilter_; STRSUBSTNO('%1: %2', ItemData.TABLECAPTION, ItemFilter))
            {
            }
            column(Price_Group_________Item_Price_Group_____; 'Price Group - [' + "Item Price Group" + ']')
            {
            }
            column(Price_Group_________Item_Price_Group______Control20; 'Price Group - [' + "Item Price Group" + ']')
            {
            }
            column(Item__No__; "No.")
            {
            }
            column(Item_Description; Description)
            {
            }
            column(Item__Base_Unit_of_Measure_; "Base Unit of Measure")
            {
            }
            column(Item__Unit_Cost_; "Unit Cost")
            {
            }
            column(Item__Unit_Price_; "Unit Price")
            {
            }
            column(Item__Sales__Qty___; "Sales (Qty.)")
            {
            }
            column(Item__Sales__LCY__; "Sales (LCY)")
            {
            }
            column(Profit; Profit)
            {
                AutoFormatType = 1;
            }
            column(ItemProfitPct; ItemProfitPct)
            {
                DecimalPlaces = 1 : 1;
            }
            column(Item__Item_Price_Group_; "Item Price Group")
            {
            }
            column(Item__Sales__Qty____Control32; "Sales (Qty.)")
            {
            }
            column(Item__Sales__LCY___Control33; "Sales (LCY)")
            {
            }
            column(Profit_Control34; Profit)
            {
                AutoFormatType = 1;
            }
            column(ItemProfitPct_Control35; ItemProfitPct)
            {
                DecimalPlaces = 1 : 1;
            }
            column(Item__Sales__Qty____Control37; "Sales (Qty.)")
            {
            }
            column(Item__Sales__LCY___Control38; "Sales (LCY)")
            {
            }
            column(Profit_Control39; Profit)
            {
                AutoFormatType = 1;
            }
            column(ItemProfitPct_Control40; ItemProfitPct)
            {
                DecimalPlaces = 1 : 1;
            }
            column(Inventory___Sales_Statistics_By_Price_GroupCaption; Inventory___Sales_Statistics_By_Price_GroupCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(This_report_also_includes_items_that_are_not_sold_Caption; This_report_also_includes_items_that_are_not_sold_CaptionLbl)
            {
            }
            column(Item__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Item_DescriptionCaption; FIELDCAPTION(Description))
            {
            }
            column(UnitCaption; UnitCaptionLbl)
            {
            }
            column(Item__Unit_Cost_Caption; FIELDCAPTION("Unit Cost"))
            {
            }
            column(Item__Unit_Price_Caption; FIELDCAPTION("Unit Price"))
            {
            }
            column(Item__Sales__Qty___Caption; FIELDCAPTION("Sales (Qty.)"))
            {
            }
            column(Item__Sales__LCY__Caption; FIELDCAPTION("Sales (LCY)"))
            {
            }
            column(Contribution_marginCaption; Contribution_marginCaptionLbl)
            {
            }
            column(ItemProfitPctCaption; ItemProfitPctCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                CALCFIELDS("Sales (Qty.)", "Sales (LCY)", "COGS (LCY)", "Assembly BOM");
                IF ("Sales (Qty.)" = 0) AND NOT PrintAlsoWithoutSale THEN
                    CurrReport.SKIP;
                Profit := "Sales (LCY)" - "COGS (LCY)";
                IF "Sales (LCY)" <> 0 THEN
                    ItemProfitPct := ROUND(Profit / "Sales (LCY)" * 100, 0.1)
                ELSE
                    ItemProfitPct := 0;
            end;

            trigger OnPreDataItem()
            begin
                //CurrReport.CREATETOTALS("Sales (Qty.)","Sales (LCY)",Profit);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Include Items Not Sold"; PrintAlsoWithoutSale)
                {
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

    trigger OnPreReport()
    begin
        ItemFilter := ItemData.GETFILTERS;
        PeriodText := ItemData.GETFILTER("Date Filter");
    end;

    var
        Text000: Label 'Period: %1';
        InvPostingGr: Record 94;
        ItemFilter: Text[250];
        PeriodText: Text[30];
        Profit: Decimal;
        ItemProfitPct: Decimal;
        PrintAlsoWithoutSale: Boolean;
        sPr: Decimal;
        cPr: Decimal;
        Inventory___Sales_Statistics_By_Price_GroupCaptionLbl: Label 'Inventory - Sales Statistics By Price Group';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        This_report_also_includes_items_that_are_not_sold_CaptionLbl: Label 'This report also includes items that are not sold.';
        UnitCaptionLbl: Label 'Unit';
        Contribution_marginCaptionLbl: Label 'Contribution margin';
        ItemProfitPctCaptionLbl: Label 'Profit %';
        TotalCaptionLbl: Label 'Total';
}

