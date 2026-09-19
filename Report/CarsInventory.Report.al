report 50321 "Cars-Inventory"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/CarsInventory.rdl';

    dataset
    {
        dataitem(DataItem8129; Item)
        {
            CalcFields = "Net Change", Inventory;
            RequestFilterFields = "No.", "Inventory Posting Group", "Location Filter", "Date Filter";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(Item_GETFILTER__Location_Filter__; GETFILTER("Location Filter"))
            {
            }
            column(Item_GETFILTER__Date_Filter__; GETFILTER("Date Filter"))
            {
            }
            column(Item__No__; "No.")
            {
            }
            column(Item_Description; Description)
            {
            }
            column(Item__Model_No__; "Model No.")
            {
            }
            column(Item__Model_Name_; "Model Name")
            {
            }
            column(Item__Stockvalue__; "Stockvalue.")
            {
            }
            column(Item__Net_Change_; "Net Change")
            {
            }
            column(Item__Net_Change__Control1000000008; "Net Change")
            {
            }
            column(Item__Stockvalue___Control1000000009; "Stockvalue.")
            {
            }
            column(ItemCaption; ItemCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(STOCK_POSITION_FOR_VEHICLESCaption; STOCK_POSITION_FOR_VEHICLESCaptionLbl)
            {
            }
            column(Item__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Item_DescriptionCaption; FIELDCAPTION(Description))
            {
            }
            column(Item__Model_No__Caption; FIELDCAPTION("Model No."))
            {
            }
            column(Item__Model_Name_Caption; FIELDCAPTION("Model Name"))
            {
            }
            column(Stock_ValueCaption; Stock_ValueCaptionLbl)
            {
            }
            column(InventoryCaption; InventoryCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(Item_Inventory_Posting_Group; "Inventory Posting Group")
            {
            }
            column(Item_Location_Filter; "Location Filter")
            {
            }
            column(Item_Date_Filter; "Date Filter")
            {
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("No.");
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
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        Showdet: Boolean;
        SRN: Integer;
        ItemCaptionLbl: Label 'Item';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        STOCK_POSITION_FOR_VEHICLESCaptionLbl: Label 'STOCK POSITION FOR VEHICLES';
        Stock_ValueCaptionLbl: Label 'Stock Value';
        InventoryCaptionLbl: Label 'Inventory';
        TotalCaptionLbl: Label 'Total';
}

