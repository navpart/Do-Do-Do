page 70516 "Vehicle Online Order List"
{
    CardPageID = "Vehicle Online Order Card";
    PageType = List;
    SourceTable = 70049;
    SourceTableView = SORTING("Dealer Order Date")
                      ORDER(Descending);
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Order No."; Rec."Order No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Payment Notification Date"; Rec."Payment Notification Date")
                {
                }
                field("Payment Mode"; Rec."Payment Mode")
                {
                }
                field("Payment Instruction"; Rec."Payment Instruction")
                {
                }
                field("Dealer Order Date"; Rec."Dealer Order Date")
                {
                }
                field("Online Order"; Rec."Online Order")
                {
                }
                field("FAD Payment Confirmation"; Rec."FAD Payment Confirmation")
                {
                }
                field("FAD Name"; Rec."FAD Name")
                {
                }
                field("FAD Confirmation DateTime"; Rec."FAD Confirmation DateTime")
                {
                    Caption = 'Date Time';
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Amount Due"; Rec."Amount Due")
                {
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                }
            }
        }
    }

    actions
    {
    }
}

