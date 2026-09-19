table 50066 "Appraisal Header"
{

    fields
    {
        field(1; "Employee No"; Code[10])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                //VALIDATE(Manager,Employee.IsManager("Employee No"));
            end;
        }
        field(2;"Current Employee Group";Code[20])
        {
            CalcFormula = Lookup(Employee."Employee Group" WHERE ("No."=FIELD("Employee No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(3;"Count-No Promotion";Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Appraisal Entries" WHERE ("Employee No."=FIELD("Employee No"),
                                                           "Appraisal Code"=filter('N'),
                                                           Open=CONST(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(4;"Count-Defferement";Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Appraisal Entries" WHERE ("Employee No."=FIELD("Employee No"),
                                                           "Appraisal Code"=filter('F'),
                                                           Open=CONST(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5;"Count - Single Movement";Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Appraisal Entries" WHERE ("Employee No."=FIELD("Employee No"),
                                                           "Appraisal Code"=filter('S'),
                                                           Open=CONST(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6;"Count - Double Movement";Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Appraisal Entries" WHERE ("Employee No."=FIELD("Employee No"),
                                                           "Appraisal Code"=filter('D'),
                                                           Open=CONST(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7;"Count - Increment";Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Appraisal Entries" WHERE ("Employee No."=FIELD("Employee No"),
                                                           "Appraisal Code"=filter('M'),
                                                           Open=CONST(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9;"Employee No Filter";Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee."No.";
        }
        field(10;"Count - Promotion";Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Appraisal Entries" WHERE ("Employee No."=FIELD("Employee No"),
                                                           "Appraisal Code"=filter('P'),
                                                           Open=CONST(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11;"Old Grade";Code[2])
        {
        }
        field(12;"Old Step";Code[2])
        {
        }
        field(13;"New Grade";Code[2])
        {
        }
        field(14;"New Step";Code[2])
        {
        }
        field(15;Comment;Text[80])
        {
        }
        field(16;Manager;Boolean)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //ERROR('You are NOT ALLOWED to DELETE this record Please');
    end;

    trigger OnModify()
    begin
        ERROR('You are NOT ALLOWED to MODIFY this record Please');
    end;

    trigger OnRename()
    begin
        ERROR('You are NOT ALLOWED to RENAME this record Please');
    end;

    var
        Employee: Record Employee;
}

