tableextension 50078 "Service Cost Ext" extends "Service Cost"
{
    fields
    {
        field(50000; Model; Text[30])
        {
        }
        field(50001; "Model Description"; Text[30])
        {
        }
        field(50002; "Job Type"; Code[10])
        {
        }
        field(50003; "Flat Rate"; Decimal)
        {
        }
        field(50004; "Dealer Hourly Rate"; Decimal)
        {

            trigger OnValidate()
            begin
                "Dealer Hourly Rate" := "Default Unit Price" * "Default Quantity";
            end;
        }
        field(50005; "Duration in Hrs"; Decimal)
        {
        }
        field(50006; Operations; Boolean)
        {
        }
        field(50007; "Dealer Factor"; Decimal)
        {
            Description = '% that determines what dealer hourly rate.  DHR := Dealer Factor * Flat Rate.   Flat Rate := Default. DHR will be in setup.';
        }
        field(50008; "Model Year"; Integer)
        {
        }
        field(50009; Type; Option)
        {
            OptionMembers = Labour,Sublet;
        }
    }
    
}
