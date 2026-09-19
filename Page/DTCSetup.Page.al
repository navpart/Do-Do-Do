page 50361 "DTC Setup"
{
    PageType = List;
    SourceTable = "DTC";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("DT Code"; Rec."DT Code")
                {
                }
                field("DT Symptoms"; Rec."DT Symptoms")
                {
                }
                field("Freeze Frame Data Saved"; Rec."Freeze Frame Data Saved")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
    }

    actions
    {
    }
}

