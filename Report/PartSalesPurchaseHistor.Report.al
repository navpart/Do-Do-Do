report 50322 "Part Sales Purchase Histor"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/PartSalesPurchaseHistor.rdl';

    dataset
    {
        dataitem(DataItem1000000000; "Item Ledger Entry")
        {
            DataItemTableView = WHERE("Inventory Posting Group" = FILTER('N_PARTS | ACCESSORY'));
            RequestFilterFields = "Entry Type", "Location Code", "Posting Date", "Variant Code";
            column(ItemNo_ItemLedgerEntry; "Item No.")
            {
            }
            column(PostingDate_ItemLedgerEntry; "Posting Date")
            {
            }
            column(Description_ItemLedgerEntry; Description)
            {
            }
            column(Quantity_ItemLedgerEntry; Quantity)
            {
            }
            column(UnitofMeasureCode_ItemLedgerEntry; "Unit of Measure Code")
            {
            }
            column(ProductGroupCode_ItemLedgerEntry; "Prod. Gr.")
            {
            }
            column(CostAmountActual_ItemLedgerEntry; "Cost Amount (Actual)")
            {
            }
            column(PurchaseAmountActual_ItemLedgerEntry; "Purchase Amount (Actual)")
            {
            }
            column(ItemCategoryCode_ItemLedgerEntry; "Item Category Code")
            {
            }
            column(Nonstock_ItemLedgerEntry; Nonstock)
            {
            }
            column(EntryType_ItemLedgerEntry; "Entry Type")
            {
            }
            column(SalesAmountActual_ItemLedgerEntry; "Sales Amount (Actual)")
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

