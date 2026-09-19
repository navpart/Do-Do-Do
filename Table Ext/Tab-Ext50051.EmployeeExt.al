tableextension 50051 "Employee Ext" extends "Employee"
{
    fields
    {
        field(50000; "Business Unit"; Code[10])
        {
            TableRelation = "Business Unit";
        }
        field(50001; "Employment Group"; Code[10])
        {
        }
        field(50002; Security; Boolean)
        {
        }
        field(50003; "No.2"; Code[20])
        {
        }
        field(50004; "Bar Code ID"; Code[10])
        {
        }
        field(50013; Bank; Code[20])
        {
            TableRelation = IF ("Mode of payment" = CONST(Bank)) "Payroll-Banks.".Code;
        }
        field(50014; "Bank Account"; Text[30])
        {
        }
        field(50015; "Posting Group"; Code[20])
        {
            TableRelation = "Payroll-Posting Group Header."."Posting Group Code";
        }
        field(50016; "Employee Group"; Code[20])
        {
            TableRelation = "Payroll-Employee Group Header.".Code;
        }
        field(50020; "SAM Number"; Code[20])
        {
            TableRelation = Customer;
        }
        field(50021; "Pay Station"; Code[20])
        {
        }
        field(50022; "P.I.N"; Code[20])
        {
        }
        field(50023; "Mode of payment"; Option)
        {
            OptionMembers = Cash,Cheque,Bank;
        }
        field(50024; "Period Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll-Periods.";
        }
        field(50025; EDAmount; Decimal)
        {
            CalcFormula = Sum("Payroll-Payslip Lines.".Amount WHERE("Payroll Period" = FIELD("Period Filter"),
                                                                      "Employee No" = FIELD("No."),
                                                                      "E/D Code" = FIELD("ED Filter")));
            DecimalPlaces = 0 : 5;
            FieldClass = FlowField;
        }
        field(50026; "ED Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll-E/D Codes.";
        }
        field(50027; Designation; Code[10])
        {
            TableRelation = Designation.Code;

        }
        field(50028; "National ID Number"; Code[20])
        {
        }
        field(50029; "NSITF Number"; Code[20])
        {
        }
        field(50030; "Emolument EDAmount"; Decimal)
        {
            CalcFormula = Sum("Payroll-Payslip Lines.".Amount WHERE("Payroll Period" = FIELD("Period Filter"),
                                                                     "Employee No" = FIELD("No."),
                                                                     "E/D Code" = FIELD("ED Filter"),
                                                                     "ED Type" = FIELD("ED Type Filter")));
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50031; "ED Type Filter"; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = " ","NSITF Employee","NSITF Employer","Gross Salary","Pension Employee","Pension Employer","NSITF Gross",NHF,"Net Pay","Other Emoluments","Gross Emolument","Emolument Net","Deduction Emolument";
            TableRelation = "Payroll-E/D Codes."."ED Type" WHERE("ED Type" = FILTER('Other Emoluments|Gross Emolument|Emolument Net|Deduction Emolument'));
        }
        field(50034; "Acct. type"; Option)
        {
            OptionMembers = ,Finance,Customer,Supplier;
        }
        field(50035; "Acct. No"; Code[20])
        {

        }
        field(50037; "No of Days"; Integer)
        {

        }
        field(50039; "No2."; Code[20])
        {
        }
        field(50040; "NPF Number"; Code[20])
        {
        }
        field(50041; "NHF Number"; Code[20])
        {
        }
        field(50071; Blocked; Boolean)
        {
        }
        field(50073; "Modified By"; Code[10])
        {
            Editable = false;
        }
        field(50074; "Pension Scheme"; Boolean)
        {
        }
        field(50075; "Work Status"; Code[10])
        {

        }
        field(50076; Class; Code[10])
        {
        }
        field(50077; "Overall Medical Cost"; Decimal)
        {

        }
        field(50078; "Hospital Cost"; Decimal)
        {

        }
        field(50079; "Clinic Cost"; Decimal)
        {

        }
        field(50080; "Medical Reimbursed Cost"; Decimal)
        {

        }
        field(50084; "Medical Trans Type Filter"; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = " ",C,R,H;
        }
        field(50085; "Sam No."; Code[10])
        {

        }
        field(50100; "Place of Birth"; Text[30])
        {
        }
        field(50101; "Leave Type Filter"; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = PLAN,ACTUAL;
        }
        field(50102; "Leave Days Taken"; Integer)
        {
            BlankZero = true;
            /*  CalcFormula = Count("Leave Roster" WHERE (Employee No=FIELD(No.),
                                                       LeaveDate=FIELD(Date Filter),
                                                       Entry Type=CONST(2),
                                                       Business Unit Code=FIELD(Business Unit),
                                                       Global Dimension 1 Code=FIELD(Global Dimension 1 Filter),
                                                       Global Dimension 2 Code=FIELD(Global Dimension 2 Filter)));
             FieldClass = FlowField; */
        }
        field(50103; "Leave Category Filter"; Code[50])
        {
            FieldClass = FlowFilter;
            TableRelation = "Leave Categories".Code;
        }
        field(50104; "Leave Days"; Integer)
        {
            BlankZero = true;
            CalcFormula = Count("Leave Roster" WHERE("Employee No" = FIELD("No."),
                                                       LeaveDate = FIELD("Date Filter"),
                                                       "Entry Type" = FIELD("Leave Type Filter"),
                                                       "Business Unit Code" = FIELD("Business Unit"),
                                                       "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                       "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter")));
            FieldClass = FlowField;
        }
        field(50105; "Region Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Business Unit";
        }
        field(50106; "Training Cost"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Course Attendance".Cost WHERE("Employee No" = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50107; "Course Filter"; Code[30])
        {
        }
        field(50108; "Scholarship Cost"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Scholarship Payment".Amount WHERE("Employee No" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50109; "Hospital Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = Vendor."No." WHERE(Hospital = CONST(true));
        }
        field(50110; "Beneficiary Filter"; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = " ",Dependent,Self;
        }
        field(50111; Sam; Boolean)
        {
            trigger OnValidate()
            begin

                /*   IF NOT(Sam) AND (xRec.Sam) THEN
                    IF CONFIRM('Do you want to Remove Sam Account for %1',TRUE,FullName) THEN
                      BEGIN
                        IF CustRec.GET("No.") THEN
                          BEGIN
                            CustRec.CALCFIELDS(CustRec.Balance);
                            SamBalance := CustRec.Balance;
                            IF (SamBalance = 0)THEN
                              BEGIN
                                "SAM Number" := '';
                                MODIFY;
                                CustRec.DELETE;
                                CustLdgRec.SETRANGE(CustLdgRec."Customer No.","No.");
                                CustLdgRec.DELETEALL;
                                MESSAGE('Sam Account for %1 has been Deleted',FullName);
                              END
                            ELSE
                              ERROR('%1 has a Balance of %2 in his account\\' +
                                    'This Balance MUST be ZERO before\' +
                                    'you can delete his Sam Account',FullName,FORMAT(SamBalance));
                          END;
                      END
                    ELSE
                      Sam := TRUE; */
            end;
        }
        field(50112; State; Code[30])
        {

        }
        field(50113; "Annual Tax Freepay"; Decimal)
        {
        }
        field(50114; Manager; Boolean)
        {
            Editable = false;
        }
        field(50115; Married; Boolean)
        {
        }
        field(50116; "Tax Paid YTD B/F"; Decimal)
        {
        }
        field(50117; "Gross Taxable YTD B/F"; Decimal)
        {
        }
        field(50118; "Tax FreePay YTD B/F"; Decimal)
        {
        }
        field(50120; EDQuantity; Decimal)
        {
            CalcFormula = Sum("Payroll-Payslip Lines.".Quantity WHERE("Payroll Period" = FIELD("Period Filter"),
                                                                       "Employee No" = FIELD("No."),
                                                                       "E/D Code" = FIELD("ED Filter")));
            DecimalPlaces = 0 : 5;
            FieldClass = FlowField;
        }
        field(50121; Grade; Code[15])
        {
        }
        field(50122; "MEdical cost Limit"; Decimal)
        {
        }
        field(50123; "Basic Salary"; Decimal)
        {
        }
        field(50125; "Basic Arreas"; Decimal)
        {
        }
        field(50202; "name 3"; Text[30])
        {
        }
        field(50203; Nation; Text[30])
        {
        }
        field(50205; LGA; Text[30])
        {
        }
        field(50206; Birthdate; Date)
        {
        }
        field(50208; "Marital Status"; Code[10])
        {
        }
        field(50209; Children; Integer)
        {
        }
        field(50210; Dependent; Text[30])
        {
        }
        field(50211; Disabled; Boolean)
        {
        }
        field(50212; "Date Appointed"; Date)
        {
        }
        field(50213; "Date Confirmed"; Date)
        {
        }
        field(50214; Insured; Decimal)
        {
        }
        field(50215; NOK; Text[30])
        {
        }
        field(50216; "Next of Address"; Text[30])
        {
        }
        field(50217; Relation; Text[30])
        {
        }
        field(50218; Rank; Text[30])
        {
        }
        field(50219; Experience; Text[30])
        {
        }
        field(50220; "From Date"; Date)
        {
        }
        field(50221; "To Date"; Date)
        {
        }
        field(50222; "Last Salary"; Decimal)
        {
        }
        field(50225; "Designation(DOS)"; Code[30])
        {
        }
        field(60000; "State of Origin"; Code[10])
        {

        }
        field(60001; "Yearly Furniture Allowance"; Decimal)
        {
        }
        field(60002; "Yearly Housing Allowance"; Decimal)
        {
        }
        field(60003; "Yearly A/C Allowance"; Decimal)
        {
        }
        field(60004; "Basic Pay"; Decimal)
        {
        }
        field(60005; "Employee Emolument Group"; Code[20])
        {
            //TableRelation = "Payroll-Emolument Header".Code;
        }
        field(60006; "Employee Category"; Option)
        {
            OptionCaption = 'Staff,Casual,Contract,Industrial Attachee,Temporary';
            OptionMembers = Staff,Casual,Contract,"Industrial Attachee","Temporary";
        }
        field(60007; "Present Grade App. Date"; Date)
        {
        }
        field(60008; "Job Goals & Key Results"; Text[50])
        {
        }
        field(60009; "Target  Date"; Date)
        {
        }
        field(60010; Remarks; Text[50])
        {
        }
        field(60011; Exceeds; Option)
        {
            OptionCaption = ' ,10,9,8,7,6,5,4,3,2,1,0';
            OptionMembers = " ","10","9","8","7","6","5","4","3","2","1","0";
        }
        field(60012; Meets; Option)
        {
            OptionCaption = ' ,7,6,5,4,3,2,1,0';
            OptionMembers = " ","7","6","5","4","3","2","1","0";
        }
        field(60013; "Average"; Option)
        {
            OptionCaption = ' ,5,4,3,2,1,0';
            OptionMembers = " ","5","4","3","2","1","0";
        }
        field(60014; Below; Option)
        {
            OptionCaption = ' ,3,2,1,0';
            OptionMembers = " ","3","2","1","0";
        }
        field(60015; Poor; Option)
        {
            OptionCaption = ' ,1,0';
            OptionMembers = " ","1","0";
        }
        field(60016; "Possible Max Score"; Integer)
        {
        }
        field(60017; "Actual Score"; Integer)
        {
        }
        field(60018; "% Score"; Integer)
        {
        }
        field(60021; Good; Integer)
        {
        }
        field(60024; "Training Attended"; Code[10])
        {
        }
        field(60025; "Educational Achievements"; Code[10])
        {
        }
        field(60027; Qualification; Code[10])
        {
        }
        field(60028; Date; Date)
        {
        }
        field(60029; "H.O.D Approval"; Boolean)
        {
        }
        field(60030; "Send For H.O.D Apprv."; Boolean)
        {

            trigger OnValidate()
            begin
                IF UserRec.GET(USERID) THEN BEGIN
                    Sender := UserRec."Full Name";
                    TESTFIELD("No.");
                    TESTFIELD("Job Goals & Key Results");

                END;
            end;
        }
        field(60031; "Present Grade & Salary"; Text[30])
        {
        }
        field(60032; "Appraisal From"; Date)
        {
        }
        field(60033; "Appraisal To"; Date)
        {
        }
        field(60034; "Set Target/ Task"; Text[30])
        {
        }
        field(60035; "Code"; Code[20])
        {
            TableRelation = "Behavioral Attribute";
            trigger OnValidate()
            begin
                //IF BehAtt.GET(Code) THEN
                //Attribute := BehAtt.Attribute;
            end;
        }
        field(60036; Attribute; Text[250])
        {
        }
        field(60037; "Rating 1"; Option)
        {
            OptionCaption = ' ,15,14';
            OptionMembers = " ","15","14";
        }
        field(60038; "Rating 2"; Option)
        {
            OptionCaption = ' ,15,14';
            OptionMembers = " ","15","14";
        }
        field(60039; "Rating 3"; Option)
        {
            OptionCaption = ' ,15,14';
            OptionMembers = " ","15","14";
        }
        field(60040; "Rating 4"; Option)
        {
            OptionCaption = ' ,15,14';
            OptionMembers = " ","15","14";
        }
        field(60041; Appraiser; Code[10])
        {
        }
        field(60042; Appraisee; Code[10])
        {
        }
        field(60043; Excellent; Boolean)
        {
        }
        field(60044; "Very Good"; Boolean)
        {
        }
        field(60046; Weak; Boolean)
        {
        }
        field(60047; "Good."; Boolean)
        {
        }
        field(60048; "Poor."; Boolean)
        {
        }
        field(60049; "Curriculum Vitae"; BLOB)
        {
        }
        field(60051; "Send to H.O.D"; Code[30])
        {
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                IF UserRec.GET("Send to H.O.D") THEN
                    "H.O.D." := UserRec."Full Name";
            end;
        }
        field(60052; "H.O.D."; Code[250])
        {
        }
        field(60053; Sender; Text[250])
        {
        }
        field(60054; "Attendant Mandatory"; Boolean)
        {
        }
        field(60055; "Total Reimbursed Cost"; Decimal)
        {
            BlankZero = true;
            /* CalcFormula = Sum("Medical Record".Amount WHERE (Employee No=FIELD(No.),
                                                             Transaction Date=FIELD(Date Filter),
                                                             Beneficiary=FIELD(Beneficiary Filter)));
            Editable = false;
            FieldClass = FlowField; */
        }
        field(60056; "Pool Car"; Boolean)
        {
        }
        field(60057; "Security Officer"; Boolean)
        {
        }
        field(60058; "Leave Grade"; Option)
        {
            OptionCaption = ',HOD,Manager,Junior staff - Deputy Manager,Branch,HOD1,MD OFFICE,FG';
            OptionMembers = ,HOD,Manager,"Junior staff - Deputy Manager",Branch,HOD1,"MD OFFICE",FG;
        }
        field(60059; "Employment Month"; Text[30])
        {
        }
        field(60060; "Annual Leave Duration"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
    }

    keys
    {
        Key(ExtKey1; Bank)
        {

        }
        key(ExtKey2; "Global Dimension 1 Code", "Global Dimension 2 Code")
        {

        }
        key(ExtKey3; "Posting Group")
        {

        }
    }
    var
        UserRec: Record User;
        Employee: Record Employee;


    procedure GetBasic(EmpNo: Code[10]): Decimal

    begin
        /*  Employee.RESET;
         EDRec.SETRANGE(EDRec."Control Type",EDRec."Control Type"::Basic);
         EDRec.FIND('-');
         BasicEDCode := EDRec."E/D Code";
         Employee.GET(EmpNo);
         EmpGrpCode := Employee."Employee Group";


         GrpLinesRec.SETRANGE(GrpLinesRec."Employee Group",EmpGrpCode);
         GrpLinesRec.SETRANGE(GrpLinesRec."E/D Code",BasicEDCode);
         IF GrpLinesRec.FIND('-') THEN
           EXIT(GrpLinesRec."Default Amount")
         ELSE
           BEGIN

             Employee.RESET;
             EDRec.SETRANGE(EDRec."Control Type",EDRec."Control Type"::Basic);
             EDRec.FIND('+');
             BasicEDCode := EDRec."E/D Code";
             Employee.GET(EmpNo);
             EmpGrpCode := Employee."Employee Group";

             GrpLinesRec.SETRANGE(GrpLinesRec."Employee Group",EmpGrpCode);
             GrpLinesRec.SETRANGE(GrpLinesRec."E/D Code",BasicEDCode);
             IF GrpLinesRec.FIND('+') THEN
               EXIT(GrpLinesRec."Default Amount")
             ELSE
               EXIT(0);

           END;

         EXIT(0); */
    end;

    procedure GetFullName(EmpNo: Code[10]): Text[100]
    begin


        IF Employee.GET(EmpNo) THEN BEGIN
            IF Employee."Middle Name" = '' THEN
                EXIT(Employee."First Name" + ' ' + Employee."Last Name")
            ELSE
                EXIT(Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name");
        END
        ELSE
            EXIT('');

    end;



}
