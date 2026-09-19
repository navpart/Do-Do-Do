page 80010 "Estimate Subform"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Estimated Materia Requirement";
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
                field("Line no."; Rec."Line no.")
                {
                    Visible = false;
                }
                field("Additional Jobs"; Rec."Additional Jobs")
                {
                    Visible = false;
                }
                field("Line Type"; Rec."Line Type")
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Variant; Rec.Variant)
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
            }
        }
    }

    actions
    {
    }
}

