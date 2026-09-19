page 70049 "Warranty Claim List Subform"
{
    ApplicationArea = All;
    PageType = ListPart;
    SourceTable = "Warranty Claim Detail";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Claim No."; Rec."Claim No.")
                {
                }
                field("Vehicle identification Number"; Rec."Vehicle identification Number")
                {
                }
                field("Line No."; Rec."Line No.")
                {
                }
                field("Dealer Code"; Rec."Dealer Code")
                {
                }
                field("Claim Date"; Rec."Claim Date")
                {
                }
                field("Claim Type"; Rec."Claim Type")
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
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
                field("Materia Claimed Before"; Rec."Materia Claimed Before")
                {
                }
                field("Variant Code"; Rec."Variant Code")
                {
                }
                field(Location; Rec.Location)
                {
                }
                field("Amount Refunded by TMC"; Rec."Amount Refunded by TMC")
                {
                }
                field("Department Code"; Rec."Department Code")
                {
                }
                field("Branch Code"; Rec."Branch Code")
                {
                }
                field("Shelf No."; Rec."Shelf No.")
                {
                }
                field(Model; Rec.Model)
                {
                }
            }
        }
    }

    actions
    {
    }
}

