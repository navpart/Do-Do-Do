report 50395 "Price Test"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/PriceTest.rdl';

    dataset
    {
        dataitem(DataItem1000000000; Item)
        {
            RequestFilterFields = "Inventory Posting Group", "Item Price Group";
            column(No_Item; "No.")
            {
            }
            column(Description_Item; Description)
            {
            }
            column(UnitPrice_Item; "Unit Price")
            {
            }

            trigger OnAfterGetRecord()
            begin
                ItemRec.GET("No.");
                ItemRec.VALIDATE("Last Direct Cost");
                ItemRec.VALIDATE("Price/Profit Calculation");
                ItemRec.MODIFY;
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
        ItemRec: Record 27;
}

