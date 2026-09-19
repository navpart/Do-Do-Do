page 50162 "Warrantee Claim Subform"
{
    ApplicationArea = All;
    AutoSplitKey = true;
    DelayedInsert = true;
    InsertAllowed = true;
    PageType = ListPart;
    SourceTable = "Warranty Claim Detail";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Claim Type"; Rec."Claim Type")
                {
                }
                field("Claim No."; Rec."Claim No.")
                {
                    Visible = false;
                }
                field("Vehicle identification Number"; Rec."Vehicle identification Number")
                {
                    Visible = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                }
                field(Model; Rec.Model)
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Shelf No."; Rec."Shelf No.")
                {
                }
                field("Department Code"; Rec."Department Code")
                {
                }
                field("Branch Code"; Rec."Branch Code")
                {
                }
                field("Dealer Code"; Rec."Dealer Code")
                {
                    Visible = false;
                }
                field("Claim Date"; Rec."Claim Date")
                {
                    Visible = false;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                }
                field(Location; Rec.Location)
                {
                }
                field("Materia Claimed Before"; Rec."Materia Claimed Before")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("TNL Approved"; Rec."TNL Approved")
                {
                }
                field("Issue to Dealer"; Rec."Issue to Dealer")
                {
                }
                field("TNL Approved Date"; Rec."TNL Approved Date")
                {
                }
                field("Issue to Dealer Date"; Rec."Issue to Dealer Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

