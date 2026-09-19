page 70032 "IOU Approved List"
{
    ApplicationArea = All;
    PageType = List;
    Editable = false;
    SourceTable = "IOU Register";
    SourceTableView = WHERE("Final Apprv. Status" = filter('Approved'),
                            Treated = filter(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field("IOU No."; Rec."IOU No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Payment Date"; Rec."Payment Date")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Expected Retirement Date"; Rec."Expected Retirement Date")
                {
                }
                field("Account No."; Rec."Account No.")
                {

                }
                field("Account Name"; Rec."Account Name")
                {

                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(Create)
            {
                action("&Cheque Requisition")
                {
                    Caption = '&Cheque Requisition';
                    Image = Check;
                    //Promoted = true;
                    trigger OnAction()
                    begin
                        //Dada: to transfer records to Cheque requisition.
                        IF CONFIRM('Do you want to raise a cheque requisition?') THEN BEGIN
                            PaymentRec.INIT;
                            PaymentRec."Document Type" := PaymentRec."Document Type"::Requisition;
                            PaymentRec."Cash/Cheque" := PaymentRec."Cash/Cheque"::Cheque;
                            PaymentRec."Posting Date" := TODAY;
                            PaymentRec."Document Date" := TODAY;
                            PaymentRec."Account Type" := PaymentRec."Account Type"::"G/L Account";
                            PaymentRec."Account No." := '271200';
                            PaymentRec."Multiple Account" := TRUE;
                            PaymentRec.INSERT(TRUE);
                            IOURegister.SETRANGE("Final Apprv. Status", 2);
                            IOURegister.SETRANGE(Treated, FALSE);
                            IF IOURegister.ISEMPTY THEN
                                ERROR('There is currently no approved requisition!');

                            IOURegister.SETRANGE("Final Apprv. Status", 2);
                            IOURegister.SETRANGE(Treated, FALSE);
                            IF IOURegister.FINDSET THEN
                                REPEAT
                                    PaymentLine.INIT;
                                    PaymentLine."No." := PaymentRec."No.";
                                    PaymentLine."Line No." := LineNo;
                                    PaymentLine.Type := PaymentLine.Type::Requisition;
                                    PaymentLine."Cash/Cheque" := PaymentLine."Cash/Cheque"::Cheque;
                                    PaymentLine."Account Type" := IOURegister."Account Type"::Customer;
                                    PaymentLine."Account No." := IOURegister."Account No.";
                                    PaymentLine."Account Description" := IOURegister."Account Name";
                                    PaymentLine."Department Code" := IOURegister."Global Dimension 1 Code";
                                    PaymentLine."Branch Code" := IOURegister."Global Dimension 2 Code";
                                    PaymentLine."Transaction Description" := IOURegister.Description;
                                    PaymentLine.VALIDATE("Debit Amount", IOURegister.Amount);
                                    PaymentLine.INSERT;
                                    LineNo := LineNo + 10000;
                                UNTIL IOURegister.NEXT = 0;
                            MESSAGE('Cheque Requisition %1 was Successfully Generated!', PaymentRec."No.");

                            IOURegister2.SETRANGE("Final Apprv. Status", 2);
                            IOURegister2.SETRANGE(Treated, FALSE);
                            IF IOURegister2.FINDSET THEN
                                REPEAT
                                    IOURegister2.Treated := TRUE;
                                    IOURegister2.MODIFY;
                                UNTIL IOURegister2.NEXT = 0;
                        END;
                        //Dada End;
                    end;
                }
                action("&e-Payment")
                {
                    Caption = '&e-Payment';
                    Image = Payment;
                    Promoted = true;
                    //PromotedCategory = New;

                    trigger OnAction()
                    begin
                        //Dada: to transfer records to Cheque requisition.
                        IF CONFIRM('Do you want to raise a e-Payment?') THEN BEGIN
                            PaymentRec.INIT;
                            PaymentRec."Document Type" := PaymentRec."Document Type"::"e-Pay";
                            PaymentRec."Cash/Cheque" := PaymentRec."Cash/Cheque"::Cheque;
                            PaymentRec."Posting Date" := TODAY;
                            PaymentRec."Document Date" := TODAY;
                            PaymentRec."Account Type" := PaymentRec."Account Type"::"G/L Account";
                            PaymentRec."Account No." := '271200';
                            PaymentRec."Multiple Account" := TRUE;
                            PaymentRec.INSERT(TRUE);
                            IOURegister.SETRANGE("Final Apprv. Status", 2);
                            IOURegister.SETRANGE(Treated, FALSE);
                            IF IOURegister.ISEMPTY THEN
                                ERROR('There is currently no approved requisition!');

                            IOURegister.SETRANGE("Final Apprv. Status", 2);
                            IOURegister.SETRANGE(Treated, FALSE);
                            IF IOURegister.FINDSET THEN
                                REPEAT
                                    PaymentLine.INIT;
                                    PaymentLine."No." := PaymentRec."No.";
                                    PaymentLine."Line No." := LineNo;
                                    PaymentLine.Type := PaymentLine.Type::"e-Pay";
                                    PaymentLine."Cash/Cheque" := PaymentLine."Cash/Cheque"::Cheque;
                                    PaymentLine."Account Type" := IOURegister."Account Type"::Customer;
                                    PaymentLine."Account No." := IOURegister."Account No.";
                                    PaymentLine."Account Description" := IOURegister."Account Name";
                                    PaymentLine."Department Code" := IOURegister."Global Dimension 1 Code";
                                    PaymentLine."Branch Code" := IOURegister."Global Dimension 2 Code";
                                    PaymentLine."Transaction Description" := IOURegister.Description;
                                    PaymentLine.VALIDATE("Debit Amount", IOURegister.Amount);
                                    PaymentLine.INSERT;
                                    LineNo := LineNo + 10000;
                                UNTIL IOURegister.NEXT = 0;
                            MESSAGE('e-Payment %1 was Successfully Generated!', PaymentRec."No.");

                            IOURegister2.SETRANGE("Final Apprv. Status", 2);
                            IOURegister2.SETRANGE(Treated, FALSE);
                            IF IOURegister2.FINDSET THEN
                                REPEAT
                                    IOURegister2.Treated := TRUE;
                                    IOURegister2.MODIFY;
                                UNTIL IOURegister2.NEXT = 0;
                        END;
                        //Bolaji End;
                    end;
                }
            }

        }
    }

    var
        IOURegister: Record 50105;
        PaymentRec: Record 50103;
        PaymentLine: Record 50104;
        IOURegister2: Record 50105;
        LineNo: Integer;
}

