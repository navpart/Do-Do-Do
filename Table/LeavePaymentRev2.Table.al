table 50076 "Leave Payment Rev 2"
{
    /* DrillDownPageID = 50096;
    LookupPageID = 50096; */

    fields
    {
        field(1; "Entry no"; Integer)
        {
        }
        field(2; "Leave Period"; Integer)
        {
        }
        field(3; "Employee No."; Code[10])
        {
            TableRelation = Employee."No.";
        }
        field(4; "Document No"; Code[10])
        {
        }
        field(5; "Amount Paid"; Decimal)
        {

            trigger OnValidate()
            begin
                CALCFIELDS("Amount Due");
                CALCFIELDS("Total Paid for Leave");
                IF ("Amount Due" < "Total Paid for Leave" + "Amount Paid") THEN BEGIN
                    LeaveRec.SETRANGE(LeaveRec."Employee No.", "Leave Plan No.");
                    LeaveRec.CALCFIELDS(LeaveRec."Amount Paid");
                    MESSAGE('You cannot pay More than %1 for this Leave', FORMAT("Amount Due" - "Total Paid for Leave"));
                    "Amount Paid" := "Amount Due" - "Total Paid for Leave";
                END;

                LeaveRec.SETRANGE(LeaveRec."Employee No.", xRec."Leave Plan No.");
                IF LeaveRec.FIND('-') THEN BEGIN
                    "Leave Period" := LeaveRec."Leave Period";
                    "Employee No." := LeaveRec."Employee No.";
                    "Payment Date" := TODAY;
                END;


                IF "Amount Paid" = 0 THEN Rec.DELETE;
            end;
        }
        field(6; "Payment Date"; Date)
        {
        }
        field(7; "Total Days Paid For"; Integer)
        {
        }
        field(8; "Leave Plan No."; Code[10])
        {

            trigger OnValidate()
            begin
                /*
                LeaveRec.SETRANGE(LeaveRec."Serial No",xRec."Leave Plan No.");
                
                IF LeaveRec.find('-') THEN
                  BEGIN
                    "Leave Period" := LeaveRec."Leave Period";
                    "Employee No." := LeaveRec."Employee No.";
                  END;
                */

            end;
        }
        field(9; "Amount Due"; Decimal)
        {
            CalcFormula = Sum("Leave Plan Lines Rev 2"."Amount Due" WHERE("Employee No." = FIELD("Leave Plan No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Total Paid for Leave"; Decimal)
        {
            CalcFormula = Sum("Leave Payment Rev 2"."Amount Paid" WHERE("Leave Plan No." = FIELD("Leave Plan No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Leave Plan No.", "Entry no")
        {
            Clustered = true;
            SumIndexFields = "Amount Paid";
        }
        key(Key2; "Leave Period", "Employee No.")
        {
            SumIndexFields = "Amount Paid";
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        LeavePayRec.RESET;

        IF LeavePayRec.FIND('+') THEN
            "Entry no" := LeavePayRec."Entry no" + 10
        ELSE
            "Entry no" := 10;
    end;

    var
        LeavePayRec: Record "Leave Payment Rev 2";
        LeaveRec: Record "Leave Plan Lines Rev 2";
}

