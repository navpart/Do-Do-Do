page 50281 "Posted IOU Retirement"
{
    ApplicationArea = All;
    Editable = false;
    PageType = Card;
    SourceTable = "IOU Retirement Header";
    SourceTableView = WHERE(Posted = filter(true));

    layout
    {
        area(content)
        {
            group("IOU Retirement")
            {
                Caption = 'IOU Retirement';
                field("No."; Rec."No.")
                {
                }
                field("IOU No."; Rec."IOU No.")
                {
                }
                field("Entry Date"; Rec."Entry Date")
                {
                    Caption = 'Entry Date';
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                }
                field("Original IOU Amount"; Rec."Original IOU Amount")
                {
                }
                field("Amount To Retire"; Rec."Amount To Retire")
                {
                }
                field(BalAmt; BalAmt)
                {
                    Caption = 'Balance';
                    Editable = false;
                }
                label(Control1)
                {
                    CaptionClass = Text19002652;
                }
                field("Apply Entry"; Rec."Apply Entry")
                {
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                }
            }
            part("Retirement Lines"; 50221)
            {
                SubPageLink = "Retirement No." = FIELD("No."),
                              "IOU No." = FIELD("IOU No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Fu&nction")
            {
                Caption = 'Fu&nction';
                action(Print)
                {
                    Caption = 'Print';
                    Image = Print;
                    ShortCutKey = 'F7';

                    trigger OnAction()
                    begin
                        IOURetireHead.SETRANGE(IOURetireHead."No.", Rec."No.");
                        IF Rec.FINDFIRST THEN
                            REPORT.RUNMODAL(50350, TRUE, TRUE, IOURetireHead);
                    end;
                }
                separator(Control2)
                {
                }
                action(Navigate)
                {
                    Caption = 'Navigate';
                    Image = Navigate;

                    trigger OnAction()
                    begin
                        Rec.Navigate;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        BalAmt := 0;
        Rec.CALCFIELDS("Amount To Retire");
        BalAmt := Rec."Original IOU Amount" - Rec."Amount To Retire";
        CustOnAfterGetCurrRecord;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        CustOnAfterGetCurrRecord;
    end;

    var
        IOURec: Record 50105;
        IOURetireHead: Record 50107;
        GPC: Codeunit 50004;
        Text001: Label 'Do you want to Post Retirement';
        BalAmt: Decimal;
        Text19002652: Label 'For Accounts Dept. ';

    local procedure CustOnAfterGetCurrRecord()
    begin
        xRec := Rec;
        BalAmt := 0;
        Rec.CALCFIELDS("Amount To Retire");
        BalAmt := Rec."Original IOU Amount" - Rec."Amount To Retire";
    end;
}

