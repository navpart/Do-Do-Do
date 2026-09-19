page 50074 "Educational Inst Grp List"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Education Institute Grp";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Group Code"; Rec."Group Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
            }
        }
    }

    actions
    {
    }
}

