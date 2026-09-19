report 50122 "Generate DOS List 4 New Stock"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/GenerateDOSList4NewStock.rdl';

    dataset
    {
        dataitem(DataItem1000000000; 27)
        {

            trigger OnAfterGetRecord()
            begin

                purRec.INIT;
                purRec.VALIDATE(purRec."Item No.", "No.");
                purRec."Line No" := LineNo;
                purRec.INSERT(TRUE);
                LineNo := LineNo + 10000;
            end;

            trigger OnPreDataItem()
            begin

                IF purRec2.FIND('+') THEN
                    LineNo := purRec2."Line No" + 10000
                ELSE
                    LineNo := 10000;
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
        purRec: Record 50028;
        purRec2: Record 50028;
        LineNo: Integer;
}

