page 90054 "Periodic Amount/MileageAPI"
{
    PageType = List;
    SourceTable = "Fault Setup Header";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Operation Code"; Rec."Operation Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Estimate Incl. VAT"; Rec."Estimate Incl. VAT")
                {
                }
            }
        }
    }

    actions
    {
    }
}

