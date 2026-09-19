table 70003 "Pool Car Allocation"
{
    /*  DrillDownPageID = 50596;
     LookupPageID = 50596;
  */
    fields
    {
        field(1; "Allocation No."; Code[10])
        {
        }
        field(2; "Request No."; Code[10])
        {
            TableRelation = "Pool Car Register"."Request No." WHERE("2nd Approval Status" = FILTER(Approved),
                                                                     Treated = CONST(false));

            trigger OnValidate()
            begin
                IF PoolCarReg.GET("Request No.") THEN BEGIN
                    "Requester Name" := PoolCarReg."Requester Name";
                    Destination := PoolCarReg.Destination;
                    Purpose := PoolCarReg."Request Type";
                    "Pickup Date" := PoolCarReg."Pickup Date";
                    "Pickup Time" := PoolCarReg."Pickup Time";
                    "Return Date" := PoolCarReg."Return Date";
                    "Return Time" := PoolCarReg."Return Time";
                    "Expected Hours" := PoolCarReg.Hours;
                    "Take-off Location" := PoolCarReg."Take-off Location";
                    Reason := PoolCarReg.Reason;
                    "Requester No." := PoolCarReg.Requester;
                END;
            end;
        }
        field(3; "Registration No."; Code[20])
        {

            trigger OnLookup()
            begin
                IF PAGE.RUNMODAL(50602, PoolCarAvail) = ACTION::LookupOK THEN BEGIN
                    "Registration No." := PoolCarAvail."Registration No.";
                    "Model Name" := PoolCarAvail."Model Name";
                    "Driver Name" := PoolCarAvail."Driver Name";
                    MODIFY;
                END;
            end;
        }
        field(4; "Model Name"; Text[70])
        {
        }
        field(5; "Pickup Date"; Date)
        {
        }
        field(6; "Return Date"; Date)
        {
        }
        field(7; "Expected Hours"; Duration)
        {
        }
        field(8; Allocate; Option)
        {
            OptionCaption = ' ,Allocate,Pending';
            OptionMembers = " ",Allocate,Pending;

            trigger OnValidate()
            begin
                CRLF := '';
                CRLF[1] := 13;
                CRLF[2] := 10;


                IF Allocate = Allocate::Allocate THEN BEGIN
                    IF PoolCarReg.GET("Request No.") THEN BEGIN
                        PoolCarReg.Treated := TRUE;
                        PoolCarReg.MODIFY;
                        "Allocation Date" := CURRENTDATETIME;
                    END;
                END;

            end;
        }
        field(9; "Allocation Date"; DateTime)
        {
        }
        field(10; "Requester Name"; Text[70])
        {
        }
        field(11; Destination; Text[250])
        {
        }
        field(12; Status; Option)
        {
            OptionCaption = 'Open,Closed';
            OptionMembers = Open,Closed;

            trigger OnValidate()
            begin
                UserSetup.GET(USERID);
                IF Status = Status::Closed THEN BEGIN
                    "Return By No." := USERID;
                    "Return By Name" := UserSetup.Name;
                    //"Actual Return Date" := TODAY;

                END;
            end;
        }
        field(13; "Actual Return Date"; Date)
        {
            Editable = false;
        }
        field(14; "Driver Name"; Text[70])
        {

            trigger OnLookup()
            begin
                IF PAGE.RUNMODAL(50602, PoolCarAvail) = ACTION::LookupOK THEN BEGIN
                    "Driver Name" := PoolCarAvail."Driver Name";
                    MODIFY;
                END;
            end;
        }
        field(15; Comments; Text[250])
        {
        }
        field(16; "Driver No."; Code[30])
        {
            TableRelation = Employee."No." WHERE("Pool Car" = filter(true));
        }
        field(17; "Mail Body"; Text[250])
        {
        }
        field(18; "Return By No."; Code[30])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(19; "Return By Name"; Text[70])
        {
        }
        field(20; "Allocator No."; Code[30])
        {

            trigger OnValidate()
            begin
                IF UserSetup.GET("Allocator No.") THEN
                    "Allocator Name" := UserSetup.Name;
            end;
        }
        field(21; "Allocator Name"; Text[70])
        {
        }
        field(22; "Initial Mileage"; Integer)
        {
        }
        field(23; "Mileage on Return"; Integer)
        {

            trigger OnValidate()
            begin
                "Mileage Covered" := "Mileage on Return" - "Initial Mileage";
            end;
        }
        field(24; "Actual Return Time"; Time)
        {

            trigger OnValidate()
            begin
                "Actual Hours" := ("Actual Return Date" - "Pickup Date") + ("Actual Return Time" - "Pickup Time");
            end;
        }
        field(25; Purpose; Option)
        {
            OptionCaption = ' ,Routine,Emergency';
            OptionMembers = " ",Routine,Emergency;
        }
        field(27; "Actual Hours"; Duration)
        {

            trigger OnValidate()
            begin
                //Hours := ("Return Date" - "Pickup Date") + ("Return Time" - "Pickup Time");
            end;
        }
        field(29; "Pickup Time"; Time)
        {
        }
        field(30; Reason; Text[70])
        {
        }
        field(31; "Mileage Covered"; Integer)
        {
        }
        field(32; "Return Time"; Time)
        {

            trigger OnValidate()
            begin
                "Actual Hours" := ("Actual Return Date" - "Pickup Date") + ("Actual Return Time" - "Pickup Time");
            end;
        }
        field(33; Remark; Text[100])
        {
        }
        field(34; "Mileage in Transit"; Integer)
        {
        }
        field(35; "Return Location1"; Option)
        {
            OptionCaption = ' ,Head Office,Oregun';
            OptionMembers = " ","Head Office",Oregun;
        }
        field(36; "Return Location2"; Option)
        {
            OptionCaption = ' ,Head Office,Oregun';
            OptionMembers = " ","Head Office",Oregun;
        }
        field(37; "Mileage on Return2"; Integer)
        {

            trigger OnValidate()
            begin
                "Mileage in Transit" := "Mileage on Return2" - "Mileage on Return";
            end;
        }
        field(62; "Take-off Location"; Option)
        {
            OptionCaption = ' ,Head Office,Oregun,Isolo';
            OptionMembers = " ","Head Office",Oregun,Isolo;
        }
        field(63; "Security Officer"; Text[50])
        {

            trigger OnLookup()
            begin
                Employee.SETRANGE("Security Officer", TRUE);
                IF PAGE.RUNMODAL(0, Employee) = ACTION::LookupOK THEN BEGIN
                    "Security Officer" := Employee."First Name" + ' ' + Employee."Last Name";
                    MODIFY;
                END;
            end;
        }
        field(64; Reject; Boolean)
        {
        }
        field(65; "Requester No."; Code[25])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Allocation No.")
        {
            Clustered = true;
        }
        key(Key2; "Registration No.", Status)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF "Allocation No." = '' THEN BEGIN
            PoolCarAllocation2.COPYFILTERS(Rec);
            PoolCarAllocation2.SETFILTER(PoolCarAllocation2."Allocation No.", '<>%1', '');
            PoolCarAllocation2.SETRANGE(PoolCarAllocation2.Status, PoolCarAllocation2.Status::Open);
            PoolCarAllocation2.SETRANGE(PoolCarAllocation2."Allocator No.", USERID);
            IF PoolCarAllocation2.FIND('-') THEN
                ERROR('Created Pool Car Allocation No. %1 not used!\New allocation cannot be created', PoolCarAllocation2."Allocation No.");
        END;

        HRSetup.GET;
        IF "Allocation No." = '' THEN BEGIN
            HRSetup.TESTFIELD("Allocation No.");
            "Allocation No." := NoSeriesMgt.GetNextNo(HRSetup."Allocation No.");
            //NoSeriesMgt.InitSeries(HRSetup."Allocation No.", HRSetup."Allocation No.", 0D, "Allocation No.", HRSetup."Allocation No.");
        END;

        UserSetup.GET(USERID);
        "Allocator Name" := UserSetup.Name;

        PoolCarAvail.DELETEALL;
    end;

    var
        PoolCarReg: Record "Pool Car Register";
        EntryNo: Integer;
        PoolCarAllocation: Record "Pool Car Allocation";
        PoolCarAllocation2: Record "Pool Car Allocation";
        PoolCarAvail: Record "Pool Car Availability";
        PoolCar: Record "Pool Cars";
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        text004: Label 'Pool Car Request  ''%1''  Vehicle Allocated.';
        text005: Label 'Return date cannot be earlier than pickup date!';
        Employee: Record Employee;
        //Mail: Codeunit Mail;
        ToName: Text[80];
        CCName: Text[80];
        Attachment: Text[80];
        Opendialog: Boolean;
        Bcc: Text[80];
        subject: Text[100];
        text006: Label '%1 with Reg. No. %2 with driver %3 has been allocated to you.';
        UserSetup: Record "User Setup";
        UserSetup2: Record "User Setup";
        "Mail Body": Text[80];
        text007: Label 'Vehicle %1 has been allocated to you.';
        text008: Label 'Vehicle %1 has been allocated to you.';
        URLlink: Text[200];
        text009: Label 'Your request is pending.';
        text010: Label 'Vehicle Allocation Pending';
        CRLF: Text[2];
        Addressee: Text[70];
        SenderName: Text[70];
        //SMTPMail: Codeunit "400";
        //EmailBody: Record "99008535";
        BodyTxt: Text;
        //BodyBlob: Record "99008535";
        BodyStream: OutStream;
        SenderInitial: Text;
        SenderEmail: Text[50];
        TempEmailItem: Record "Email Item" temporary;
}

