report 50213 "Stock by Age List TSP2010"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/StockbyAgeListTSP2010.rdl';

    dataset
    {
        dataitem(DataItem1; Item)
        {
            DataItemTableView = WHERE("Net Change" = FILTER(> 0),
                                      "Last Purchase Date" = FILTER(<> ''));
            RequestFilterFields = "Inventory Posting Group", "Location Filter";
            column(LastPurchaseDate_Item; "Last Purchase Date")
            {
            }
            column(LastSalesDate_Item; "Last Sales Date")
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
            column(CalculateDate; CalDate)
            {
            }
            column(Age; TODAY - "Last Purchase Date")
            {
            }
            column(UnitCost_Item; "Unit Cost")
            {
            }
            column(ShelfNo_Item; "Shelf No.")
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

