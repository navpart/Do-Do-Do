report 60007 "Undeliver Customer Order"
{
    DefaultLayout = RDLC;
    //RDLCLayout = './UndeliverCustomerOrder.rdlc';
    ProcessingOnly = true;

    dataset
    {
        dataitem(DataItem1; "Customer Order Table.")
        {
            RequestFilterFields = "Customer Order Form No.";

            trigger OnAfterGetRecord()
            begin
                IF "Customer Order Form No." = '' THEN
                    ERROR('You must have a no.!');

                IF Delivered THEN BEGIN
                    Delivered := FALSE;
                    MODIFY;
                END;
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

