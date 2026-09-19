page 70521 "Vehicle Online Order Card"
{
    PageType = Card;
    SourceTable = 70049;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                //Editable = false;
                field("Order No."; Rec."Order No.")
                {

                }
                field("Customer No"; Rec."Customer No")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Payment Notification Date"; Rec."Payment Notification Date")
                {
                    Visible = false;
                }
                field("Payment Mode"; Rec."Payment Mode")
                {
                }
                field("Customer Deposit Balance"; Rec."Customer Deposit Balance")
                {
                }
                field("Online Order"; Rec."Online Order")
                {
                }
                field("FAD Payment Confirmation"; Rec."FAD Payment Confirmation")
                {
                    Caption = 'FAD Confirmation';
                }
            }
            group("Dealer Payment Confirmation Advice")
            {
                group(Deposit)
                {
                    Visible = AvailableDeposit;
                    field("Customer Balance"; Rec."Customer Balance")
                    {
                    }
                }
                group(Credit)
                {
                    Visible = CreditLimit;
                    field("Available Credit"; Rec."Available Credit")
                    {
                        Visible = false;
                    }
                    field("Credit Limit"; Rec."Credit Limit")
                    {
                    }
                }
                group("Bank Transfer")
                {
                    Editable = false;
                    Visible = BankTransfer;
                    field("Payment Details"; Rec."Payment Details")
                    {
                    }
                    field("Dealer Bank"; Rec."Dealer Bank")
                    {
                    }
                    field("TNL Bank"; Rec."TNL Bank")
                    {
                    }
                    field("Proof of Payment"; Rec."Proof of Payment")
                    {
                        ExtendedDatatype = URL;
                    }
                    field("Amount Due"; Rec."Amount Due")
                    {
                    }
                    field("Amount Paid"; Rec."Amount Paid")
                    {
                    }
                }
            }
            group(Discount)
            {
                Visible = false;
                field("Discount Required"; Rec."Discount Required")
                {
                }
                field("Discount Reason"; Rec."Discount Reason")
                {
                }
                field("Discount Document URL"; Rec."Discount Document URL")
                {
                }
                field("Discount Approved By"; Rec."Discount Approved By")
                {
                }
                field("Discount Approved Date"; Rec."Discount Approved Date")
                {
                }
            }
            group("FAD Payment Confirmation.")
            {
                field("Dealer Order Date"; Rec."Dealer Order Date")
                {
                }
                field("Additional Instruction"; Rec."Additional Instruction")
                {
                    Caption = 'Dealer Additional Instruction';
                }
                field("TNL Sales Order No."; Rec."TNL Sales Order No.")
                {
                    Editable = false;
                }
                field("FAD Name"; Rec."FAD Name")
                {
                }
                field("FAD Confirmation DateTime"; Rec."FAD Confirmation DateTime")
                {
                }
                field("Amount Recieved"; Rec."Amount Recieved")
                {
                }
                field(Balance; Rec.Balance)
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                    Visible = false;
                }
            }
            part(Line; "Vehicle Online Order Subform")
            {
                Caption = 'Lines';
                SubPageLink = "Document No" = FIELD("Order No.");

            }
        }
    }

    actions
    {
        area(creation)
        {
            action("FAD Confirmation")
            {
                Image = Confirm;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    IF Rec."FAD Payment Confirmation" THEN
                        ERROR(FADError) ELSE BEGIN
                        IF CONFIRM(FADConfirm, FALSE) THEN
                            Rec.VALIDATE("FAD Payment Confirmation", TRUE);

                    END;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        IF Rec."Payment Mode" = Rec."Payment Mode"::"Available Credit" THEN BEGIN
            CreditLimit := TRUE;
            AvailableDeposit := FALSE;
            BankTransfer := FALSE;
        END;

        IF Rec."Payment Mode" = Rec."Payment Mode"::"Available Deposit" THEN BEGIN
            CreditLimit := FALSE;
            AvailableDeposit := TRUE;
            BankTransfer := FALSE;
        END;

        IF Rec."Payment Mode" = Rec."Payment Mode"::"Bank Transfer" THEN BEGIN
            CreditLimit := FALSE;
            AvailableDeposit := FALSE;
            BankTransfer := TRUE;
        END;
    end;

    trigger OnOpenPage()
    begin
        IF Rec."Payment Mode" = Rec."Payment Mode"::"Available Credit" THEN BEGIN
            CreditLimit := TRUE;
            AvailableDeposit := FALSE;
            BankTransfer := FALSE;
        END;

        IF Rec."Payment Mode" = Rec."Payment Mode"::"Available Deposit" THEN BEGIN
            CreditLimit := FALSE;
            AvailableDeposit := TRUE;
            BankTransfer := FALSE;
        END;

        IF Rec."Payment Mode" = Rec."Payment Mode"::"Bank Transfer" THEN BEGIN
            CreditLimit := FALSE;
            AvailableDeposit := FALSE;
            BankTransfer := TRUE;
        END;
    end;

    var
        FADConfirm: Label 'Are you sure you want to confirm this transaction?';
        FADError: Label 'This payment has already been confirmed!';
        BankTransfer: Boolean;
        CreditLimit: Boolean;
        AvailableDeposit: Boolean;
        Customer: Record 18;
}

