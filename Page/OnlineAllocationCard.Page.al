page 70519 "Online Allocation Card"
{
    PageType = Card;
    SourceTable = 70059;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Discount Amount"; Rec."Discount Amount")
                {
                }
                field("After Discount Price"; Rec."After Discount Price")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field("Allocated Quantity"; Rec."Allocated Quantity")
                {
                }
                field("Requested Quantity"; Rec."Requested Quantity")
                {
                }
                field("Remaining Quantity"; RemainingQty)
                {
                }
            }
            part(Lines; 70520)
            {
                SubPageLink = "Customer No." = FIELD("Customer No."),
                              "Item No." = FIELD("Item No.");
            }
        }
        area(factboxes)
        {
            systempart(Notes; Notes)
            {
            }
            systempart(Links; Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        RemainingQty := 0;
        Rec.CALCFIELDS("Requested Quantity");
        RemainingQty := Rec."Allocated Quantity" - Rec."Requested Quantity";
    end;

    var
        RemainingQty: Decimal;
}

