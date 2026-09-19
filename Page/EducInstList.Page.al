page 50075 "Educ. Inst. List"
{
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Educational Institute";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Institute Code"; Rec."Institute Code")
                {
                }
                field("Institute Grp"; Rec."Institute Grp")
                {
                }
                field("Institute Name"; Rec."Institute Name")
                {
                }
                field("Institute Grp Name"; Rec."Institute Grp Name")
                {
                }
                field("Staffs In"; Rec."Staffs In")
                {
                }
            }
        }
    }

    actions
    {
    }
}

