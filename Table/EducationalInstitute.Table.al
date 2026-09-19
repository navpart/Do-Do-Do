table 50086 "Educational Institute"
{
    DataCaptionFields = "Institute Code", "Institute Name";

    fields
    {
        field(1; "Institute Code"; Code[6])
        {
            NotBlank = true;
        }
        field(2; "Institute Grp"; Code[4])
        {
            NotBlank = true;
            TableRelation = "Education Institute Grp"."Group Code";

            trigger OnValidate()
            begin
                GrpNo := "Institute Grp";

                IF EduGrp.GET(GrpNo) THEN
                    VALIDATE("Institute Grp Name", EduGrp.Description);

                EduRec.SETCURRENTKEY("Institute Grp");
                EduRec.SETFILTER(EduRec."Institute Grp", GrpNo);



                IF EduRec.FIND('+') THEN BEGIN
                    "Institute Grp" := GrpNo;
                    EduNo := INCSTR(EduRec."Institute Code");
                    VALIDATE("Institute Code", EduNo);
                END
                ELSE BEGIN
                    "Institute Grp" := GrpNo;
                    EduNo := GrpNo + '01';
                    VALIDATE("Institute Code", EduNo);
                END;
            end;
        }
        field(3; "Institute Name"; Text[50])
        {
        }
        field(4; "Institute Grp Name"; Text[50])
        {
        }
        field(5; "Staffs In"; Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Employee Qualification" WHERE("Institution/Company" = FIELD("Institute Code")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Institute Grp", "Institute Code")
        {
            Clustered = true;
        }
        key(Key2; "Institute Code")
        {
        }
    }

    fieldgroups
    {
    }

    var
        EduRec: Record "Educational Institute";
        EduGrp: Record "Education Institute Grp";
        EduNo: Code[6];
        GrpNo: Code[4];
}

