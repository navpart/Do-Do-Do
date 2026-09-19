report 50379 "Stock Value"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/StockValue.rdl';

    dataset
    {
        dataitem(DataItem8129; Item)
        {
            DataItemTableView = SORTING("Inventory Posting Group");
            RequestFilterFields = "Date Filter", "Inventory Posting Group", "Location Filter", "No.";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(USERID; USERID)
            {
            }
            column(Item__No__; "No.")
            {
            }
            column(Item_Description; Description)
            {
            }
            column(Item__Net_Change_; "Net Change")
            {
            }
            column(Item__Stockvalue__; "Stockvalue.")
            {
            }
            column(Item__Stockvalue___Control1000000000; "Stockvalue.")
            {
            }
            column(Item__Net_Change__Control1000000007; "Net Change")
            {
            }
            column(Stock_ValueCaption; Stock_ValueCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Item__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Item_DescriptionCaption; FIELDCAPTION(Description))
            {
            }
            column(QuantityCaption; QuantityCaptionLbl)
            {
            }
            column(Item__Stockvalue__Caption; FIELDCAPTION("Stockvalue."))
            {
            }
            column(InventoryPostingGroup_Item; "Inventory Posting Group")
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF "Net Change" = 0 THEN
                    CurrReport.SKIP;
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
        Stock_ValueCaptionLbl: Label 'Stock Value';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        QuantityCaptionLbl: Label 'Quantity';
}

