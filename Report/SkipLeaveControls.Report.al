report 60002 "Skip Leave Controls"
{
    DefaultLayout = RDLC;
    //RDLCLayout = './SkipLeaveControls.rdlc';
    ProcessingOnly = true;

    dataset
    {
        dataitem(DataItem1; "Leave Request3")
        {
            RequestFilterFields = "Request No.";

            trigger OnAfterGetRecord()
            begin
                IF "Request No." = '' THEN
                    ERROR('You must have a request no.!');

                IF VarSkip1 THEN
                    SKIP := TRUE
                ELSE
                    SKIP := FALSE;

                IF VarSkip2 THEN
                    SKIP2 := TRUE
                ELSE
                    SKIP2 := FALSE;

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
                field(VarSkip1; VarSkip1)
                {
                    ApplicationArea = All;
                    Caption = 'Skip';
                }
                field(VarSkip2; VarSkip2)
                {
                    ApplicationArea = All;
                    Caption = 'Skip2';
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
        VarSkip1: Boolean;
        VarSkip2: Boolean;
}

