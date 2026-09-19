table 70004 "Pool Car Availability"
{
    //LookupPageID = 50598;

    fields
    {
        field(1; "Document No."; Code[10])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Registration No."; Code[10])
        {
        }
        field(4; "Model Name"; Text[70])
        {
        }
        field(5; "Driver Name"; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PoolCarAllocation: Record "Pool Car Allocation";
        PoolCarAvail: Record "Pool Car Availability";
        LineNo: Integer;
        PoolCar: Record "Pool Cars";
        PoolCarReg: Record "Pool Car Register";
        PoolCarAvail2: Record "Pool Car Availability";
        PoolCarAllocation2: Record "Pool Car Allocation";


    procedure CheckAvailability()
    begin
        PoolCarAvail2.DELETEALL;

        LineNo := 10000;

        PoolCarAllocation2.GET("Document No.");

        PoolCar.SETCURRENTKEY("Registration No.", Type);
        PoolCar.SETFILTER(Type, '%1', PoolCarAllocation2.Purpose);
        IF PoolCar.FINDFIRST THEN BEGIN
            REPEAT
                PoolCarAvail.INIT;
                PoolCarAvail."Document No." := "Document No.";
                PoolCarAvail."Line No." := LineNo;
                PoolCarAvail."Registration No." := PoolCar."Registration No.";
                PoolCarAvail."Model Name" := PoolCar."Model Name";
                PoolCarAvail."Driver Name" := PoolCar."Driver Name";
                PoolCarAvail.INSERT;
                LineNo += 10000;

                PoolCarAllocation.SETCURRENTKEY("Registration No.", Status);
                PoolCarAllocation.SETRANGE("Registration No.", PoolCarAvail."Registration No.");
                PoolCarAllocation.SETRANGE(Status, PoolCarAllocation.Status::Open);
                IF PoolCarAllocation.FINDFIRST THEN BEGIN
                    REPEAT
                        PoolCarAvail.DELETE;
                    UNTIL PoolCarAllocation.NEXT = 0;
                END;
            UNTIL PoolCar.NEXT = 0;
        END;
    end;
}

