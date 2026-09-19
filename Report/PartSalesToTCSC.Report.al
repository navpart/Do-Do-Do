report 50626 "Part Sales To TCSC"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/PartSalesToTCSC.rdl';

    dataset
    {
        dataitem(DataItem1000000000; "Item Ledger Entry")
        {
            DataItemTableView = WHERE("Entry Type" = FILTER(Sale),
                                      "Inventory Posting Group" = FILTER('N_PARTS'));
            RequestFilterFields = "Posting Date", "Source No.", "Location Code";
            column(ItemNo_ItemLedgerEntry; "Item No.")
            {
            }
            column(PostingDate_ItemLedgerEntry; "Posting Date")
            {
            }
            column(Description_ItemLedgerEntry; Description)
            {
            }
            column(DocumentNo_ItemLedgerEntry; "Document No.")
            {
            }
            column(LocationCode_ItemLedgerEntry; "Location Code")
            {
            }
            column(InvoicedQuantity_ItemLedgerEntry; "Invoiced Quantity")
            {
            }
            column(TNLSellingPricetoTCSC_ItemLedgerEntry; "TNL Selling Price to TCSC")
            {
            }
            column(CostAmount; "Cost Amount (Actual)")
            {
            }
            column(SourceNo_ItemLedgerEntry; "Source No.")
            {
            }
            column(CustomerName_ItemLedgerEntry; "Customer Name")
            {
            }
            dataitem(DataItem1000000006; Item)
            {
                DataItemLink = "No." = FIELD("Item No.");
                column(TNLSellingPricetoTCSC_Item; "TNL Selling Price to TCSC")
                {
                }
                column(UnitCost_Item; "Unit Cost")
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
}

