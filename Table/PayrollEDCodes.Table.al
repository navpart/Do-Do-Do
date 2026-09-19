table 50001 "Payroll-E/D Codes."
{

    fields
    {
        field(1; "E/D Code"; Code[20])
        {
            NotBlank = true;

            trigger OnValidate()
            begin

                "Search Name" := "E/D Code";
                IF ("E/D Code" <> xRec."E/D Code") AND ("E/D Code" <> '') THEN BEGIN

                    PGrp.SETRANGE(PGrp."E/D Code", xRec."E/D Code");
                    IF PGrp.FIND('-') THEN
                        REPEAT
                            //   PGrp.VALIDATE(PGrp."E/D Code","E/D Code");
                            PGrp."E/D Code" := "E/D Code";
                            PGrp.MODIFY(FALSE);
                        UNTIL (PGrp.NEXT = 0);

                    /*
                    EmpGrp.SETRANGE(EmpGrp."E/D Code",xRec."E/D Code");
                    IF EmpGrp.FIND('-') THEN
                     REPEAT
                    //   EmpGrp.VALIDATE(EmpGrp."E/D Code","E/D Code");
                       EmpGrp."E/D Code" := "E/D Code";
                       EmpGrp.MODIFY(TRUE);
                     UNTIL(EmpGrp.NEXT=0);


                    Loans.SETRANGE(Loans."Loan ED",xRec."E/D Code");
                    IF Loans.FIND('-') THEN
                     REPEAT
                    //   Loans.VALIDATE(Loans."Loan ED","E/D Code");
                       Loans."Loan ED" := "E/D Code";
                       Loans.MODIFY(TRUE);
                     UNTIL(Loans.NEXT=0);
                    */

                END;

                EVALUATE("Sequence No", "E/D Code");
                EVALUATE("Wages Sequence", "E/D Code");

            end;
        }
        field(2; "Search Name"; Code[20])
        {
        }
        field(3; "Payslip Text"; Text[35])
        {

            trigger OnValidate()
            begin
                Description := "Payslip Text";
            end;
        }
        field(4; "Payslip appearance"; Option)
        {
            OptionMembers = "Non-zero & Code","Always & Code","Always & Text","Non-zero & Text","Does not appear",Heading,"Always & Text & Special";
        }
        field(6; Units; Text[10])
        {
        }
        field(7; Compute; Code[20])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                IF Compute <> '' THEN
                    IF Compute = "E/D Code" THEN
                        ERROR('An E/D cannot compute itself')
                    ELSE
                        "E/DFileRec".GET(Compute);
            end;
        }
        field(8; "Factor Of"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                IF "Factor Of" <> '' THEN
                    IF "Factor Of" = "E/D Code" THEN
                        ERROR('An E/D cannot be a factor of itself')
                    ELSE
                        "E/DFileRec".GET("Factor Of");
            end;
        }
        field(9; Percentage; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(10; "Add/Subtract"; Option)
        {
            OptionMembers = " ",Add,Subtract;
        }
        field(11; "Table Look Up"; Code[20])
        {
            TableRelation = "Payroll-Lookup Header.";

            trigger OnValidate()
            begin
                IF "Table Look Up" <> '' THEN
                    LookupRec.GET("Table Look Up");
            end;
        }
        field(12; "Edit Amount"; Boolean)
        {
        }
        field(13; "Yes/No Req."; Boolean)
        {
        }
        field(14; "Max. Amount"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(15; "Min. Amount"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(16; Rate; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(17; "Payslip Group ID"; Option)
        {
            OptionMembers = " ","GROSS PAY","TAXABLE PAY","TAX CHARGED","TAX DEDUCTED","TOTAL DEDUCTIONS","NET PAY DUE","TAX FREE PAY","YTD Tax Basis","YTD Tax",TOTAL;
        }
        field(18; "Pos. In Payslip Grp."; Integer)
        {
            MaxValue = 99;
            MinValue = 0;
        }
        field(19; "Reset Next Period"; Boolean)
        {
            InitValue = false;
        }
        field(20; "Rounding Direction"; Option)
        {
            OptionMembers = Nearest,Higher,Lower;
        }
        field(21; "Rounding Precision"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(22; "Payslip Column"; Option)
        {
            InitValue = "1";
            OptionMembers = "1","2","3";
        }
        field(23; Changed; Boolean)
        {
            InitValue = false;
        }
        field(24; "S. Report appearance"; Option)
        {
            InitValue = "Does not appear";
            OptionMembers = "Non-zero & Code","Always & Code","Always & Text","Non-zero & Text","Does not appear",Heading;
        }
        field(25; "Edit Grp. Amount"; Boolean)
        {
            InitValue = false;
        }
        field(26; "Overline Column"; Option)
        {
            InitValue = "None";
            OptionMembers = "None","1","2","3","1-2","2-3","1-3";
        }
        field(27; "Underline Amount"; Option)
        {
            InitValue = "None";
            OptionMembers = "None",Underline,"Double Underline";
        }
        field(28; Description; Text[30])
        {
        }
        field(29; "Loan (Y/N)"; Boolean)
        {
        }
        field(30; "OverTime(Y/N)"; Boolean)
        {
        }
        field(31; "Absent Deduction"; Boolean)
        {
        }
        field(32; "Part of Absent Deduction"; Boolean)
        {
        }
        field(34; "Payslip Print Column"; Option)
        {
            OptionMembers = " ",Postive,Negative,"Total Earning","Total Deduction","Net Earning";
        }
        field(35; "ED Type"; Option)
        {
            Description = 'Added for NSITF Report';
            OptionMembers = " ","NSITF Employee","NSITF Employer","Gross Salary","Pension Employee","Pension Employer","NSITF Gross",NHF,"Net Pay","Other Emoluments","Gross Emolument","Emolument Net","Deduction Emolument","Total Net";
        }
        field(36; "Control Type"; Option)
        {
            OptionMembers = " ",Basic,Absence,"Ordinary Overtime","Special Overtime";
        }
        field(37; Apportionable; Boolean)
        {
            Description = 'Added';
        }
        field(38; "Monthly Variable"; Boolean)
        {
            Description = 'Added for Monthly Variables';
        }
        field(41; Prorate; Boolean)
        {
            Description = 'Added for Prorating';
        }
        field(42; "Variable Unit"; Option)
        {
            OptionMembers = " ",Hours,Days;

            trigger OnValidate()
            begin
                IF NOT "Monthly Variable" THEN "Variable Unit" := 0;
            end;
        }
        field(43; "Employee Specific"; Boolean)
        {
        }
        field(44; "Work Days Dependent"; Boolean)
        {
        }
        field(45; "Sequence No"; Integer)
        {
        }
        field(46; "Wages Sequence"; Integer)
        {
        }
        field(47; "Basic Enquiry"; Boolean)
        {
        }
        field(48; "Basic Enquiry-YTD"; Boolean)
        {
        }
        field(49; "Basic Enquiry-CUM2DATE"; Boolean)
        {
        }
        field(50; "ED Amount"; Decimal)
        {
            CalcFormula = Sum("Payroll-Payslip Lines.".Amount WHERE("Payroll Period" = FIELD("Payroll Period Filter"),
                                                                     "E/D Code" = FIELD("E/D Code"),
                                                                     "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                     "Posting Group" = FIELD("Posting Group Filter")));
            FieldClass = FlowField;
        }
        field(51; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(52; "Payroll Period Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll-Periods.";
        }
        field(53; "Posting Group Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll-Posting Group Header.";
        }
        field(54; "Grade Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll-Posting Group Header.";
        }
        field(55; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(56; "Bold Print"; Boolean)
        {
        }
        field(57; Taxable; Boolean)
        {
            Description = 'Added by sharafadeen for Tax elment in variable pay';
        }
        field(58; "Basic Salary"; Boolean)
        {
        }
        field(100; Totaling; Code[250])
        {
            TableRelation = "Payroll-E/D Codes.";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(50036; "ED Type2"; Option)
        {
            OptionMembers = " ",Basic,"Overtime Weekday","Overtime Weekend","Leave Allowance";
        }
        field(50037; "Up-Front Payment"; Boolean)
        {
        }
        field(50038; "Deduction E/D"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code" WHERE("Up-Front Payment" = CONST(false));
        }
        field(50039; "CC Amount"; Decimal)
        {
            CalcFormula = Sum("Payroll-Payslip Lines.".Amount WHERE("E/D Code" = FIELD("E/D Code"),
                                                                       "E/D Code" = FIELD(FILTER(Totaling)),
                                                                       "Payroll Period" = FIELD("Payroll Period Filter"),
                                                                       "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                       "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                       Grade = FIELD("Grade Filter")));
            FieldClass = FlowField;
        }
        field(50040; "Allow Posting Group"; Boolean)
        {
        }
        field(50041; Hide; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "E/D Code")
        {
            Clustered = true;
        }
        key(Key2; "Search Name")
        {
        }
        key(Key3; "ED Type")
        {
        }
        key(Key4; "Monthly Variable")
        {
        }
        key(Key5; "Payslip Group ID")
        {
        }
        key(Key6; "Loan (Y/N)")
        {
        }
        key(Key7; "Wages Sequence")
        {
        }
        key(Key8; "Sequence No")
        {
        }
    }

    fieldgroups
    {
    }

    var
        "E/DFileRec": Record "Payroll-E/D Codes.";
        LookupRec: Record "Payroll-Lookup Header.";
        PGrp: Record "Payroll-Posting Group Line.";
        EmpGrp: Record "Payroll-Employee Group Lines.";
        Loans: Record "Loan.";
}

