page 50122 "Item Tracking Entries Form"
{
    Caption = 'Item Tracking Entries';
    Editable = false;
    PageType = List;
    SaveValues = true;
    SourceTable = "Item Ledger Entry";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Positive; Rec.Positive)
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    Visible = false;
                }
                field("Serial No."; Rec."Serial No.")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Lot No."; Rec."Lot No.")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                }
                field("Source Type"; Rec."Source Type")
                {
                    Visible = false;
                }
                field("Warranty Date"; Rec."Warranty Date")
                {
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                }
                field("Entry No."; Rec."Entry No.")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Item Tracking Entry")
            {
                Caption = '&Item Tracking Entry';
                action("Serial No. Information Card")
                {
                    Caption = 'Serial No. Information Card';
                    Image = SNInfo;
                    RunObject = Page 6509;
                    RunPageLink = "Item No." = FIELD("Item No."),
                                  "Variant Code" = FIELD("Variant Code"),
                                  "Serial No." = FIELD("Serial No.");
                }
                action("Lot No. Information Card")
                {
                    Caption = 'Lot No. Information Card';
                    Image = LotInfo;
                    RunObject = Page 6508;
                    RunPageLink = "Item No." = FIELD("Item No."),
                                  "Variant Code" = FIELD("Variant Code"),
                                  "Lot No." = FIELD("Lot No.");
                }
            }
        }
        area(processing)
        {
            action("&Navigate")
            {
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    //Navigate.SetDoc("Posting Date","Document No.");
                    //Navigate.RUN;
                end;
            }
        }
    }
}

