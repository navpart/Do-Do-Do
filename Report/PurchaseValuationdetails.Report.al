report 50344 "Purchase & Valuation details"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/PurchaseValuationdetails.rdl';

    dataset
    {
        dataitem(DataItem7209; "Item Ledger Entry")
        {
            DataItemTableView = SORTING("Item No.");
            RequestFilterFields = "Item No.", "Posting Date", "Inventory Posting Group", "Entry Type";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(Item_Ledger_Entry__Item_No__; "Item No.")
            {
            }
            column(Item_Ledger_Entry__Item_No___Control1000000011; "Item No.")
            {
            }
            column(Item_Ledger_Entry__Posting_Date_; "Posting Date")
            {
            }
            column(Item_Ledger_Entry__Entry_Type_; "Entry Type")
            {
            }
            column(Item_Ledger_Entry_Description; Description)
            {
            }
            column(Item_Ledger_Entry__External_Document_No__; "External Document No.")
            {
            }
            column(Item_Ledger_Entry__Cost_Amount__Actual__; "Cost Amount (Actual)")
            {
            }
            column(Item_Ledger_Entry__Serial_No__; "Serial No.")
            {
            }
            column(Item_Ledger_Entry__Engine_No__; "Engine No.")
            {
            }
            column(Item_Ledger_Entry__Entry_No__; "Entry No.")
            {
            }
            column(TotalFor___FIELDCAPTION__Item_No___; TotalFor + FIELDCAPTION("Item No."))
            {
            }
            column(Item_Ledger_Entry__Cost_Amount__Actual___Control1000000038; "Cost Amount (Actual)")
            {
            }
            column(Item_Ledger_EntryCaption; Item_Ledger_EntryCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Item_Ledger_Entry__Item_No___Control1000000011Caption; FIELDCAPTION("Item No."))
            {
            }
            column(Item_Ledger_Entry__Posting_Date_Caption; FIELDCAPTION("Posting Date"))
            {
            }
            column(Item_Ledger_Entry__Entry_Type_Caption; FIELDCAPTION("Entry Type"))
            {
            }
            column(Item_Ledger_Entry_DescriptionCaption; FIELDCAPTION(Description))
            {
            }
            column(Item_Ledger_Entry__External_Document_No__Caption; FIELDCAPTION("External Document No."))
            {
            }
            column(Item_Ledger_Entry__Cost_Amount__Actual__Caption; FIELDCAPTION("Cost Amount (Actual)"))
            {
            }
            column(Item_Ledger_Entry__Serial_No__Caption; FIELDCAPTION("Serial No."))
            {
            }
            column(Item_Ledger_Entry__Engine_No__Caption; FIELDCAPTION("Engine No."))
            {
            }
            column(Item_Ledger_Entry__Entry_No__Caption; FIELDCAPTION("Entry No."))
            {
            }
            column(Item_Ledger_Entry__Item_No__Caption; FIELDCAPTION("Item No."))
            {
            }
            dataitem(DataItem8894; "Value Entry")
            {
                DataItemLink = "Item Ledger Entry No." = FIELD("Entry No.");
                DataItemTableView = SORTING("Item Ledger Entry No.", "Entry Type");
                column(Value_Entry__Posting_Date_; "Posting Date")
                {
                }
                column(Value_Entry__Item_Charge_No__; "Item Charge No.")
                {
                }
                column(Value_Entry__Document_No__; "Document No.")
                {
                }
                column(Value_Entry_Description; Description)
                {
                }
                column(Value_Entry__Cost_Amount__Actual__; "Cost Amount (Actual)")
                {
                }
                column(Value_Entry__Item_Ledger_Entry_No__; "Item Ledger Entry No.")
                {
                }
                column(Value_Entry__Cost_Amount__Actual___Control1000000040; "Cost Amount (Actual)")
                {
                }
                column(Value_Entry_Entry_No_; "Entry No.")
                {
                }
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
}

