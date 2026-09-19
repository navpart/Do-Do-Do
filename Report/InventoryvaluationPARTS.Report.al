report 50306 "Inventory valuation PARTS"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/InventoryvaluationPARTS.rdl';

    dataset
    {
        dataitem(DataItem8894; "Value Entry")
        {
            DataItemTableView = SORTING("Item No.", "Item Ledger Entry Type");
            RequestFilterFields = "Item No.", "Inventory Posting Group", "Posting Date", "Location Code";
            RequestFilterHeading = 'Inventory Valuation';
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(USERID; USERID)
            {
            }
            column(Value_Entry__Entry_No__; "Entry No.")
            {
            }
            column(Value_Entry__Posting_Date_; "Posting Date")
            {
            }
            column(Value_Entry__Item_No__; "Item No.")
            {
            }
            column(Value_Entry__Document_No__; "Document No.")
            {
            }
            column(Value_Entry_Description; Description)
            {
            }
            column(Value_Entry__Invoiced_Quantity_; "Invoiced Quantity")
            {
            }
            column(Value_Entry__Cost_Amount__Actual__; "Cost Amount (Actual)")
            {
            }
            column(Value_Entry__Cost_Posted_to_G_L_; "Cost Posted to G/L")
            {
            }
            column(Value_Entry__Invoiced_Quantity__Control1000000057; "Invoiced Quantity")
            {
            }
            column(Value_Entry__Cost_Amount__Actual___Control1000000059; "Cost Amount (Actual)")
            {
            }
            column(Value_Entry__Cost_Posted_to_G_L__Control1000000060; "Cost Posted to G/L")
            {
            }
            column(Value_Entry__Item_No___Control1000000000; "Item No.")
            {
            }
            column(Value_Entry_Description_Control1000000012; Description)
            {
            }
            column(Value_Entry__Invoiced_Quantity__Control1000000010; "Invoiced Quantity")
            {
            }
            column(Value_Entry__Cost_Amount__Actual___Control1000000016; "Cost Amount (Actual)")
            {
            }
            column(Value_Entry__Cost_Posted_to_G_L__Control1000000019; "Cost Posted to G/L")
            {
            }
            column(INVENTORY_VALUATION_REPORTCaption; INVENTORY_VALUATION_REPORTCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Item_No_Caption; Item_No_CaptionLbl)
            {
            }
            column(Value_Entry_DescriptionCaption; FIELDCAPTION(Description))
            {
            }
            column(QuantityCaption; QuantityCaptionLbl)
            {
            }
            column(Value_Entry__Cost_Amount__Actual__Caption; FIELDCAPTION("Cost Amount (Actual)"))
            {
            }
            column(Value_Entry__Cost_Posted_to_G_L_Caption; FIELDCAPTION("Cost Posted to G/L"))
            {
            }
            column(Value_Entry_Item_Ledger_Entry_Type; "Item Ledger Entry Type")
            {
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Item Ledger Entry Type");
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
        TotalFor: Label 'Total for ';
        ItemRec: Record 27;
        INVENTORY_VALUATION_REPORTCaptionLbl: Label 'INVENTORY VALUATION REPORT';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Item_No_CaptionLbl: Label 'Item No.';
        QuantityCaptionLbl: Label 'Quantity';
}

