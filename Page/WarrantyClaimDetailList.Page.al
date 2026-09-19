page 50164 "Warranty Claim Detail List"
{
    ApplicationArea = All;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
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
                field("Variant Code"; Rec."Variant Code")
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

    trigger OnInit()
    begin
        CurrPage.LOOKUPMODE := TRUE;
    end;
}

