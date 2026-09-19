report 60003 "Skip Opex/Capex Quotes"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/SkipOpexCapexQuotes.rdl';

    dataset
    {
        dataitem(ProcureData; "Procurement Header")
        {
            RequestFilterFields = "No.";
            column(No_ProcurementHeader; "No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF "No." = '' THEN
                    ERROR('Please choose a transaction!');

                IF VarSkip THEN
                    "Count skip" := TRUE
                ELSE
                    "Count skip" := FALSE;
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
                field(VarSkip; VarSkip)
                {
                    ApplicationArea = All;
                    Caption = 'Skip Quotes';
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
        VarSkip: Boolean;
}

