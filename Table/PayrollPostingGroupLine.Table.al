table 50010 "Payroll-Posting Group Line."
{
    fields
    {
        field(1; "Posting Group"; Code[20])
        {
            Editable = true;
            NotBlank = true;
            TableRelation = "Payroll-Posting Group Header."."Posting Group Code";
        }
        field(2; "E/D Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                // EDFileRec.GET( "E/D Code");
            end;
        }
        field(3; "Debit Account No."; Code[20])
        {
            TableRelation = IF ("Debit Acc. Type" = CONST("G/L Account")) "G/L Account"
            ELSE
            IF ("Debit Acc. Type" = CONST(Customer)) Customer
            ELSE
            IF ("Debit Acc. Type" = CONST(Vendor)) Vendor;

            trigger OnValidate()
            begin
                IF "Debit Account No." <> '' THEN
                    CASE "Debit Acc. Type" OF
                        "Debit Acc. Type"::"G/L Account":
                            FinanceAccRec.GET("Debit Account No.");
                        "Debit Acc. Type"::Customer:
                            CustomerAccRec.GET("Debit Account No.");
                        "Debit Acc. Type"::Vendor:
                            VendorRec.GET("Debit Account No.");
                    END;
            end;
        }
        field(4; "Credit Account No."; Code[20])
        {
            TableRelation = IF ("Credit Acc. Type" = CONST("G/L Account")) "G/L Account"
            ELSE
            IF ("Credit Acc. Type" = CONST(Customer)) Customer
            ELSE
            IF ("Credit Acc. Type" = CONST(Vendor)) Vendor;

            trigger OnValidate()
            begin
                IF "Credit Account No." <> '' THEN
                    CASE "Credit Acc. Type" OF
                        "Credit Acc. Type"::"G/L Account":
                            FinanceAccRec.GET("Credit Account No.");
                        "Credit Acc. Type"::Customer:
                            CustomerAccRec.GET("Credit Account No.");
                        "Credit Acc. Type"::Vendor:
                            VendorRec.GET("Credit Account No.");
                    END;
            end;
        }
        field(5; "Debit Acc. Type"; Enum "Gen. Journal Account Type")
        {
            //OptionMembers = Finance,Customer,Supplier;
        }
        field(6; "Credit Acc. Type"; Enum "Gen. Journal Account Type")
        {
            //OptionMembers = Finance,Customer,Supplier;
        }
        field(7; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
                MODIFY;
            end;
        }
        field(8; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
                MODIFY;
            end;
        }
        field(9; "Transfer Department Code"; Boolean)
        {
            InitValue = true;
        }
        field(10; "Transfer Project Code"; Boolean)
        {
            InitValue = true;
        }
        field(11; "Payslip Text"; Text[35])
        {
            CalcFormula = Lookup("Payroll-E/D Codes."."Payslip Text" WHERE("E/D Code" = FIELD("E/D Code")));
            Description = 'Added by Adams for getting the payslip text';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Posting Group", "E/D Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        EDFileRec: Record "Payroll-E/D Codes.";
        CustomerAccRec: Record Customer;
        FinanceAccRec: Record "G/L Account";
        VendorRec: Record Vendor;
        DimMgt: Codeunit DimensionManagement;


    procedure ValidateShortcutDimCode(FieldNo: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNo, ShortcutDimCode);
        DimMgt.SaveDefaultDim(DATABASE::"Payroll-Posting Group Line.", "Posting Group", FieldNo, ShortcutDimCode);
        MODIFY;
    end;
}

