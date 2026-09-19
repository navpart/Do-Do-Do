report 50619 "Avail. Stock per Model"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/AvailStockperModel.rdl';
    Caption = 'Inventory - List';

    dataset
    {
        dataitem(ItemData; Item)
        {
            DataItemTableView = WHERE(Type = CONST(Inventory));
            RequestFilterFields = "Model No.", "Model Name", "No.", "Inventory Posting Group", "Shelf No.";
            column(CompanyName; COMPANYNAME)
            {
            }
            column(ItemFilter; ItemFilter)
            {
            }
            column(No_Item; "No.")
            {
                IncludeCaption = true;
            }
            column(Description_Item; Description)
            {
                IncludeCaption = true;
            }
            column(AssemblyBOM_Item; FORMAT("Assembly BOM"))
            {
            }
            column(BaseUnitofMeasure_Item; "Base Unit of Measure")
            {
                IncludeCaption = true;
            }
            column(InventoryPostingGrp_Item; "Inventory Posting Group")
            {
                IncludeCaption = true;
            }
            column(ShelfNo_Item; "Shelf No.")
            {
                IncludeCaption = true;
            }
            column(VendorItemNo_Item; "Vendor Item No.")
            {
                IncludeCaption = true;
            }
            column(LeadTimeCalculation_Item; "Lead Time Calculation")
            {
                IncludeCaption = true;
            }
            column(ReorderPoint_Item; "Reorder Point")
            {
                IncludeCaption = true;
            }
            column(AlternativeItemNo_Item; "Alternative Item No.")
            {
                IncludeCaption = true;
            }
            column(Blocked_Item; FORMAT(Blocked))
            {
            }
            column(InventoryListCaption; InventoryListCaptionLbl)
            {
            }
            column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
            {
            }
            column(ItemAssemblyBOMCaption; ItemAssemblyBOMCaptionLbl)
            {
            }
            column(ItemBlockedCaption; ItemBlockedCaptionLbl)
            {
            }
            column(LastPurchaseDate; "Last Purchase Date")
            {
            }
            column(LastSalesDate; "Last Sales Date")
            {
            }
            column(NetChange; "Net Change")
            {
            }
            column(StockValue; "Stockvalue.")
            {
            }
            column(Inventory_Item; Inventory)
            {
            }
            dataitem(ItemLedgEntryData; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = FIELD("No.");
                column(ItemLedgerEntry_Remaining_Quantity; ItemLedgEntryData."Remaining Quantity")
                {
                }
            }
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
        ItemFilter := ItemData.GETFILTERS;
    end;

    var
        ItemFilter: Text;
        InventoryListCaptionLbl: Label 'Inventory - List';
        CurrReportPageNoCaptionLbl: Label 'Page';
        ItemAssemblyBOMCaptionLbl: Label 'BOM';
        ItemBlockedCaptionLbl: Label 'Blocked';
}

