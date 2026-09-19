report 50222 "Audit Trail Report TSP3001"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/AuditTrailReportTSP3001.rdl';

    dataset
    {
        dataitem(DataItem1; "Item Ledger Entry")
        {
            DataItemTableView = WHERE("Entry Type" = CONST(Purchase),
                                      "Inventory Posting Group" = CONST('N_PARTS'),
                                      "Source No." = FILTER('<>TVN1003'),
                                      "Location Code" = CONST('113LEK'));
            column(CostAmountActual_ItemLedgerEntry; "Cost Amount (Actual)")
            {
            }
            column(ItemNo_ItemLedgerEntry; "Item No.")
            {
            }
            column(PostingDate_ItemLedgerEntry; "Posting Date")
            {
            }
            column(EntryType_ItemLedgerEntry; "Entry Type")
            {
            }
            column(SourceNo_ItemLedgerEntry; "Source No.")
            {
            }
            column(VendorName_ItemLedgerEntry; "Vendor Name")
            {
            }
            column(DocumentNo_ItemLedgerEntry; "Document No.")
            {
            }
            column(Description_ItemLedgerEntry; Description)
            {
            }
            column(LocationCode_ItemLedgerEntry; "Location Code")
            {
            }
            column(Quantity_ItemLedgerEntry; Quantity)
            {
            }
            column(UnitCost; "Cost Amount (Actual)" / Quantity)
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

