table 50061 Log
{

    fields
    {
        field(1; "Consecutive No."; Integer)
        {
            BlankZero = true;
            Editable = false;
        }
        field(2; "Log User"; Code[10])
        {
            Editable = false;
        }
        field(3; "Log Date"; Date)
        {
            Editable = false;
        }
        field(4; "Log Time"; Time)
        {
            Editable = false;
        }
        field(5; "FieldName."; Text[30])
        {
            Editable = false;
        }
        field(6; "Old Value"; Text[80])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
        }
        field(7; "New Value"; Text[80])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
        }
        field(8; ID; Text[30])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
            TableRelation = IF (Tabletype = filter('Account Dia')) "Acc. Schedule Name"
            ELSE
            IF (Tabletype = filter('Finance')) "G/L Account"
            ELSE
            IF (Tabletype = filter('Customer')) Customer
            ELSE
            IF (Tabletype = filter('Supplier')) Vendor
            ELSE
            IF (Tabletype = filter('Fixed Assets')) "Fixed Asset"
            ELSE
            IF (Tabletype = filter('Product')) Item;
        }
        field(9; "Acc. Diagr. Cons. No"; Integer)
        {
            BlankZero = true;
            Editable = false;
        }
        field(10; "Create/change/delete"; Option)
        {
            BlankZero = true;
            Editable = false;
            OptionMembers = Create,Modify,Delete;
        }
        field(11; "Delete: Text"; Text[80])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
        }
        field(12; "Delete: Summing up"; Text[80])
        {
            //The property BlankZero is only supported on fields of type BigInteger, Boolean, Integer, Decimal, Duration, Enum, and Option.
            //BlankZero = true;
            Editable = false;
        }
        field(13; Tabletype; Option)
        {
            BlankZero = true;
            Editable = false;
            OptionMembers = "Account Dia",Finance,Customer,Supplier,"Fixed Assets",Product,Job,Resource;
        }
    }

    keys
    {
        key(Key1; "Consecutive No.")
        {
            Clustered = true;
        }
        key(Key2; "Log User", "Log Date")
        {
        }
        key(Key3; "Log Date")
        {
        }
    }

    fieldgroups
    {
    }

    var
        LogRec: Record Log;


    procedure Log(IDin: Text[30]; AccIn: Integer; CrChDeleteIn: Option Create,Modify,Delete; FieldIn: Text[30]; OldIn: Text[80]; NewIn: Text[80]; DeletedTxtIn: Text[80]; DltSummIn: Text[80]; TblTypeIn: Option "Account Dia",Finance,Customer,Supplier,"Fixed Assets",Product,Job,Resource)
    begin

        INIT;

        LogRec.RESET;
        IF LogRec.FIND('+') THEN
            "Consecutive No." := LogRec."Consecutive No." + 1000
        ELSE
            "Consecutive No." := 1000;

        "Log User" := USERID;
        "Log Date" := TODAY;
        "Log Time" := TIME;
        ID := IDin;
        "Acc. Diagr. Cons. No" := AccIn;
        "Create/change/delete" := CrChDeleteIn;
        "FieldName." := FieldIn;
        "Old Value" := FORMAT(OldIn);
        "New Value" := FORMAT(NewIn);
        "Delete: Text" := FORMAT(DeletedTxtIn);
        "Delete: Summing up" := FORMAT(DltSummIn);
        Tabletype := TblTypeIn;

        INSERT;
    end;
}

