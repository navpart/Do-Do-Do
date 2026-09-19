table 50089 "Scholarship Register"
{

    fields
    {
        field(1; "Reg No"; Integer)
        {
        }
        field(2; "Employee No"; Code[10])
        {
            NotBlank = true;
            TableRelation = Employee;
        }
        field(3; "Institution Group"; Code[4])
        {
            NotBlank = true;
            TableRelation = "Education Institute Grp"."Group Code";
        }
        field(4; Institution; Code[6])
        {
            NotBlank = true;
            TableRelation = "Educational Institute"."Institute Code" WHERE("Institute Grp" = FIELD("Institution Group"));
        }
        field(5; "Course Group"; Code[10])
        {
            NotBlank = true;
            //TableRelation = "Scholarship Courses Grp".;
        }
        field(6; "Course Code"; Code[10])
        {
            NotBlank = true;
            TableRelation = "Scholarship Courses"."Course Code" WHERE(Group = FIELD("Course Group"));
        }
        field(7; Duration; Code[10])
        {
            DateFormula = true;

            trigger OnValidate()
            begin
                IF (Duration <> '') AND ("Start Date" <> 0D) THEN VALIDATE("End Date", CALCDATE('+' + Duration + ' -1D', "Start Date"));
                IF (Duration <> '') AND ("Start Date" = 0D) AND ("End Date" <> 0D) THEN
                    VALIDATE("Start Date", CALCDATE('-' + Duration + ' -1D', "End Date"));
            end;
        }
        field(8; "Start Date"; Date)
        {

            trigger OnValidate()
            begin
                IF ("Start Date" = 0D) THEN EXIT;
                IF ("End Date" <> 0D) AND ("End Date" < "Start Date") THEN ERROR('The End DATE MUST be Further in Time than the START DATE');

                IF (Duration <> '') THEN
                    VALIDATE("End Date", CALCDATE('+' + Duration + ' -1D', "Start Date"))
                ELSE
                    IF ("End Date" <> 0D) THEN Duration := FORMAT("End Date" - "Start Date" + 1) + 'D';
            end;
        }
        field(9; "End Date"; Date)
        {

            trigger OnValidate()
            begin
                IF ("End Date" = 0D) THEN EXIT;
                IF ("Start Date" <> 0D) AND ("End Date" < "Start Date") THEN ERROR('The End DATE MUST be Further in Time than the START DATE');

                IF (Duration <> '') THEN
                    "Start Date" := CALCDATE('-' + Duration + ' +1D', "End Date")
                ELSE
                    IF ("Start Date" <> 0D) THEN Duration := FORMAT("End Date" - "Start Date" + 1) + 'D';


                TESTFIELD("End Date");
                CourseRec.RESET;
                IF CourseRec.GET("Course Code") THEN
                    "Bonding Date" := CALCDATE('+' + CourseRec."Bonding Period", "End Date");

                //message(format('+'+CourseRec."Bonding Period") + ' == ' + "Course Code");
            end;
        }
        field(11; "Date Last Paid"; Date)
        {
            CalcFormula = Max("Scholarship Payment"."Date Paid" WHERE("Employee No" = FIELD("Employee No"),
                                                                       "Register No" = FIELD("Reg No")));
            FieldClass = FlowField;
        }
        field(12; "Date Authorized"; Date)
        {
        }
        field(13; "Amount Authorized"; Decimal)
        {
            BlankZero = true;

            trigger OnValidate()
            begin
                IF xRec.Registered THEN ERROR('You Cannot Modify Amount Authorized \\On A Registered Record!');
            end;
        }
        field(14; "Bonding Date"; Date)
        {
        }
        field(15; Registered; Boolean)
        {
            Editable = false;
        }
        field(16; Comment; Text[100])
        {
        }
        field(17; "Actual Completion Date"; Date)
        {
        }
        field(18; Completed; Boolean)
        {
        }
        field(19; "Amount Paid"; Decimal)
        {
            CalcFormula = Sum("Scholarship Payment".Amount WHERE("Register No" = FIELD("Reg No"),
                                                                  Amount = FILTER(> 0)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; "Amount Refunded"; Decimal)
        {
            CalcFormula = Sum("Scholarship Payment".Amount WHERE("Register No" = FIELD("Reg No"),
                                                                  Amount = FILTER(< 0)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; "Employee Indebtedness"; Decimal)
        {
            CalcFormula = Sum("Scholarship Payment".Amount WHERE("Register No" = FIELD("Reg No")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Reg No", "Employee No")
        {
            Clustered = true;
        }
        key(Key2; "Course Code", "Employee No")
        {
        }
        key(Key3; "Employee No")
        {
        }
        key(Key4; "Employee No", Institution, "Course Code", Duration)
        {
        }
        key(Key5; "Amount Authorized")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        PayRec.SETRANGE("Register No", "Reg No");
        PayRec.DELETEALL(TRUE);
    end;

    trigger OnInsert()
    begin
        IF SchRec.FIND('+') THEN
            RecNo := SchRec."Reg No" + 1
        ELSE
            RecNo := 1;

        "Reg No" := RecNo;
        "Date Authorized" := TODAY;
    end;

    trigger OnModify()
    begin
        //IF xRec.Registered THEN ERROR('You Cannot Modify A Registered Record!');
    end;

    var
        RecNo: Integer;
        SchRec: Record 50089;
        PayRec: Record 50090;
        TotalInd: Decimal;
        CourseRec: Record 50088;
        Bp: Code[10];


    procedure AmountAuthorized("Regist. No": Integer): Decimal
    var
        Registrec: Record 50089;
    begin
        IF Registrec.GET("Regist. No") THEN
            EXIT(Registrec."Amount Authorized")
        ELSE
            EXIT(0);
    end;


    procedure AmountPaid("Regist. No": Integer): Decimal
    var
        Registrec: Record 50089;
    begin
        IF Registrec.GET("Regist. No") THEN BEGIN
            Registrec.CALCFIELDS("Amount Paid");
            EXIT(Registrec."Amount Paid");
        END
        ELSE
            EXIT(0);
    end;


    procedure GetIndebtedness(): Decimal
    begin
        //PayRec.setrange(PayRec."Register No","Reg No");
        //PayRec.SETRANGE(PayRec."Employee No","Employee No");
        //if PayRec.FIND('-') then
        //begin

        CALCFIELDS("Employee Indebtedness");

        IF "Bonding Date" < TODAY THEN
            EXIT(0)
        ELSE
            EXIT("Employee Indebtedness");
        //end;
    end;
}

