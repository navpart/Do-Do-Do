page 50612 "Chanage Management Subform"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Change Management Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                }
                field("Affected Object Type"; Rec."Affected Object Type")
                {
                }
                field("Object Code"; Rec."Object Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Change Type"; Rec."Change Type")
                {
                }
            }
        }
    }

    actions
    {
    }
}

