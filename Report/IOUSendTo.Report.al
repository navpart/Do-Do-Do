report 60006 "IOU Send To"
{
    DefaultLayout = RDLC;
    //RDLCLayout = './IOUSendTo.rdlc';
    ProcessingOnly = true;

    dataset
    {
        dataitem(DataItem1; "IOU Register")
        {
            RequestFilterFields = "IOU No.";

            trigger OnAfterGetRecord()
            begin
                IF "IOU No." = '' THEN
                    ERROR('You need a transaction no!');

                "1st Approval to" := UserSetup."User ID";
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
                    ApplicationArea = All;
                    Caption = 'Send To';
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

