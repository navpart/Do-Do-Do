tableextension 50040 "Column Layout Name Ext" extends "Column Layout Name"
{
    fields
    {
        field(50000; "Begin Period Filter"; Date)
        {

        }
        field(50001; "Period Type"; Option)
        {
            OptionCaption = 'Day,Week,Month,Quater,Year,Accounting Period';
            OptionMembers = Day,Week,Month,Quater,Year,"Accounting Period";
        }
    }
}
