report 50500 "Part Invt. Valu. Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/PartInvtValuReport.rdl';

    dataset
    {
        dataitem(DataItem100000000; Item)
        {
            RequestFilterFields = "No.", "Inventory Posting Group", "Location Filter", "Date Filter";
            column(No_Item; "No.")
            {
            }
            column(Description_Item; Description)
            {
            }
            column(Inventory_Item; Inventory)
            {
            }
            column(ItemCategoryCode_Item; "Item Category Code")
            {
            }
            column(UnitCost_Item; "Unit Cost")
            {
            }
            column(StockValuePostedtoGL_Item; "Stock Value Posted to G/L")
            {
            }
            column(UnitPrice_Item; "Unit Price")
            {
            }
            column(InventoryPostingGroup_Item; "Inventory Posting Group")
            {
            }
            column(LastPurchaseDate_Item; "Last Purchase Date")
            {
            }
            column(LastDateSold_Item; "Last Date Sold")
            {
            }
            column(ModelNo_Item; "Model No.")
            {
            }
            column(ModelName_Item; "Model Name")
            {
            }
            column(ShelfNo_Item; "Shelf No.")
            {
            }
            column(LocationFilter_Item; "Location Filter")
            {
            }
            column(AbujaInventory_Item; "Abuja Inventory")
            {
            }
            column(PortharcourtInventory_Item; "Portharcourt Inventory")
            {
            }
            column(DojoInventory_Item; "Dojo Inventory")
            {
            }
            column(DojoOregunInventory_Item; "Dojo Oregun  Inventory")
            {
            }
            column(IsoloInventory_Item; "Isolo Inventory")
            {
            }
            column(ProductCode_Item; "Product Code")
            {
            }
            column(ItemNoCategory_Item; "Item No Category")
            {
            }
            column(SubstitutesExist_Item; "Substitutes Exist")
            {
            }
            column(SubItem_Item; "Sub Item")
            {
            }
            column(SubName_Item; "Sub Name")
            {
            }
            column(LastSalesDate_Item; "Last Sales Date")
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

    var
        ItemSubstitution: Record 5715;
}

