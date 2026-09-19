report 50276 "Transfer List"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/TransferList.rdl';

    dataset
    {
        dataitem(DataItem3226; "Transfer Receipt Line")
        {
            DataItemTableView = SORTING("Document No.", "Line No.")
                                WHERE("Inventory Posting Group" = FILTER('N_PARTS'));
            RequestFilterFields = "Transfer-from Code", "Transfer-to Code";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            
            column(USERID; USERID)
            {
            }
            column(Transfer_Shipment_Line__Document_No__; "Document No.")
            {
            }
            column(Transfer_Shipment_Line__Item_No__; "Item No.")
            {
            }
            column(Transfer_Shipment_Line_Description; Description)
            {
            }
            column(Transfer_Shipment_Line_Quantity; Quantity)
            {
            }
            column(Transfer_Shipment_Line__Transfer_from_Code_; "Transfer-from Code")
            {
            }
            column(Transfer_Shipment_Line__Transfer_to_Code_; "Transfer-to Code")
            {
            }
            column(CostAmount; CostAmount)
            {
            }
            column(UnitCost; UnitCost)
            {
            }
            column(Transfer_Shipment_Line_Quantity_Control1000000029; Quantity)
            {
            }
            column(TotalCost; TotalCost)
            {
            }
            column(Transfer_Shipment_LineCaption; Transfer_Shipment_LineCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Transfer_Shipment_Line__Document_No__Caption; FIELDCAPTION("Document No."))
            {
            }
            column(Transfer_Shipment_Line__Item_No__Caption; FIELDCAPTION("Item No."))
            {
            }
            column(Transfer_Shipment_Line_DescriptionCaption; FIELDCAPTION(Description))
            {
            }
            column(Transfer_Shipment_Line_QuantityCaption; FIELDCAPTION(Quantity))
            {
            }
            column(Transfer_Shipment_Line__Transfer_from_Code_Caption; FIELDCAPTION("Transfer-from Code"))
            {
            }
            column(Transfer_Shipment_Line__Transfer_to_Code_Caption; FIELDCAPTION("Transfer-to Code"))
            {
            }
            column(Cost_AmountCaption; Cost_AmountCaptionLbl)
            {
            }
            column(Unit_CostCaption; Unit_CostCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(Transfer_Shipment_Line_Line_No_; "Line No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF ItemRec.GET("Item No.") THEN
                    UnitCost := ItemRec."Unit Cost";
                CostAmount := ItemRec."Unit Cost" * Quantity;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Document No.");
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
        CostAmount: Decimal;
        UnitCost: Decimal;
        TotalCost: Decimal;
        Transfer_Shipment_LineCaptionLbl: Label 'Transfer Shipment Line';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Cost_AmountCaptionLbl: Label 'Cost Amount';
        Unit_CostCaptionLbl: Label 'Unit Cost';
        TotalCaptionLbl: Label 'Total';
}

