table 50162 "Document Approval"
{

    fields
    {
        field(1; "No."; Code[10])
        {
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = ' ,Quote,Invoice';
            OptionMembers = " ",Quote,Invoice;
        }
        field(3; "Document No."; Code[20])
        {
        }
        field(4; Comment; Boolean)
        {
        }
        field(5; "Level 1"; Code[20])
        {
        }
        field(6; "Level 2"; Code[20])
        {
        }
        field(7; "Level 3"; Code[20])
        {
        }
        field(8; "Sender 1"; Code[20])
        {
        }
        field(9; "Sender 2"; Code[20])
        {
        }
        field(10; "Sender 3"; Code[20])
        {
        }
        field(11; "Sender 4"; Code[20])
        {
        }
        field(12; Date; Date)
        {
        }
        field(13; "Document Title"; Text[50])
        {
        }
        field(14; "Vendor No."; Code[10])
        {
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                IF VendRec.GET("Vendor No.") THEN
                    "Vendor Name" := VendRec.Name ELSE
                    "Vendor Name" := '';
            end;
        }
        field(15; "Vendor Name"; Text[50])
        {
        }
        field(16; Amount; Decimal)
        {
        }
        field(17; "Payment Type"; Option)
        {
            OptionCaption = ' ,Cash,Cheque,e-Payment';
            OptionMembers = " ",Cash,Cheque,"e-Payment";
        }
        field(18; "Pending Person"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        GLSetup.GET;
        GLSetup.TESTFIELD(GLSetup."Document Approval");
        NoSeriesMgt.GetNextNo(GLSetup."Document Approval");
        Date := TODAY;

    end;

    var
        GLSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit "No. Series";
        VendRec: Record Vendor;
        UserSetup: Record "User Setup";
}

