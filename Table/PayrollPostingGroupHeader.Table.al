table 50011 "Payroll-Posting Group Header."
{
    fields
    {
        field(1; "Posting Group Code"; Code[20])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                IF (1 < CursorPos) AND (CursorPos < MAXSTRLEN("Search Name")) THEN BEGIN
                    "Search Name" := DELCHR(COPYSTR("Posting Group Code", CursorPos), '<>');
                    "Search Name" := PADSTR("Search Name" + ' ' + DELCHR(COPYSTR("Posting Group Code", 1, CursorPos - 1), '<>'), MAXSTRLEN(
                  "Search Name"));
                END
                ELSE
                    "Search Name" := "Posting Group Code";
                "Search Name" := DELCHR("Search Name", '<');

                //"Group Range" := "Posting Group Code" + '01..' + "Posting Group Code" + '18';
            end;
        }
        field(2; "Search Name"; Code[20])
        {
        }
        field(3; Description; Text[30])
        {
        }
        field(50005; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50006; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50007; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50008; "Budgeted Count"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("MP Budget Entry"."Employee Count" WHERE("Employee Grp" = FIELD("Posting Group Code"),
                                                                        "Budget Name" = FIELD("Budget Filter"),
                                                                        "Business Unit Code" = FIELD("Region Filter"),
                                                                        "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                        "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                        Date = FIELD("Date Filter")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }
        field(50010; "Budget Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "MP Budget Name";
        }
        field(50011; "Region Filter"; Code[10])
        {
            FieldClass = FlowFilter;

        }
        field(52000; "Group Range"; Code[10])
        {
        }
        field(52001; Management; Boolean)
        {
        }
        field(52002; "Annual Leave Days"; Integer)
        {
        }
        field(53003; "Period Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll-Periods.";
        }
    }

    keys
    {
        key(Key1; "Posting Group Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        /*
        { Confirm }
        IF NOT CONFIRM ('All entries for this booking group '+
                        'will be deleted!'+
                        'Proceed with Deletion?    ')
        THEN
          ERROR ('Nothing was deleted');
        
        { Lock 'parent' and 'child' files}
         LOCKTABLE( FALSE);
         BookGrpLinesRec.LOCKTABLE( FALSE);
        
        { First delete the detail lines }
         BookGrpLinesRec.SETRANGE("Posting Group", "Posting Group Code");
         BookGrpLinesRec.DELETEALL;
        
        { Delete the 'parent record'}
         DELETE;
        
        { Disable the locking effect }
        COMMIT ;
        */

    end;

    var
        BookGrpLinesRec: Record "Payroll-Posting Group Line.";
        CursorPos: Integer;


    procedure SetupNewPGrp(OldEmpPGrp: Record "Payroll-Posting Group Header."; BelowOldEmpPGrp: Boolean)
    var
        OldEmpPGrp2: Record "Payroll-Posting Group Header.";
    begin
        IF NOT BelowOldEmpPGrp THEN BEGIN
            OldEmpPGrp2 := OldEmpPGrp;
            OldEmpPGrp.COPY(Rec);
            OldEmpPGrp := OldEmpPGrp2;
            IF NOT OldEmpPGrp.FIND('<') THEN
                OldEmpPGrp.INIT;
        END;


    end;
}

