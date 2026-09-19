table 50152 "Employee Transfer History"
{
    /*  DrillDownPageID = 50309;
     LookupPageID = 50309; */

    fields
    {
        field(1; "No."; Code[20])
        {
            Editable = false;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                IF Emplorec.GET("No.") THEN
                    Name := Emplorec.FullName;
            end;
        }
        field(2; "Line No."; Integer)
        {
            Editable = false;
        }
        field(3; Date; Date)
        {
            Editable = false;
        }
        field(4; "From Cost Centre"; Code[20])
        {
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(5; "From Department"; Code[20])
        {
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(6; "To Cost Centre"; Code[20])
        {
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(7; "To Department"; Code[20])
        {
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(8; "User ID"; Code[20])
        {

        }
        field(9; Name; Text[50])
        {
            Editable = false;
        }
        field(10; Time; Time)
        {
            Editable = false;
        }
        field(11; Remark; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "User ID" := USERID;
        Time := Time;
    end;

    var
        Emplorec: Record Employee;
}

