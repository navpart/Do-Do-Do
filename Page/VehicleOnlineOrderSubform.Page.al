page 70517 "Vehicle Online Order Subform"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = 70050;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    Visible = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Item Description"; Rec."Item Description")
                {
                }
                field("Desired Colour"; Rec."Desired Colour")
                {
                    Caption = 'Colour';
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field("VAT  Amount"; Rec."VAT  Amount")
                {
                }
                field("Selected Colour"; Rec."Selected Colour")
                {
                    Visible = false;
                }
                field("Discount Amount"; Rec."Discount Amount")
                {
                    Visible = false;
                }
                field("Discount Amount Requested"; Rec."Discount Amount Requested")
                {
                    Visible = false;
                }
                field("Discount Amount Approved"; Rec."Discount Amount Approved")
                {
                    Visible = false;
                }
                field("Unit Discount Requested"; Rec."Unit Discount Requested")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

