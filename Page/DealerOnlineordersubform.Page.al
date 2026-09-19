page 50157 "Dealer Online order subform"
{
    PageType = ListPart;
    SourceTable = "Warranty Claim Header";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(control3)
            {
                field("Dealer Name";Rec."Dealer Name")
                {
                }
                field("Process Date";Rec."Process Date")
                {
                }
                field("Vehicle Identification No.";Rec."Vehicle Identification No.")
                {
                }
                field("Vehicle Engine No.";Rec."Vehicle Engine No.")
                {
                }
                field("Vehicle Model";Rec."Vehicle Model")
                {
                }
                field("Model Year";Rec."Model Year")
                {
                }
            }
        }
    }

    actions
    {
    }
}

