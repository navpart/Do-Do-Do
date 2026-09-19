report 50216 "Stock Transact. statmt TSP2003"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/StockTransactstatmtTSP2003.rdl';
    ApplicationArea = Basic, Suite;
    Caption = 'Inventory - Transaction Detail';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(ItemData; Item)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", Description, "Assembly BOM", "Inventory Posting Group", "Shelf No.", "Statistics Group", "Date Filter", "Location Filter";
            column(PeriodItemDateFilter; STRSUBSTNO(Text000, ItemDateFilter))
            {
            }
            column(CompanyName; COMPANYPROPERTY.DISPLAYNAME)
            {
            }
            column(TableCaptionItemFilter; STRSUBSTNO('%1: %2', TABLECAPTION, ItemFilter))
            {
            }
            column(ItemFilter; ItemFilter)
            {
            }
            column(No_Item; "No.")
            {
            }
            column(InventoryTransDetailCaption; InventoryTransDetailCaptionLbl)
            {
            }
            column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
            {
            }
            column(ItemLedgEntryPostDateCaption; ItemLedgEntryPostDateCaptionLbl)
            {
            }
            column(ItemLedgEntryEntryTypCaption; ItemLedgEntryEntryTypCaptionLbl)
            {
            }
            column(IncreasesQtyCaption; IncreasesQtyCaptionLbl)
            {
            }
            column(DecreasesQtyCaption; DecreasesQtyCaptionLbl)
            {
            }
            column(ItemOnHandCaption; ItemOnHandCaptionLbl)
            {
            }
            column(Stockvalue_Item; ItemData."Stockvalue.")
            {
            }
            dataitem(PageCounter; Integer)
            {
                DataItemTableView = SORTING(Number)
                                    WHERE(Number = CONST(1));
                column(Description_Item; ItemData.Description)
                {
                }
                column(StartOnHand; StartOnHand)
                {

                }
                column(RecordNo; RecordNo)
                {
                }
                dataitem(DataItem7209; "Item Ledger Entry")
                {
                    DataItemLink = "Item No." = FIELD("No."),
                                   "Variant Code" = FIELD("Variant Filter"),
                                   "Posting Date" = FIELD("Date Filter"),
                                   "Location Code" = FIELD("Location Filter"),
                                   "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                   "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter");
                    DataItemLinkReference = ItemData;
                    DataItemTableView = SORTING("Item No.", "Posting Date");
                    column(StartOnHandQuantity; StartOnHand + Quantity)
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(PostingDate_ItemLedgEntry; FORMAT("Posting Date"))
                    {
                    }
                    column(EntryType_ItemLedgEntry; "Entry Type")
                    {
                    }
                    column(DocumentNo_PItemLedgEntry; "Document No.")
                    {
                        IncludeCaption = true;
                    }
                    column(Description_ItemLedgEntry; Description)
                    {
                        IncludeCaption = true;
                    }
                    column(IncreasesQty; IncreasesQty)
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(DecreasesQty; DecreasesQty)
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(ItemOnHand; ItemOnHand)
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(EntryNo_ItemLedgerEntry; "Entry No.")
                    {
                        IncludeCaption = true;
                    }
                    column(Quantity_ItemLedgerEntry; Quantity)
                    {
                    }
                    column(ItemDescriptionControl32; ItemData.Description)
                    {
                    }
                    column(ContinuedCaption; ContinuedCaptionLbl)
                    {
                    }
                    column(CostAmountActual_ItemLedgerEntry; "Cost Amount (Actual)")
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        ItemOnHand := ItemOnHand + Quantity;
                        IF Quantity > 0 THEN BEGIN
                            IncreasesQty := Quantity;
                            DecreasesQty := 0;
                        END ELSE BEGIN
                            DecreasesQty := ABS(Quantity);
                            IncreasesQty := 0;
                        END;
                    end;

                    trigger OnPreDataItem()
                    begin
                        CLEAR(Quantity);
                        CLEAR(IncreasesQty);
                        CLEAR(DecreasesQty);
                    end;
                }
            }

            trigger OnAfterGetRecord()
            begin
                StartOnHand := 0;
                IF ItemDateFilter <> '' THEN
                    IF GETRANGEMIN("Date Filter") > 00000101D THEN BEGIN
                        SETRANGE("Date Filter", 0D, GETRANGEMIN("Date Filter") - 1);
                        CALCFIELDS("Net Change");
                        StartOnHand := "Net Change";
                        SETFILTER("Date Filter", ItemDateFilter);
                    END;
                ItemOnHand := StartOnHand;

                IF PrintOnlyOnePerPage THEN
                    RecordNo := RecordNo + 1;
            end;

            trigger OnPreDataItem()
            begin
                RecordNo := 1;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(PrintOnlyOnePerPage; PrintOnlyOnePerPage)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Page per Item';
                        ToolTip = 'Specifies if you want each item transaction detail to be printed on a separate page.';
                    }
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
        ItemDateFilter := ItemData.GETFILTER("Date Filter");
    end;

    var
        Text000: Label 'Period: %1';
        ItemFilter: Text;
        ItemDateFilter: Text[30];
        ItemOnHand: Decimal;
        StartOnHand: Decimal;
        IncreasesQty: Decimal;
        DecreasesQty: Decimal;
        PrintOnlyOnePerPage: Boolean;
        RecordNo: Integer;
        InventoryTransDetailCaptionLbl: Label 'Inventory - Transaction Detail';
        CurrReportPageNoCaptionLbl: Label 'Page';
        ItemLedgEntryPostDateCaptionLbl: Label 'Posting Date';
        ItemLedgEntryEntryTypCaptionLbl: Label 'Entry Type';
        IncreasesQtyCaptionLbl: Label 'Increases';
        DecreasesQtyCaptionLbl: Label 'Decreases';
        ItemOnHandCaptionLbl: Label 'Inventory';
        ContinuedCaptionLbl: Label 'Continued';

    procedure InitializeRequest(NewPrintOnlyOnePerPage: Boolean)
    begin
        PrintOnlyOnePerPage := NewPrintOnlyOnePerPage;
    end;
}

