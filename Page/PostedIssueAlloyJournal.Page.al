page 50392 "Posted Issue Alloy Journal"
{
    Caption = 'Item Registers';
    Editable = false;
    PageType = Card;
    SourceTable = "Item Register";
    SourceTableView = WHERE("Journal Batch Name" = FILTER('TISA*'));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                }
                field("Creation Date"; Rec."Creation Date")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Source Code"; Rec."Source Code")
                {
                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                }
                field("From Entry No."; Rec."From Entry No.")
                {
                }
                field("To Entry No."; Rec."To Entry No.")
                {
                }
                field("From Phys. Inventory Entry No."; Rec."From Phys. Inventory Entry No.")
                {
                }
                field("To Phys. Inventory Entry No."; Rec."To Phys. Inventory Entry No.")
                {
                }
                field("From Value Entry No."; Rec."From Value Entry No.")
                {
                }
                field("To Value Entry No."; Rec."To Value Entry No.")
                {
                }
                field("From Capacity Entry No."; Rec."From Capacity Entry No.")
                {
                }
                field("To Capacity Entry No."; Rec."To Capacity Entry No.")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Register")
            {
                Caption = '&Register';
                action("Item Ledger")
                {
                    Caption = 'Item Ledger';
                    Image = ItemLedger;
                    RunObject = Codeunit 245;
                }
                action("Phys. Invent&ory Ledger")
                {
                    Caption = 'Phys. Invent&ory Ledger';
                    Image = PhysicalInventoryLedger;
                    RunObject = Codeunit 390;
                }
                action("Value Entries")
                {
                    Caption = 'Value Entries';
                    Image = ValueLedger;
                    RunObject = Codeunit 5800;
                }
                action("&Capacity Ledger")
                {
                    Caption = '&Capacity Ledger';
                    Image = CapacityLedger;
                    RunObject = Codeunit 5835;
                }
            }
        }
    }
}

