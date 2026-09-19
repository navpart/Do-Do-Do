report 50026 "MVO Stock Per Model Code"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/MVOStockPerModelCode.rdl';

    dataset
    {
        dataitem(DataItem5605; "Stockkeeping Unit")
        {
            DataItemTableView = SORTING("Item No.", "Location Code", "Variant Code");
            RequestFilterFields = "Item No.", "Variant Code", "Engine Number", "Chassis Number", Purchaser, Customer, "Date Filter", "Global Dimension 1 Filter";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(Stockkeeping_Unit__Item_No__; "Item No.")
            {
            }
            column(Stockkeeping_Unit_Description; Description)
            {
            }
            column(Stockkeeping_Unit_Inventory; Inventory)
            {
            }
            column(Stockkeeping_Unit__Chassis_Number_; "Chassis Number")
            {
            }
            column(Stockkeeping_Unit__Engine_Number_; "Engine Number")
            {
            }
            column(ColourDesc; ColourDesc)
            {
            }
            column(UCost; UCost)
            {
            }
            column(Stockkeeping_Unit_Inventory_Control1000000009; Inventory)
            {
            }
            column(Stockkeeping_Unit__Chassis_Number__Control1000000010; "Chassis Number")
            {
            }
            column(Stockkeeping_Unit__Engine_Number__Control1000000013; "Engine Number")
            {
            }
            column(ColourDesc_Control1000000016; ColourDesc)
            {
            }
            column(UCost_Control1000000019; UCost)
            {
            }
            column(Stockkeeping_Unit_Inventory_Control1000000029; Inventory)
            {
            }
            column(TCost; TCost)
            {
            }
            column(AvgCost; AvgCost)
            {
            }
            column(Stockkeeping_Unit_Inventory_Control1000000032; Inventory)
            {
            }
            column(TCost_Control1000000033; TCost)
            {
            }
            column(Inventory_Position_ReportCaption; Inventory_Position_ReportCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Stockkeeping_Unit__Item_No__Caption; FIELDCAPTION("Item No."))
            {
            }
            column(UnitsCaption; UnitsCaptionLbl)
            {
            }
            column(Stockkeeping_Unit__Chassis_Number_Caption; FIELDCAPTION("Chassis Number"))
            {
            }
            column(Stockkeeping_Unit__Engine_Number_Caption; FIELDCAPTION("Engine Number"))
            {
            }
            column(ColourDescCaption; ColourDescCaptionLbl)
            {
            }
            column(Unit_CostCaption; Unit_CostCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Average_CostCaption; Average_CostCaptionLbl)
            {
            }
            column(Stockkeeping_Unit_Location_Code; "Location Code")
            {
            }
            column(Stockkeeping_Unit_Variant_Code; "Variant Code")
            {
            }

            trigger OnAfterGetRecord()
            begin
                ColourDesc := ColourRec.GetColour("Product Group Code", Colour);
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Item No.");

                //CurrReport.CREATETOTALS(UCost, TCost);
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
        ColourDesc: Text[30];
        ItemRec: Record 27;
        ShowZeroInventory: Boolean;
        ColourRec: Record 50067;
        UCost: Decimal;
        AvgCost: Decimal;
        TCost: Decimal;
        Inventory_Position_ReportCaptionLbl: Label 'Inventory Position Report';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        UnitsCaptionLbl: Label 'Units';
        ColourDescCaptionLbl: Label 'Colour';
        Unit_CostCaptionLbl: Label 'Unit Cost';
        DescriptionCaptionLbl: Label 'Description';
        Average_CostCaptionLbl: Label 'Average Cost';
}

