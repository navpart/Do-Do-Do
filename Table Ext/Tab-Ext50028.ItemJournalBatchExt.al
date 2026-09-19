tableextension 50028 "Item Journal Batch Ext" extends "Item Journal Batch"
{
    fields
    {
        
        field(50000; "Expense Code"; Code[20])
        {
            Editable = false;
            TableRelation = "Gen. Product Posting Group";

            trigger OnValidate()
            begin

                ItemJnlLine.SETRANGE(ItemJnlLine."Journal Template Name", "Journal Template Name");
                ItemJnlLine.SETRANGE(ItemJnlLine."Journal Batch Name", Name);
                ItemJnlLine.MODIFYALL(ItemJnlLine."Gen. Prod. Posting Group", "Expense Code");
            end;
        }
        field(50001; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(1));

            trigger OnValidate()
            begin

                ItemJnlLine.SETRANGE(ItemJnlLine."Journal Template Name", "Journal Template Name");
                ItemJnlLine.SETRANGE(ItemJnlLine."Journal Batch Name", Name);
                IF ItemJnlLine.FIND('-') THEN
                    REPEAT
                    //IF ItemJnlLine."Entry Type" IN [ItemJnlLine."Entry Type"::Issue,ItemJnlLine."Entry Type"::Return] THEN
                    BEGIN
                        ItemJnlLine.VALIDATE(ItemJnlLine."Shortcut Dimension 1 Code", "Global Dimension 1 Code");
                        DimValue.GET('Department', ItemJnlLine."Shortcut Dimension 1 Code");
                        //ItemJnlLine.VALIDATE(ItemJnlLine."Gen. Bus. Posting Group", DimValue."Expense Group");
                        ItemJnlLine.MODIFY;
                    END;
                    UNTIL ItemJnlLine.NEXT = 0;
            end;
        }
        field(50002; "Batch Total Value"; Decimal)
        {
            CalcFormula = Sum ("Item Journal Line".Amount WHERE ("Journal Template Name"=FIELD("Journal Template Name"),
                                                                "Journal Batch Name"=FIELD(Name)));
            FieldClass = FlowField;
        }
        field(50003;"Voucher No.";Code[15])
        {
            Editable = true;

            trigger OnValidate()
            begin

                ItemJnlLine.SETRANGE(ItemJnlLine."Journal Template Name","Journal Template Name");
                ItemJnlLine.SETRANGE(ItemJnlLine."Journal Batch Name",Name);
                ItemJnlLine.MODIFYALL(ItemJnlLine."Document No.","Voucher No.");
            end;
        }
        field(50004;"Requisition No.";Code[10])
        {
            Editable = true;

            trigger OnValidate()
            begin

                ItemJnlLine.SETRANGE(ItemJnlLine."Journal Template Name","Journal Template Name");
                ItemJnlLine.SETRANGE(ItemJnlLine."Journal Batch Name",Name);
                ItemJnlLine.MODIFYALL(ItemJnlLine."External Document No.","Requisition No.");
            end;
        }
        field(50005;"Authorised By";Code[10])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin

                ItemJnlLine.SETRANGE(ItemJnlLine."Journal Template Name","Journal Template Name");
                ItemJnlLine.SETRANGE(ItemJnlLine."Journal Batch Name",Name);
            end;
        }
        field(50006;"Printed Copies";Integer)
        {
        }
        field(50007;Total;Decimal)
        {
            CalcFormula = Sum("Item Journal Line".Amount WHERE ("Journal Batch Name"=FIELD(Name)));
            FieldClass = FlowField;
        }
        field(50008;"EPR Created";Boolean)
        {
        }
        
    }
    var
        ItemJnlLine: Record "Item Journal Line"; 
        Item: Record Item;
        ReqWkshName: Record "Requisition Wksh. Name";
        ReqTemplate: Record "Req. Wksh. Template";
        ReqLine: Record "Requisition Line";
        ReqLine2: Record "Requisition Line";
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        WorksheetName: Code[10];
        Window: Dialog;
        NoOfRecords: Integer;
        iCount: Integer;
        JnlSelected: Boolean;
        DimValue: Record "Dimension Value";
        
}
