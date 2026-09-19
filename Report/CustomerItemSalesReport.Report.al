report 50327 "Customer-Item Sales Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/CustomerItemSalesReport.rdl';

    dataset
    {
        dataitem(DataItem7209; "Item Ledger Entry")
        {
            DataItemTableView = SORTING("Source Type", "Source No.", "Item No.", "Variant Code", "Posting Date")
                                WHERE("Entry Type" = CONST(Sale),
                                      "Serial No." = FILTER(<> ''),
                                      "Inventory Posting Group" = filter('N_CARS'),
                                      Quantity = FILTER(< 0));
            RequestFilterFields = "Source No.", "Item No.", "Global Dimension 1 Code", "Global Dimension 2 Code";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
           
            column(USERID; USERID)
            {
            }
            column(Item_Ledger_Entry__Source_No__; "Source No.")
            {
            }
            column(Item_Ledger_Entry__Posting_Date_; "Posting Date")
            {
            }
            column(Item_Ledger_Entry__Entry_Type_; "Entry Type")
            {
            }
            column(Item_Ledger_Entry__Entry_No__; "Entry No.")
            {
            }
            column(Item_Ledger_Entry__Item_No__; "Item No.")
            {
            }
            column(Item_Ledger_Entry__Document_No__; "Document No.")
            {
            }
            column(Item_Ledger_Entry_Description; Description)
            {
            }
            column(Item_Ledger_Entry_Quantity; Quantity)
            {
            }
            column(Item_Ledger_Entry__Serial_No__; "Serial No.")
            {
            }
            column(Item_Ledger_Entry__Engine_No__; "Engine No.")
            {
            }
            column(Item_Ledger_Entry__Exterior_Colour_Code_; "Exterior Colour Code")
            {
            }
            column(Item_Ledger_Entry__Key_No__; "Key No.")
            {
            }
            column(TotalFor___FIELDCAPTION__Item_No___; TotalFor + FIELDCAPTION("Item No."))
            {
            }
            column(Item_Ledger_Entry_Quantity_Control1000000053; Quantity)
            {
            }
            column(TotalFor___FIELDCAPTION__Source_No___; TotalFor + FIELDCAPTION("Source No."))
            {
            }
            column(Item_Ledger_Entry_Quantity_Control1000000055; Quantity)
            {
            }
            column(TotalFor___FIELDCAPTION__Source_Type__; TotalFor + FIELDCAPTION("Source Type"))
            {
            }
            column(Item_Ledger_Entry_Quantity_Control1000000057; Quantity)
            {
            }
            column(Item_Ledger_EntryCaption; Item_Ledger_EntryCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Item_Ledger_Entry__Source_No__Caption; FIELDCAPTION("Source No."))
            {
            }
            column(Item_Ledger_Entry__Posting_Date_Caption; FIELDCAPTION("Posting Date"))
            {
            }
            column(Item_Ledger_Entry__Entry_Type_Caption; FIELDCAPTION("Entry Type"))
            {
            }
            column(Item_Ledger_Entry__Entry_No__Caption; FIELDCAPTION("Entry No."))
            {
            }
            column(Item_Ledger_Entry__Item_No__Caption; FIELDCAPTION("Item No."))
            {
            }
            column(Item_Ledger_Entry__Document_No__Caption; FIELDCAPTION("Document No."))
            {
            }
            column(Item_Ledger_Entry_DescriptionCaption; FIELDCAPTION(Description))
            {
            }
            column(QtyCaption; QtyCaptionLbl)
            {
            }
            column(Item_Ledger_Entry__Serial_No__Caption; FIELDCAPTION("Serial No."))
            {
            }
            column(Item_Ledger_Entry__Engine_No__Caption; FIELDCAPTION("Engine No."))
            {
            }
            column(ColourCaption; ColourCaptionLbl)
            {
            }
            column(Item_Ledger_Entry__Key_No__Caption; FIELDCAPTION("Key No."))
            {
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Item No.");
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
        Item_Ledger_EntryCaptionLbl: Label 'Item Ledger Entry';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        QtyCaptionLbl: Label 'Qty';
        ColourCaptionLbl: Label 'Colour';
}

