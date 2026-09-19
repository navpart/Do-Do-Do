table 50090 "Scholarship Payment"
{

    fields
    {
        field(1; "No."; Integer)
        {
            BlankZero = true;
        }
        field(2; "Employee No"; Code[10])
        {
            TableRelation = Employee."No.";
        }
        field(3; "Register No"; Integer)
        {
            BlankZero = true;
            NotBlank = true;
            TableRelation = "Scholarship Register"."Reg No" WHERE("Employee No" = FIELD("Employee No"));
        }
        field(4; Amount; Decimal)
        {
            BlankZero = true;

            trigger OnValidate()
            begin
                RegRec.SETRANGE(RegRec."Reg No", "Register No");
                IF RegRec.FIND('-') THEN BEGIN
                    SchPayRec.SETCURRENTKEY("Register No", "Employee No", "No.");
                    SchPayRec.SETRANGE(SchPayRec."Register No", "Register No");
                    SchPayRec.SETRANGE(SchPayRec."No.", "No.");
                    IF SchPayRec.FIND('-') THEN BEGIN
                        SchPayRec.CALCSUMS(SchPayRec.Amount);
                        AmtPaid := SchPayRec.Amount;
                    END
                    ELSE
                        AmtPaid := 0;

                    RegRec.CALCFIELDS(RegRec."Amount Paid", RegRec."Amount Refunded");
                    Ramt := RegRec."Amount Authorized" - RegRec."Amount Paid" - RegRec."Amount Refunded";
                    Diff := Amount - xRec.Amount;

                    IF (Diff > Ramt) THEN BEGIN
                        MESSAGE('You cannot pay more than amount authorised\\' +
                               'Total Paid is %1 You want To Pay %2  Amount Authorised is %3\\' +
                               'Remaining Balance to be paid is %4',
                               RegRec."Amount Paid", Amount, RegRec."Amount Authorized", Ramt);

                        Amount := Ramt + xRec.Amount;
                    END;

                END;
            end;
        }
        field(5; "Date Paid"; Date)
        {
        }
        field(6; "Document No"; Code[10])
        {
        }
        field(7; Comment; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Register No", "Employee No", "No.")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
        key(Key2; "Employee No", "Register No")
        {
            SumIndexFields = Amount;
        }
        key(Key3; "Date Paid", "Employee No")
        {
            SumIndexFields = Amount;
        }
        key(Key4; "No.", "Register No")
        {
            SumIndexFields = Amount;
        }
        key(Key5; "Register No", Amount)
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        SchPayRec.SETCURRENTKEY("No.", "Register No");
        IF SchPayRec.FIND('+') THEN
            RecNo := SchPayRec."No." + 10
        ELSE
            RecNo := 10;

        "No." := RecNo;
        //"Date Paid" := TODAY;
    end;

    var
        SchPayRec: Record 50090;
        RecNo: Integer;
        RegRec: Record 50089;
        PayRec: Record 50090;
        Ramt: Decimal;
        AutAmt: Decimal;
        AmtPaid: Decimal;
        Diff: Decimal;
}

