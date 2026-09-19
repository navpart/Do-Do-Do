page 50073 "Educational Institute"
{
    PageType = Card;
    SourceTable = "Educational Institute";
    SourceTableView = SORTING("Institute Grp", "Institute Code");
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Institute Grp"; Rec."Institute Grp")
                {
                }
                field("Institute Grp Name"; Rec."Institute Grp Name")
                {
                    Editable = false;
                }
                field("Institute Code"; Rec."Institute Code")
                {
                }
                field("Institute Name"; Rec."Institute Name")
                {
                }
                field("Staffs In"; Rec."Staffs In")
                {
                    Caption = 'Staff Count';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

