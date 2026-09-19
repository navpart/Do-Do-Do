page 50155 "Japan Order Update"
{
    PageType = List;
    SourceTable = "Japan Order Update";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(TMCINV; Rec.TMCINV)
                {
                }
                field("Case No"; Rec."Case No")
                {
                }
                field("Order No."; Rec."Order No.")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Part No."; Rec."Part No.")
                {
                }
                field("Part Name"; Rec."Part Name")
                {
                }
                field(Qty; Rec.Qty)
                {
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("C/O"; Rec."C/O")
                {
                }
                field("Qty on Order"; Rec."Qty on Order")
                {
                }
                field("Net Qty On Order"; Rec."Net Qty On Order")
                {
                }
                field("Supplier No."; Rec."Supplier No.")
                {
                }
                field("New Invoice No."; Rec."New Invoice No.")
                {
                }
                field("Invoiced Date"; Rec."Invoiced Date")
                {
                }
                field(Invoiced; Rec.Invoiced)
                {
                }
                field("New Part No."; Rec."New Part No.")
                {
                }
                field("Has Substitute"; Rec."Has Substitute")
                {
                }
                field("Substitute No."; Rec."Substitute No.")
                {
                }
                field("Substitute Supplied"; Rec."Substitute Supplied")
                {
                }
                field("Sub Qty On Order"; Rec."Sub Qty On Order")
                {
                }
                field("Serial No."; Rec."Serial No.")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Import Japan Order")
            {
                RunObject = XMLport 50144;
            }
            action("Update Inventory")
            {

                trigger OnAction()
                begin

                    IF CONFIRM('Are You Sure You want to register the New Parts? ', FALSE) THEN
                        Rec.InsertItem;
                end;
            }
            action("Update Substitute")
            {
            }
            action("Generate Invoice")
            {

                trigger OnAction()
                begin
                    Rec.CreateOrder;
                end;
            }
        }
    }
}

