page 50459 "ISPV Folder"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Logistics Order";

    layout
    {
        area(content)
        {
            field("ISPV to VRI"; Rec."ISPV to VRI")
            {
                Caption = 'ISPV to VRI';
                DrillDownPageID = "Logistics List 1";
                LookupPageID = "Logistics List 1";
                Style = Standard;
                StyleExpr = TRUE;
            }
            field("Awaiting Estimate"; Rec."Awaiting Estimate")
            {
                Caption = 'Awaiting Estimate';
                DrillDownPageID = "Logistics List 2";
                LookupPageID = "Logistics List 2";
                Style = Standard;
                StyleExpr = TRUE;
            }
            field("Awaiting O/L Apprv."; Rec."Awaiting O/L Apprv.")
            {
                Caption = 'Awaiting O/L Apprv.';
                DrillDownPageID = "Logistics List 3";
                LookupPageID = "Logistics List 3";
                Style = Standard;
                StyleExpr = TRUE;
            }
            field("Under Repair"; Rec."Under Repair")
            {
                Caption = 'Under Repair';
                DrillDownPageID = "Logistics List 4";
                LookupPageID = "Logistics List 4";
                Style = Standard;
                StyleExpr = TRUE;
            }
            field("Completed Repair"; Rec."Completed Repair")
            {
                Caption = 'Completed Repair';
                DrillDownPageID = "Logistics List 5";
                LookupPageID = "Logistics List 5";
                Style = Standard;
                StyleExpr = TRUE;
            }
            field("All ISPV"; Rec."All ISPV")
            {
                DrillDownPageID = "Logistics List 6";
                LookupPageID = "Logistics List 6";
                Style = Standard;
                StyleExpr = TRUE;
            }
        }
    }

    actions
    {
    }
}

