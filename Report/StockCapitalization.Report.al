report 50550 "Stock Capitalization"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/StockCapitalization.rdl';

    dataset
    {
        dataitem(DataItem100000000; "Stock Capitalisation")
        {
            RequestFilterFields = "Code";
            column(Code_StockCapitalisation; Code)
            {
            }
            column(TransactionDate_StockCapitalisation; "Transaction Date")
            {
            }
            column(GlobalDimension1_StockCapitalisation; "Global Dimension 1")
            {
            }
            column(GlobalDimension2_StockCapitalisation; "Global Dimension 2")
            {
            }
            column(ItemNo_StockCapitalisation; "Item No.")
            {
            }
            column(ItemDescription_StockCapitalisation; "Item Description")
            {
            }
            column(Location_StockCapitalisation; Location)
            {
            }
            column(VariantCode_StockCapitalisation; "Variant Code")
            {
            }
            column(AssetNo_StockCapitalisation; "Asset No.")
            {
            }
            column(AssetDescription_StockCapitalisation; "Asset Description")
            {
            }
            column(AssetAquisitionDate_StockCapitalisation; "Asset Aquisition Date")
            {
            }
            column(Processed_StockCapitalisation; Processed)
            {
            }
            column(Quantity_StockCapitalisation; Quantity)
            {
            }
            column(Processdate_StockCapitalisation; "Process date")
            {
            }
            column(ProcessTime_StockCapitalisation; "Process Time")
            {
            }
            column(ProcessBy_StockCapitalisation; "Process By")
            {
            }
            column(StockCapitalisationAccount_StockCapitalisation; "Stock Capitalisation Account")
            {
            }
            column(NoSeries_StockCapitalisation; "No. Series")
            {
            }
            column(StockCapitalisationApproval_StockCapitalisation; "Stock Capitalisation Approval")
            {
            }
            column(CapitalisationApprovedBy_StockCapitalisation; "Capitalisation Approved By")
            {
            }
            column(CapitalisationApprovedTime_StockCapitalisation; "Capitalisation Approved Time")
            {
            }
            column(CapitalisationApprovedDate_StockCapitalisation; "Capitalisation Approved Date")
            {
            }
            column(ChasisNo_StockCapitalisation; "Chasis No.")
            {
            }
            column(Color_StockCapitalisation; Color)
            {
            }
            column(EngineNo_StockCapitalisation; "Engine No.")
            {
            }
            column(KeyNo_StockCapitalisation; "Key No.")
            {
            }
            column(EntryNo_StockCapitalisation; "Entry No")
            {
            }
            column(ItemCostLCY_StockCapitalisation; "Item Cost (LCY)")
            {
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
}

