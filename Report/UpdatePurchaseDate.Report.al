report 50364 "Update Purchase Date"
{
    ApplicationArea = All;
    DefaultLayout = RDLC;
    //RDLCLayout = './UpdatePurchaseDate.rdlc';
    ProcessingOnly = true;
    UsageCategory = Lists;
    Permissions = tabledata "Item Ledger Entry" = rimd;

    dataset
    {
        dataitem(DataItem7209; "Item Ledger Entry")
        {
            DataItemTableView = SORTING("Entry No.");
            RequestFilterFields = "Posting Date", "Serial No.";
            column(Item_Ledger_Entry__Posting_Date_; "Posting Date")
            {
            }
            column(Item_Ledger_Entry__Serial_No__; "Serial No.")
            {
            }
            column(Item_Ledger_Entry__Purchase_Date_; "Purchase Date")
            {
            }
            column(Item_Ledger_Entry_Entry_No_; "Entry No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                ItemLedgEntry.SETRANGE("Serial No.", "Serial No.");
                IF ItemLedgEntry.FINDFIRST THEN BEGIN
                    "Purchase Date" := ItemLedgEntry."Posting Date";
                    "Exterior Colour Name" := ItemLedgEntry."Exterior Colour Name";
                    "Exterior Colour Code" := ItemLedgEntry."Exterior Colour Code";
                    "Engine No." := ItemLedgEntry."Engine No.";
                    "Key No." := ItemLedgEntry."Key No.";
                    MODIFY;
                END;
            end;

            trigger OnPostDataItem()
            begin
                MESSAGE('Update completed!');
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Entry No.");
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
        ItemLedgEntry: Record 32;
}

