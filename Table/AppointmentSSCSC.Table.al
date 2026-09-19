table 50054 "Appointment SSC/SC"
{

    fields
    {
        field(1; "SSC/SC Code"; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "SSC/SC Date From"; Date)
        {

            trigger OnValidate()
            begin
                IF "SSC/SC Date To" > TODAY THEN
                    "SCSC Status" := "SCSC Status"::Active
                ELSE
                    "SCSC Status" := "SCSC Status"::Expired;
            end;
        }
        field(4; "SSC/SC Date To"; Date)
        {

            trigger OnValidate()
            begin
                IF "SSC/SC Date To" > TODAY THEN
                    "SCSC Status" := "SCSC Status"::Active
                ELSE
                    "SCSC Status" := "SCSC Status"::Expired;
            end;
        }
        field(5; "Issue Date"; Date)
        {

            trigger OnValidate()
            begin
                IF "SSC/SC Date To" > TODAY THEN
                    "SCSC Status" := "SCSC Status"::Active
                ELSE
                    "SCSC Status" := "SCSC Status"::Expired;
            end;
        }
        field(6; "SCSC Status"; Option)
        {
            OptionCaption = ' ,Active,Expired';
            OptionMembers = " ",Active,Expired;

            trigger OnValidate()
            begin
                IF "SSC/SC Date To" > TODAY THEN
                    "SCSC Status" := "SCSC Status"::Active
                ELSE
                    "SCSC Status" := "SCSC Status"::Expired;
            end;
        }
        field(7; "SSC/SC Description"; Text[100])
        {
        }
        field(8; Applied; Boolean)
        {
        }
        field(9; "Model No."; Code[20])
        {
            Description = 'No more a factor for determining if SSC Exists';
        }
        field(10; "C/I No"; Code[20])
        {
            Description = 'Campaign Information No.';
        }
        field(11; VDS; Code[10])
        {
            Description = 'Checks if the VDS of d vehicle being service is the same';
        }
        field(12; VIS; Code[10])
        {
            Description = 'Check if the VIS is within the range specified';
        }
        field(13; "Range From"; Code[10])
        {
        }
        field(14; "Range To"; Code[10])
        {
        }
        field(15; "Service Item Code"; Code[20])
        {
            TableRelation = "Service Item"."No.";
        }
        field(16;"Fault Code";Code[20])
        {
            TableRelation = "Fault Code".Code;
        }
        field(17;"COF No.";Code[20])
        {
            TableRelation = "Customer Order Table."."Customer Order Form No.";
        }
        field(18;VMI;Code[10])
        {
        }
    }

    keys
    {
        key(Key1;"SSC/SC Code","Line No.","Service Item Code","Fault Code")
        {
            Clustered = true;
        }
        key(Key2;VDS)
        {
        }
    }

    fieldgroups
    {
    }
}

