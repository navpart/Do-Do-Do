report 50245 "Phys. Valuation Zeroing"
{
    DefaultLayout = RDLC;
    //RDLCLayout = './PhysValuationZeroing.rdlc';
    ProcessingOnly = true;

    dataset
    {
        dataitem(DataItem1000000000; "Item Journal Line")
        {

            trigger OnAfterGetRecord()
            begin
                ItemJnlLine.SETCURRENTKEY("Journal Template Name", "Journal Batch Name", "Line No.");
                ItemJnlLine.SETRANGE(ItemJnlLine."Journal Template Name", 'PHYS. INVE');
                ItemJnlLine.SETRANGE(ItemJnlLine."Journal Batch Name", "Journal Batch Name");
                IF ItemJnlLine.FINDFIRST THEN BEGIN
                    VALIDATE("Qty. (Phys. Inventory)", 0);
                    MODIFY;
                END;
            end;

            trigger OnPostDataItem()
            begin
                MESSAGE('Physical Inventory Quantities have been zeroed!');
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
        ItemJnlLine: Record 83;
}

