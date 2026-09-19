tableextension 50017 "Gen. Journal Template Ext" extends "Gen. Journal Template"
{
    fields
    {
        field(50151; "Empty Y/N"; Boolean)
        {
        }
        field(50152; Printed; Code[10])
        {
        }
        field(50153; Imported; Boolean)
        {
        }
        field(50154; "Created By"; Code[20])
        {
            Editable = false;
            TableRelation = "User Setup";
        }
        field(50155; "Creation Date"; Date)
        {
            Editable = false;
        }
    }
}
