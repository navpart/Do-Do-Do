report 60001 "Uncheck Posted COF"
{
    DefaultLayout = RDLC;
   // RDLCLayout = './UncheckPostedCOF.rdlc';
   ProcessingOnly = true;

    dataset
    {
        dataitem(DataItem1; "Customer Order HeaderX")
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

