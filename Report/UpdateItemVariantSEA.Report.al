report 50120 "Update Item Variant- SEA"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/UpdateItemVariantSEA.rdl';

    dataset
    {
        dataitem(ItemData; Item)
        {
            DataItemTableView = SORTING("Inventory Posting Group", "Item Price Group");
            RequestFilterFields = "Inventory Posting Group";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(Item__Inventory_Posting_Group_; "Inventory Posting Group")
            {
            }
            column(Item__No__; "No.")
            {
            }
            column(Item_Description; Description)
            {
            }
            column(Item__Inventory_Posting_Group__Control1000000017; "Inventory Posting Group")
            {
            }
            column(ItemCaption; ItemCaptionLbl)
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
            column(Item__Inventory_Posting_Group__Control1000000017Caption; FIELDCAPTION("Inventory Posting Group"))
            {
            }
            column(Item__Inventory_Posting_Group_Caption; FIELDCAPTION("Inventory Posting Group"))
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF NOT itemvar.GET(ItemData."No.", 'SEA') THEN BEGIN
                    itemvar.INIT;
                    itemvar."Item No." := ItemData."No.";
                    itemvar.Code := 'SEA';
                    itemvar.Description := ItemData.Description;
                    itemvar.INSERT;
                END
                ELSE
                    CurrReport.SKIP;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Inventory Posting Group");
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
        itemvar: Record 5401;
        ItemCaptionLbl: Label 'Item';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}

