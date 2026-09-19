report 50219 "Branch Trans Dispatch TSP2005"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/BranchTransDispatchTSP2005.rdl';

    dataset
    {
        dataitem(DataItem8; "Transfer Shipment Line")
        {
            DataItemTableView = WHERE("Transfer-from Code" = FILTER('113LEK'),
                                      "Inventory Posting Group" = FILTER('N_PARTS'));
            RequestFilterFields = "Transfer-to Code", "Inventory Posting Group", "Shipment Date";
            column(TransfertoCode_TransferShipmentLine; "Transfer-to Code")
            {
            }
            column(ShipmentDate_TransferShipmentLine; "Shipment Date")
            {
            }
            column(DocumentNo_TransferShipmentLine; "Document No.")
            {
            }
            column(ItemNo_TransferShipmentLine; "Item No.")
            {
            }
            column(Quantity_TransferShipmentLine; Quantity)
            {
            }
            column(Description_TransferShipmentLine; Description)
            {
            }
            column(UnitCost_TransferShipmentLine; "Unit Cost")
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

