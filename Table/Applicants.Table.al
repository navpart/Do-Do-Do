table 50072 Applicants
{
    DataCaptionFields = "No.", Surname, "First Name", "Middle Name";
    /* DrillDownPageID = 50048;
    LookupPageID = 50048; */

    fields
    {
        field(1; "No."; Code[20])
        {

            trigger OnValidate()
            begin
                /* IF "No." <> xRec."No." THEN BEGIN
                    HumanResSetup.GET;
                    NoSeriesMgt.TestManual(HumanResSetup."Application Nos.");
                    "No. Series" := '';
                END; */
            end;
        }
        field(2; Surname; Text[30])
        {
        }
        field(3; "First Name"; Text[30])
        {

            trigger OnValidate()
            begin
                IF ("Search Name" = '') THEN
                    "Search Name" := "First Name";
            end;
        }
        field(4; "Middle Name"; Text[30])
        {
        }
        field(5; Initials; Text[30])
        {

            trigger OnValidate()
            begin
                IF ("Search Name" = UPPERCASE(xRec.Initials)) OR ("Search Name" = '') THEN
                    "Search Name" := Initials;
            end;
        }
        field(7; "Search Name"; Code[30])
        {
        }
        field(8; Address; Text[30])
        {
        }
        field(9; "Address 2"; Text[30])
        {
        }
        field(10; City; Text[30])
        {
        }
        field(11; "Post Code"; Code[20])
        {
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                /*  IF PostCode.GET("Post Code") THEN
                     City := PostCode.City; */
            end;
        }
        field(12; County; Text[30])
        {
        }
        field(13; "Phone No."; Text[30])
        {
        }
        field(14; "Mobile Phone No."; Text[30])
        {
        }
        field(15; "E-Mail"; Text[80])
        {
        }
        field(16; "Alt. Address Code"; Code[10])
        {
            TableRelation = "Alternative Address".Code WHERE("Employee No." = FIELD("No."));
        }
        field(17; "Alt. Address Start Date"; Date)
        {
        }
        field(18; "Alt. Address End Date"; Date)
        {
        }
        field(19; Picture; BLOB)
        {
            SubType = Bitmap;
        }
        field(20; "Birth Date"; Date)
        {
        }
        field(24; Sex; Option)
        {
            OptionMembers = Male,Female;
        }
        field(25; "Country Code"; Code[10])
        {
            TableRelation = "Country/Region";
        }

        field(31; "Application Status"; Option)
        {
            OptionMembers = " ","Under Interview","Short Listed",Accepted,Rejected;

        }
        field(36; "Global Dimension 1 Code"; Code[20])
        {

        }
        field(37; "Global Dimension 2 Code"; Code[20])
        {
        }
        field(39; Comment; Boolean)
        {

        }
        field(40; "Last Date Modified"; Date)
        {
            Editable = false;
        }
        field(48; Pager; Text[30])
        {
        }
        field(49; "Fax No."; Text[30])
        {
        }
        field(50; "Company E-Mail"; Text[80])
        {
        }
        field(51; Title; Text[30])
        {
        }
        field(52; "Salespers./Purch. Code"; Code[10])
        {
            TableRelation = "Salesperson/Purchaser";
        }
        field(53; "No. Series"; Code[10])
        {
            Editable = false;
            TableRelation = "No. Series";
        }
        field(50000; "Region Code"; Code[10])
        {
            TableRelation = "Business Unit".Code;
        }
        field(50015; "Posting Group"; Code[20])
        {
            TableRelation = "Payroll-Posting Group Header."."Posting Group Code";
        }
        field(50016; "Employee Group"; Code[20])
        {

        }
        field(50071; Blocked; Boolean)
        {
        }
        field(50073; "Modified By"; Code[10])
        {
            Editable = false;
        }
        field(50076; Class; Code[10])
        {
            TableRelation = TWC."Distributors Code";
        }
        field(50086; "Date Offer Made"; Date)
        {
        }
        field(50088; "Position Applied For"; Code[10])
        {

        }
        field(50089; "Position Description"; Text[30])
        {
            Editable = false;
        }
        field(50092; "Agreed Start Date"; Date)
        {
        }
        field(50093; "Assigned Employee No"; Code[10])
        {

            trigger OnValidate()
            begin
                IF "Assigned Employee No" <> '' THEN
                    "Application Status" := "Application Status"::Accepted
                ELSE
                    IF "Application Status" = "Application Status"::Accepted THEN
                        "Application Status" := "Application Status"::" ";
            end;
        }
        field(50094; "Date Accepted/Rejected"; Date)
        {
        }
        field(50095; "Next of Kin"; Text[30])
        {

        }
        field(50096; Staffed; Boolean)
        {
            InitValue = false;
        }
        field(50097; "Last Renumeration"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;
        }
        field(53000; "First Interview"; Boolean)
        {
        }
        field(53001; "First Interview Date"; Date)
        {
        }
        field(53002; "First Interview Result"; Decimal)
        {
            DecimalPlaces = 1 : 1;

            trigger OnValidate()
            begin
                "First Interview Maximum" := "First Interview Result";
            end;
        }
        field(53003; "Second Interview"; Boolean)
        {
        }
        field(53004; "Second Interview Date"; Date)
        {
        }
        field(53005; "Second Interview Result"; Decimal)
        {
            DecimalPlaces = 1 : 1;

            trigger OnValidate()
            begin
                "Second Interview Maximum" := "Second Interview Result";
            end;
        }
        field(53006; "Final Interview"; Boolean)
        {
        }
        field(53007; "Final Interview Date"; Date)
        {
        }
        field(53008; "Final Interview Result"; Decimal)
        {
            DecimalPlaces = 1 : 1;

            trigger OnValidate()
            begin
                "Final Interview Maximum" := "Final Interview Result";
            end;
        }
        field(53009; "First Interview Maximum"; Decimal)
        {
        }
        field(53010; "Second Interview Maximum"; Decimal)
        {

            trigger OnValidate()
            begin
                IF ("Second Interview Result" > "Second Interview Maximum") THEN
                    ERROR('Maximum Score attainable in this interview is %1', FORMAT("Second Interview Maximum"));
            end;
        }
        field(53011; "Final Interview Maximum"; Decimal)
        {

            trigger OnValidate()
            begin
                IF ("Final Interview Result" > "Final Interview Maximum") THEN
                    ERROR('Maximum Score attainable in this interview is %1', FORMAT("Final Interview Maximum"));
            end;
        }
        field(53012; "Advert Ref No"; Code[20])
        {
        }

    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; Surname, "First Name", "Middle Name")
        {
        }

    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin

    end;

    trigger OnInsert()
    begin
        IF "No." = '' THEN BEGIN
            HumanResSetup.GET;
            HumanResSetup.TESTFIELD("Application Nos.");
            //NoSeriesMgt.InitSeries(HumanResSetup."Application Nos.",xRec."No. Series",0D,"No.","No. Series");
        END;
    end;

    trigger OnModify()
    begin


    end;

    trigger OnRename()
    begin
        //"Last Date Modified" := TODAY;
    end;

    var
        approved: Boolean;
        //approv: Record "2000000001";
        HumanResSetup: Record "Human Resources Setup";
        //ApplicantRec: Record "50072";
        Res: Record Resource;
        PostCode: Record "Post Code";
        AlternativeAddr: Record "Alternative Address";
        EmployeeQualification: Record "Employee Qualification";
        Relative: Record Relative;
        EmployeeAbsence: Record "Employee Absence";
        MiscArticleInformation: Record "Misc. Article Information";
        ConfidentialInformation: Record "Confidential Information";
        HumanResComment: Record "Human Resource Comment Line";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        NoSeriesMgt: Codeunit "No. Series";
        EmployeeResUpdate: Codeunit "Employee/Resource Update";
        EmployeeSalespersonUpdate: Codeunit "Employee/Salesperson Update";
        DepartRec: Record "Dimension Value";
        "day Employed": Integer;
        EmplContract: Record "Employment Contract";
        //Applicantsr: Record "50072";
        InterCount: Integer;
        TotalScore: Decimal;
        TotalMax: Decimal;
        AllAvg: Decimal;
        RegRec: Record "Business Unit";
        BCRec: Record "Dimension Value";
        CCRec: Record "Dimension Value";
        DimMgt: codeunit "No. Series";

    /*
    procedure AssistEdit(OldApplicant: Record "50072"): Boolean
    begin
        WITH ApplicantRec DO BEGIN
          ApplicantRec := Rec;
          HumanResSetup.GET;
          HumanResSetup.TESTFIELD("Application Nos.");
          IF NoSeriesMgt.SelectSeries(HumanResSetup."Application Nos.",OldApplicant."No. Series","No. Series") THEN BEGIN
            HumanResSetup.GET;
            HumanResSetup.TESTFIELD("Application Nos.");
            NoSeriesMgt.SetSeries("No.");
            Rec := ApplicantRec;
            EXIT(TRUE);
          END;
        END;
    end;

    procedure FullName(): Text[100]
    begin
        IF "Middle Name" = '' THEN
          EXIT(Surname + ' ' + "First Name")
        ELSE
          EXIT(Surname + ' ' + "First Name" + ' ' + "Middle Name");
    end;

    
    procedure ComputeAverage(): Decimal
    begin
        
        InterCount := 0;
        TotalMax := 0;
        TotalScore := "First Interview Result" + "Second Interview Result" + "Final Interview Result";
        IF ("First Interview Result"<>0) THEN
          BEGIN
            VALIDATE("First Interview Maximum");
            IF ("First Interview Result" > "First Interview Maximum") THEN
              BEGIN
                MESSAGE('Maximum Score attainable in 1st interview is %1',FORMAT("First Interview Maximum"));
                EXIT(0);
              END;
            TotalMax := TotalMax + "First Interview Maximum";
          END;
        IF ("Second Interview Result"<>0) THEN
          BEGIN
            VALIDATE("Second Interview Maximum");
            IF ("Second Interview Result" > "Second Interview Maximum") THEN
              BEGIN
                MESSAGE('Maximum Score attainable in 2nd interview is %1',FORMAT("Second Interview Maximum"));
                EXIT(0);
              END;
            TotalMax := TotalMax + "Second Interview Maximum";
          END;

        IF ("Final Interview Result"<>0) THEN
          BEGIN
            VALIDATE("Final Interview Maximum");
            IF ("Final Interview Result" > "Final Interview Maximum") THEN
              BEGIN
                MESSAGE('Maximum Score attainable in 3rd interview is %1',FORMAT("Final Interview Maximum"));
                EXIT(0);
              END;
            TotalMax := TotalMax + "Final Interview Maximum";
          END;

        IF (TotalMax<>0) THEN
          AllAvg := (TotalScore/(TotalMax))*100
        ELSE
          AllAvg := 0;

        EXIT(AllAvg);
    end;

       procedure ValidateShortcutDimCode(FieldNo: Integer;var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNo,ShortcutDimCode);
        DimMgt.SaveDefaultDim(DATABASE::Applicants,"No.",FieldNo,ShortcutDimCode);
        MODIFY;
    end; 
    */
}

