report 60004 "Opex/Capex Send To"
{
    DefaultLayout = RDLC;
    //RDLCLayout = './OpexCapexSendTo.rdlc';
    ProcessingOnly = true;

    dataset
    {
        dataitem(DataItem1; "Procurement Header")
        {
            RequestFilterFields = "No.";

            trigger OnAfterGetRecord()
            begin
                IF "No." = '' THEN
                    ERROR('You need a transaction no!');

                "Send To" := UserSetup."User ID";
                MODIFY;
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
            area(content)
            {
                field(UserSetup; UserSetup."User ID")
                {
                    Caption = 'Send To';
                    ApplicationArea = All;
                    TableRelation = "User Setup"."User ID";
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        UserSetup: Record 91;
}

