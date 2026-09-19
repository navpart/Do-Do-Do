page 90053 "PeriodicAmount/MileageLineAPI"
{
    PageType = List;
    SourceTable = "Fault Setup Line";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec."Operation code")
                {
                }
                field("Line No."; Rec."Line No.")
                {
                }
                field(Type; Rec.Type)
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
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field("Total Price"; Rec."Total Price")
                {
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                }
                field("Price Incl VAT"; Rec."Price Incl VAT")
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Description"; Rec."Model Description")
                {
                }

            }
        }
    }

    actions
    {
    }
}

