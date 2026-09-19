table 50071 "Appraisal Summary By Type"
{

    fields
    {
        field(1; "Appraisal Code"; Code[1])
        {
            TableRelation = "Appraisal Codes".Code;

            trigger OnValidate()
            begin
                IF AppRec.GET("Appraisal Code") THEN "Aprraisal Description" := AppRec.Description;
            end;
        }
        field(2; "Appraisal Count"; Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Appraisal Entries" WHERE("Appraisal Code" = FIELD("Appraisal Code"),
                                                           "Employee No." = FIELD("Employee No. Filter"),
                                                           "Appraisal Date" = FIELD("Date Filter"),
                                                           Open = CONST(false)));
            FieldClass = FlowField;
        }
        field(3; "Employee No. Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee."No.";
        }
        field(4; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(5; "Aprraisal Description"; Text[100])
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Appraisal Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AppRec: Record "Appraisal Codes";
}

