report 50223 "Branch Transfer recpt TSP2006"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/BranchTransferrecptTSP2006.rdl';

    dataset
    {
        dataitem(DataItem1; "Transfer Receipt Line")
        {
            RequestFilterFields = "Transfer-from Code", "Receipt Date", "Inventory Posting Group";
            column(ItemNo_TransferReceiptLine; "Item No.")
            {
            }
            column(Quantity_TransferReceiptLine; Quantity)
            {
            }
            column(UnitofMeasure_TransferReceiptLine; "Unit of Measure")
            {
            }
            column(Description_TransferReceiptLine; Description)
            {
            }
            column(TransferfromCode_TransferReceiptLine; "Transfer-from Code")
            {
            }
            column(UnitCost_TransferReceiptLine; "Unit Cost")
            {
            }
            column(DocumentNo_TransferReceiptLine; "Document No.")
            {
            }
            column(ReceiptDate_TransferReceiptLine; "Receipt Date")
            {
            }
            column(ShortcutDimension1Code_TransferReceiptLine; "Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_TransferReceiptLine; "Shortcut Dimension 2 Code")
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

