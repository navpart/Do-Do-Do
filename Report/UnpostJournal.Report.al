report 60000 "Unpost Journal"
{
    DefaultLayout = RDLC;
    //RDLCLayout = './UnpostJournal.rdlc';
    ProcessingOnly = true;

    dataset
    {
        dataitem(DataItem1; "Payment/Receipt.")
        {
            RequestFilterFields = "No.";

            trigger OnAfterGetRecord()
            begin
                IF "No." = '' THEN
                    ERROR('You must have a no.!');

                IF Posted THEN BEGIN
                    Posted := FALSE;
                    MODIFY;
                END;
            end;

            trigger OnPostDataItem()
            begin
                MESSAGE('Completed');
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
}

