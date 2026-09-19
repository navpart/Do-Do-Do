table 50007 "Payroll-Payslip Header."
{
    // Created           : FTN, 8/3/93
    // File name         : KI03b P.Roll Header
    // Comments          : Just to test the Header card that is intended to be used
    //                     as the main user interface for entering periodic employee
    //                     payroll details.
    // File details      : Primary Key is;
    //                      Payroll Period, Employee No
    //                   : Relations;
    //                      To Employee files
    // Display fields are: Period start, Period end and Period name, Employee name

    DataCaptionFields = "Payroll Period", "Employee No", "Employee Name";

    fields
    {
        field(1; "Payroll Period"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Payroll-Periods.";

            trigger OnValidate()
            begin
                PayPeriodRec.GET("Payroll Period");
                BEGIN
                    "Period Start" := PayPeriodRec."Start Date";
                    "Period End" := PayPeriodRec."End Date";
                    "Period Name" := PayPeriodRec.Name;
                END;
            end;
        }
        field(2; "Period Start"; Date)
        {
            Editable = false;
        }
        field(3; "Period End"; Date)
        {
            Editable = false;
        }
        field(4; "Period Name"; Text[40])
        {
            Editable = false;
        }
        field(5; Company; Code[20])
        {
            Editable = false;
        }
        field(7; Section; Code[20])
        {
            Editable = false;
        }
        field(8; "Employee No"; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                EmployeeRec.GET("Employee No");
                BEGIN
                    "Employee Name" := EmployeeRec.FullName;
                    "Global Dimension 1 Code" := EmployeeRec."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := EmployeeRec."Global Dimension 2 Code";
                    //  Company := EmployeeRec.Company;
                    //  Section := EmployeeRec.Section;
                    "Customer Number" := EmployeeRec."SAM Number";
                    Designation := EmployeeRec.Designation;

                    "Posting Group" := EmployeeRec."Posting Group";  // Added by Adams
                    Grade := EmployeeRec.Grade;
                END;
            end;
        }
        field(9; "Employee Name"; Text[40])
        {
            Editable = false;
        }
        field(11; Closed; Boolean)
        {
            Editable = false;
        }
        field(12; "Gross Pay"; Decimal)
        {
            Editable = false;
        }
        field(13; "Tax Charged"; Decimal)
        {
            Editable = false;
        }
        field(14; "Tax Deducted"; Decimal)
        {
            CalcFormula = Sum("Payroll-Payslip Lines.".Amount WHERE("Payroll Period" = FIELD("Payroll Period"),
                                                                     "Employee No" = FIELD("Employee No"),
                                                                     "Payslip Group ID" = FILTER('TAX DEDUCTED')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Taxable Pay"; Decimal)
        {
            CalcFormula = Sum("Payroll-Payslip Lines.".Amount WHERE("Payroll Period" = FIELD("Payroll Period"),
                                                                     "Employee No" = FIELD("Employee No"),
                                                                     "Payslip Group ID" = FILTER('TAXABLE PAY')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Total Deductions"; Decimal)
        {
            CalcFormula = Sum("Payroll-Payslip Lines.".Amount WHERE("Payroll Period" = FIELD("Payroll Period"),
                                                                     "Employee No" = FIELD("Employee No"),
                                                                     "Payslip Group ID" = FILTER('TOTAL DEDUCTIONS')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Net Pay Due"; Decimal)
        {
            CalcFormula = Sum("Payroll-Payslip Lines.".Amount WHERE("Payroll Period" = FIELD("Payroll Period"),
                                                                     "Employee No" = FIELD("Employee No"),
                                                                     "Payslip Group ID" = FILTER('NET PAY DUE')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Total Relief"; Decimal)
        {
            CalcFormula = Sum("Payroll-Payslip Lines.".Amount WHERE("Payroll Period" = FIELD("Payroll Period"),
                                                                     "Employee No" = FIELD("Employee No"),
                                                                     "Payslip Group ID" = FILTER('TAX FREE PAY')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(19; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
                MODIFY;
            end;
        }
        field(20; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
                MODIFY;
            end;
        }
        field(21; "Customer Number"; Code[20])
        {
            TableRelation = Customer;
        }
        field(22; Designation; Text[30])
        {
        }
        field(23; "ED Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(24; "ED Value"; Decimal)
        {
            CalcFormula = Sum("Payroll-Payslip Lines.".Amount WHERE("Payroll Period" = FIELD("Payroll Period"),
                                                                     "Employee No" = FIELD("Employee No"),
                                                                     "E/D Code" = FIELD("ED Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(25; "Posting Group"; Code[20])
        {
            Description = 'Added by Adams for User Access';
            TableRelation = "Payroll-Posting Group Header.";
        }
        field(50121; Grade; Code[15])
        {
            TableRelation = "Employee Grade";
        }
        field(50122; "End Date"; Date)
        {
        }
        field(50123; "Period Code"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Payroll Period", "Employee No")
        {
            Clustered = true;
        }
        key(Key2; "Employee No", "Payroll Period")
        {
        }
        key(Key3; Company, "Employee No", "Payroll Period")
        {
        }
        key(Key4; "Posting Group")
        {
        }
        key(Key5; "Payroll Period", "Global Dimension 1 Code", "Global Dimension 2 Code")
        {
        }
        key(Key6; "Posting Group", "Global Dimension 1 Code", "Global Dimension 2 Code", Grade)
        {
        }
        key(Key7; "Global Dimension 1 Code", "Global Dimension 2 Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        IF Closed THEN
            ERROR('Entries for this Employee/Period closed. Nothing can be deleted');

        //PaySetup.GET;                               //  Added by Adam
        //IF PaySetup."Confirm Payslip Deletion" THEN //  for delete confirmation
        //{ Confirm }
        //IF NOT CONFIRM ('All entries for this employee in this period '+
        //                'will be deleted!'+
        //                'Proceed with Deletion?    ')
        //THEN
        //  ERROR ('Nothing was deleted');

        /* Lock 'parent' and 'child' files*/
        // LOCKTABLE( FALSE);
        // PayLinesRec.LOCKTABLE( FALSE);

        /* First delete the detail lines */
        PayLinesRec.SETRANGE("Payroll Period", "Payroll Period");
        PayLinesRec.SETRANGE("Employee No", "Employee No");
        PayLinesRec.DELETEALL;

        /* Delete the 'parent record'*/
        DELETE;

        /* Disable the locking effect */
        COMMIT;

    end;

    trigger OnInsert()
    begin

        /* Create the payroll entry lines.
          The entries are copied from the employee group entry lines.
        */

        /* Get the employee group number/code */
        EmployeeRec.GET("Employee No");

        /* Delimit the Employee group lines appropriately */
        EmpGrpLinesRec.INIT;
        EmpGrpLinesRec."Employee Group" := EmployeeRec."Employee Group";
        EmpGrpLinesRec."E/D Code" := '';
        EmpGrpLinesRec.SETRANGE("Employee Group", EmployeeRec."Employee Group");
        IF EmpGrpLinesRec.COUNT = 0 THEN BEGIN
            EmpGrpLinesRec.RESET;
            EXIT
        END;

        /* Lock the Payroll Lines Entry file */
        // PayLinesRec.LOCKTABLE(FALSE);

        /* Transfer the E/D lines from Employe Group lines to Payroll Lines */
        EmpGrpLinesRec.FIND('>');
        BEGIN
            PayLinesRec."Payroll Period" := "Payroll Period";
            PayLinesRec."Employee No" := "Employee No";
        END;
        WHILE (EmpGrpLinesRec."Employee Group" = EmployeeRec."Employee Group") DO BEGIN
            PayLinesRec.INIT;
            EDFileRec.GET(EmpGrpLinesRec."E/D Code");
            BEGIN
                PayLinesRec."Payslip Group ID" := EDFileRec."Payslip Group ID";
                PayLinesRec."Pos. In Payslip Grp." := EDFileRec."Pos. In Payslip Grp.";
                PayLinesRec."Payslip appearance" := EDFileRec."Payslip appearance";
                PayLinesRec.Units := EDFileRec.Units;
                PayLinesRec.Rate := EDFileRec.Rate;
                PayLinesRec."Overline Column" := EDFileRec."Overline Column";
                PayLinesRec."Underline Amount" := EDFileRec."Underline Amount";
            END;        /* Payslip Grp/Pos */
            BEGIN
                PayLinesRec."E/D Code" := EmpGrpLinesRec."E/D Code";
                PayLinesRec.Units := EmpGrpLinesRec.Units;
                PayLinesRec.Rate := EmpGrpLinesRec.Rate;
                PayLinesRec.Quantity := EmpGrpLinesRec.Quantity;
                PayLinesRec.Flag := EmpGrpLinesRec.Flag;
                PayLinesRec.Amount := EmpGrpLinesRec."Default Amount";
            END;   /* Rate,Units,Amount,... */
            IF BookGrLinesRec.GET(EmployeeRec."Posting Group",
            PayLinesRec."E/D Code") THEN BEGIN
                BEGIN
                    PayLinesRec."Debit Account" := BookGrLinesRec."Debit Account No.";
                    PayLinesRec."Credit Account" := BookGrLinesRec."Credit Account No.";
                    PayLinesRec."Debit Acc. Type" := BookGrLinesRec."Debit Acc. Type";
                    PayLinesRec."Credit Acc. Type" := BookGrLinesRec."Credit Acc. Type";
                    PayLinesRec."Global Dimension 1 Code" := BookGrLinesRec."Global Dimension 1 Code";
                    PayLinesRec."Global Dimension 2 Code" := BookGrLinesRec."Global Dimension 2 Code";
                END; /* Debit/Credit accounts*/
                IF NOT BookGrLinesRec."Transfer Department Code" THEN
                    PayLinesRec."Global Dimension 1 Code" := ''
                ELSE
                    IF PayLinesRec."Global Dimension 1 Code" = '' THEN
                        PayLinesRec."Global Dimension 1 Code" := EmployeeRec."Global Dimension 1 Code";

                IF NOT BookGrLinesRec."Transfer Project Code" THEN
                    PayLinesRec."Global Dimension 2 Code" := ''
                ELSE
                    IF PayLinesRec."Global Dimension 2 Code" = '' THEN
                        PayLinesRec."Global Dimension 2 Code" := EmployeeRec."Global Dimension 2 Code";

                IF BookGrLinesRec."Debit Acc. Type" = BookGrLinesRec."Debit Acc. Type"::Customer THEN
                    IF EmployeeRec."SAM Number" <> '' THEN
                        PayLinesRec."Debit Account" := EmployeeRec."SAM Number";

                IF BookGrLinesRec."Credit Acc. Type" = BookGrLinesRec."Credit Acc. Type"::Customer THEN
                    IF EmployeeRec."SAM Number" <> '' THEN
                        PayLinesRec."Credit Account" := EmployeeRec."SAM Number";
            END;
            PayLinesRec.INSERT;
            IF EmpGrpLinesRec.NEXT = 0 THEN BEGIN
                EmpGrpLinesRec.RESET;
                COMMIT;
                EXIT
            END;
        END;
        COMMIT;

    end;

    var
        PayPeriodRec: Record "Payroll-Periods.";
        CompanyRec: Record "Payroll-Banks.";
        DepartRec: Record "Dimension Value";
        EmployeeRec: Record Employee;
        PayLinesRec: Record "Payroll-Payslip Lines.";
        EmpGrpRec: Record "Payroll-Employee Group Header.";
        EmpGrpLinesRec: Record "Payroll-Employee Group Lines.";
        EDFileRec: Record "Payroll-E/D Codes.";
        BookGrLinesRec: Record "Payroll-Posting Group Line.";
        PaySetup: Record "Payroll Setup.";
        DimMgt: Codeunit DimensionManagement;


    procedure ValidateShortcutDimCode(FieldNo: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNo, ShortcutDimCode);
        DimMgt.SaveDefaultDim(DATABASE::"Payroll-Payslip Header.", "Payroll Period", FieldNo, ShortcutDimCode);
        MODIFY;
    end;
}

