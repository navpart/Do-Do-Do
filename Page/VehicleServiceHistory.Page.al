page 80021 "Vehicle Service History"
{
    Editable = false;
    PageType = List;
    SourceTable = "Customer Order HeaderX";
    SourceTableView = SORTING("No.") ORDER(Descending);
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Reception Date"; Rec."Reception Date")
                {
                }
                field("Reception Time"; Rec."Reception Time")
                {
                }
                field(Maintenance; Rec.Maintenance)
                {
                }
                field("General Repair"; Rec."General Repair")
                {
                }
                field("Job Details"; Rec."Job Details")
                {
                }
                field("Odometer At Reception"; Rec."Odometer At Reception")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Links; Links)
            {
            }
        }
    }

    actions
    {
    }
}

