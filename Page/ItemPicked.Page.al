page 70525 "Item Picked"
{
    PageType = List;
    SourceTable = 337;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.")
                {
                    Editable = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    Editable = false;
                }
                field("Quantity (Base)"; Rec."Quantity (Base)")
                {
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    Editable = false;
                }
                field("Source Type"; Rec."Source Type")
                {
                    Editable = false;
                }
                field("Source Subtype"; Rec."Source Subtype")
                {
                    Editable = false;
                }
                field("Source ID"; Rec."Source ID")
                {
                    Editable = false;
                }
                field("Source Ref. No."; Rec."Source Ref. No.")
                {
                    Editable = false;
                }
                field("Item Ledger Entry No."; Rec."Item Ledger Entry No.")
                {
                    Editable = false;
                }
                field("Exterior Colour Code"; Rec."Exterior Colour Code")
                {
                    Editable = false;
                }
                field("Exterior Colour Name"; Rec."Exterior Colour Name")
                {
                    Editable = false;
                }
                field("Picked?"; Rec."Picked?")
                {
                }
                field("Picked By"; Rec."Picked By")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean
    begin
        ERROR('You cannot DELETE record!');
    end;
}

