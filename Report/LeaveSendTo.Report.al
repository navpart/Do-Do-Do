report 60005 "Leave Send To"
{
    DefaultLayout = RDLC;
    //RDLCLayout = './LeaveSendTo.rdlc';
    ProcessingOnly = true;

    dataset
    {
        dataitem(DataItem1; "Leave Request3")
        {
            RequestFilterFields = "Request No.";

            trigger OnAfterGetRecord()
            begin
                IF "Request No." = '' THEN
                    ERROR('You need a transaction no!');

                "1st Approval" := UserSetup."User ID";
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

