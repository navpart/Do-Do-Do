table 70028 "Change Management Line"
{

    fields
    {
        field(1; "Line No."; Integer)
        {
        }
        field(2; "Document No."; Code[20])
        {

            trigger OnValidate()
            begin
                //"Line No."+= "Line No."+1000;
            end;
        }
        field(3; "Affected Object Type"; Option)
        {
            OptionCaption = ', ,Table,Page,Report,Codeunit,XML';
            OptionMembers = ," ","Table","Page","Report","Codeunit",XML;
        }
        field(4; "Object Code"; Code[30])
        {
        }
        field(5; Description; Text[50])
        {
        }
        field(6; "Change Type"; Option)
        {
            OptionCaption = 'New,Modification';
            OptionMembers = New,Modification;
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

