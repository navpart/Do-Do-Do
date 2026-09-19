page 50175 "Poss Data List"
{
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Poss Data";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(List; Rec.List)
                {
                }
                field("Order Type - A"; Rec."Order Type - A")
                {
                }
                field("Distribution Code"; Rec."Distribution Code")
                {
                }
                field("Order No"; Rec."Order No")
                {
                }
                field(Portion; Rec.Portion)
                {
                }
                field("Item No"; Rec."Item No")
                {
                }
                field(Partial; Rec.Partial)
                {
                }
                field("Package Type"; Rec."Package Type")
                {
                }
                field("Trans Code"; Rec."Trans Code")
                {
                }
                field("Order Type - B"; Rec."Order Type - B")
                {
                }
                field(Urgent; Rec.Urgent)
                {
                }
                field("Order Type - C"; Rec."Order Type - C")
                {
                }
                field("B/O"; Rec."B/O")
                {
                }
                field(Currency; Rec.Currency)
                {
                }
                field("Process Type"; Rec."Process Type")
                {
                }
                field("Rejection Code"; Rec."Rejection Code")
                {
                }
                field("Alteration Code"; Rec."Alteration Code")
                {
                }
                field("Part No. Supplied"; Rec."Part No. Supplied")
                {
                    Caption = 'Supply Part No.';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Part Name';
                }
                field("Part No. Ordered"; Rec."Part No. Ordered")
                {
                }
                field(Tarriff; Rec.Tarriff)
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
                field("Inventory CD"; Rec."Inventory CD")
                {
                }
                field(TKB; Rec.TKB)
                {
                }
                field(Inspection; Rec.Inspection)
                {
                }
                field(EL; Rec.EL)
                {
                }
                field("Tra Date"; Rec."Tra Date")
                {
                    Caption = 'Process Date';
                }
                field("Process Q'ty"; Rec."Process Q'ty")
                {
                    Caption = 'Processed Qty';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field("Q'ty Ordered"; Rec."Q'ty Ordered")
                {
                    Caption = 'Ordered Qty';
                }
                field("Processed Amount"; Rec."Processed Amount")
                {
                }
                field("Part By supplied Q'ty"; Rec."Part By supplied Q'ty")
                {
                }
                field("Part By Ordered Q'ty"; Rec."Part By Ordered Q'ty")
                {
                }
                field("R/A Action"; Rec."R/A Action")
                {
                }
                field("Balance Ordered Q'ty"; Rec."Balance Ordered Q'ty")
                {
                }
                field("Initial Order Qty"; Rec."Initial Order Qty")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Delete Duplicated Entry")
            {
                Caption = 'Delete Duplicated Entry';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.deletedup;
                end;
            }
            action("Carry Out R/A Action ")
            {
                Caption = 'Carry Out R/A Action ';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.SubRec;
                end;
            }
        }
    }
}

