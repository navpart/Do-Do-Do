report 50255 "Fuel Voucher New"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/FuelVoucherNew.rdl';

    dataset
    {
        dataitem(DataItem9635; "Fuel Vouchers.")
        {
            DataItemTableView = SORTING("Voucher No.");
            RequestFilterFields = "Voucher No.";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(USERID; USERID)
            {
            }
            column(Fuel_Vouchers___Voucher_No__; "Voucher No.")
            {
            }
            column(Fuel_Vouchers__Description; Description)
            {
            }
            column(Fuel_Vouchers___Transaction_Date_; "Transaction Date")
            {
            }
            column(Fuel_Vouchers___Item_No__; "Item No.")
            {
            }
            column(Fuel_Vouchers__Location; Location)
            {
            }
            column(Fuel_Vouchers___Asset_Code_; "Asset Code")
            {
            }
            column(Fuel_Vouchers___Fuel_Code_; "Fuel Code")
            {
            }
            column(Item_Description; Item.Description)
            {
            }
            column(FA_Description; FA.Description)
            {
            }
            column(Fuel_Vouchers___Shortcut_Dimension_1_Code_; "Shortcut Dimension 1 Code")
            {
            }
            column(Fuel_Vouchers___Shortcut_Dimension_2_Code_; "Shortcut Dimension 2 Code")
            {
            }
            column(Fuel_Vouchers___Qty_Issued_; "Qty Issued")
            {
            }
            column(Fuel_VoucherCaption; Fuel_VoucherCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Fuel_Vouchers___Voucher_No__Caption; FIELDCAPTION("Voucher No."))
            {
            }
            column(Fuel_Vouchers__DescriptionCaption; FIELDCAPTION(Description))
            {
            }
            column(Fuel_Vouchers___Transaction_Date_Caption; FIELDCAPTION("Transaction Date"))
            {
            }
            column(Fuel_Vouchers___Item_No__Caption; FIELDCAPTION("Item No."))
            {
            }
            column(Fuel_Vouchers__LocationCaption; FIELDCAPTION(Location))
            {
            }
            column(Fuel_Vouchers___Asset_Code_Caption; FIELDCAPTION("Asset Code"))
            {
            }
            column(Fuel_Vouchers___Fuel_Code_Caption; FIELDCAPTION("Fuel Code"))
            {
            }
            column(Item_DescriptionCaption; Item_DescriptionCaptionLbl)
            {
            }
            column(FA_DescriptionCaption; FA_DescriptionCaptionLbl)
            {
            }
            column(Fuel_Vouchers___Shortcut_Dimension_1_Code_Caption; FIELDCAPTION("Shortcut Dimension 1 Code"))
            {
            }
            column(Fuel_Vouchers___Shortcut_Dimension_2_Code_Caption; FIELDCAPTION("Shortcut Dimension 2 Code"))
            {
            }
            column(Fuel_Vouchers___Qty_Issued_Caption; FIELDCAPTION("Qty Issued"))
            {
            }
            column(SIGN______________________________________________DATE_______________________Caption; SIGN______________________________________________DATE_______________________CaptionLbl)
            {
            }
            column(SIGN______________________________________________DATE_______________________Caption_Control1000000013; SIGN______________________________________________DATE_______________________Caption_Control1000000013Lbl)
            {
            }
            column(FUEL_RECEIVED_BY______________________________________________________Caption; FUEL_RECEIVED_BY______________________________________________________CaptionLbl)
            {
            }
            column(ISSUE_APPROVED_BY______________________________________________________Caption; ISSUE_APPROVED_BY______________________________________________________CaptionLbl)
            {
            }
            column(SIGN______________________________________________DATE_______________________Caption_Control1000000025; SIGN______________________________________________DATE_______________________Caption_Control1000000025Lbl)
            {
            }
            column(FUEL_ISSUED_BY___________________________________________________________________________Caption; FUEL_ISSUED_BY___________________________________________________________________________CaptionLbl)
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
        Item: Record 27;
        FA: Record 5600;
        Fuel_VoucherCaptionLbl: Label 'Fuel Voucher';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Item_DescriptionCaptionLbl: Label 'Item Description';
        FA_DescriptionCaptionLbl: Label 'Asset Description';
        SIGN______________________________________________DATE_______________________CaptionLbl: Label 'SIGN............................................. DATE.......................';
        SIGN______________________________________________DATE_______________________Caption_Control1000000013Lbl: Label 'SIGN............................................. DATE.......................';
        FUEL_RECEIVED_BY______________________________________________________CaptionLbl: Label 'FUEL RECEIVED BY .....................................................';
        ISSUE_APPROVED_BY______________________________________________________CaptionLbl: Label 'ISSUE APPROVED BY .....................................................';
        SIGN______________________________________________DATE_______________________Caption_Control1000000025Lbl: Label 'SIGN............................................. DATE.......................';
        FUEL_ISSUED_BY___________________________________________________________________________CaptionLbl: Label 'FUEL ISSUED BY:..........................................................................';
}

