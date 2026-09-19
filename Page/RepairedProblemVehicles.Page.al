page 50458 "Repaired Problem Vehicles"
{
    PageType = Card;
    SourceTable = "VRI Table";
    SourceTableView = SORTING("VRI Code")
                      WHERE(Arrived = filter(true),
                            "Problem Vehicle" = filter(true),
                            Fixed = filter(true));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("VRI Code"; Rec."VRI Code")
                {
                    Editable = false;
                }
                field("VRI Location"; Rec."VRI Location")
                {
                    Editable = false;
                }
                field("VRI Date"; Rec."VRI Date")
                {
                    Editable = false;
                }
                field("Item No."; Rec."Item No.")
                {
                    Editable = false;
                }
                field("Model No."; Rec."Model No.")
                {
                    Editable = false;
                }
                field("Model Name"; Rec."Model Name")
                {
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                }
                field("Item Serial No."; Rec."Item Serial No.")
                {
                    Editable = false;
                }
                field("Engine No."; Rec."Engine No.")
                {
                    Editable = false;
                }
                field("Key No."; Rec."Key No.")
                {
                    Editable = false;
                }
                field("Problem Statement"; Rec."Problem Statement")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    var
        VRIRec: Record 50058;
}

