report 50220 "Stock wi No Bin Locatn.TSP2007"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/StockwiNoBinLocatnTSP2007.rdl';

    dataset
    {
        dataitem(DataItem1; Item)
        {
            DataItemTableView = WHERE("Net Change" = FILTER(> 0),
                                      "Inventory Posting Group" = FILTER('N_PARTS'),
                                      "Shelf No." = FILTER(''));
            RequestFilterFields = "Inventory Posting Group";
            column(AbujaInventory_Item; "Abuja Inventory")
            {
            }
            column(No_Item; "No.")
            {
            }
            column(No2_Item; "No. 2")
            {
            }
            column(Description_Item; Description)
            {
            }
            column(SearchDescription_Item; "Search Description")
            {
            }
            column(NetChange_Item; "Net Change")
            {
            }
            column(StockvalueQQQ_Item; "Stockvalue.QQQ")
            {
            }
            column(Stockvalue_Item; "Stockvalue.")
            {
            }
            column(ModelNo_Item; "Model No.")
            {
            }
            column(ModelName_Item; "Model Name")
            {
            }
            column(UnitCost_Item; "Unit Cost")
            {
            }
            column(ShelfNo_Item; "Shelf No.")
            {
            }
            column(PortharcourtInventory_Item; "Portharcourt Inventory")
            {
            }
            column(DojoOregunInventory_Item; "Dojo Oregun  Inventory")
            {
            }
            column(IsoloInventory_Item; "Isolo Inventory")
            {
            }
            column(LekkiInventory_Item; "Lekki Inventory")
            {
            }

            trigger OnAfterGetRecord()
            begin
                CalDate := TODAY;
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

    var
        CalDate: Date;
}

