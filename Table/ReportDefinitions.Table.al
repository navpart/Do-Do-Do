table 50020 "Report Definitions"
{

    fields
    {
        field(10; Id; Integer)
        {
        }
        field(20; Title; Text[60])
        {
        }
        field(100; "Column ED 1"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                "Column Text 1" := CaptionOfEd("Column ED 1");
            end;
        }
        field(105; "Formular 1"; Text[100])
        {
            TableRelation = "Payroll-E/D Codes.";
            ValidateTableRelation = false;
        }
        field(110; "Column Text 1"; Text[35])
        {
        }
        field(120; "Column Type 1"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(125; "Column Value Type 1"; Option)
        {
            OptionMembers = Amount,Quantity;
        }
        field(200; "Column ED 2"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                //"Column Text 2" := CaptionOfEd("Column ED 2");
            end;
        }
        field(205; "Formular 2"; Text[100])
        {
            TableRelation = "Payroll-E/D Codes.";
            ValidateTableRelation = false;
        }
        field(210; "Column Text 2"; Text[35])
        {
        }
        field(220; "Column Type 2"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(225; "Column Value Type 2"; Option)
        {
            OptionMembers = Amount,Quantity;
        }
        field(300; "Column ED 3"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                //"Column Text  3" := CaptionOfEd("Column ED 3");
            end;
        }
        field(305; "Formular 3"; Text[100])
        {
            TableRelation = "Payroll-E/D Codes.";
            ValidateTableRelation = false;
        }
        field(310; "Column Text  3"; Text[35])
        {
        }
        field(320; "Column Type 3"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(325; "Column Value Type 3"; Option)
        {
            OptionMembers = Amount,Quantity;
        }
        field(400; "Column ED 4"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                //"Column Text 4" := CaptionOfEd("Column ED 4");
            end;
        }
        field(405; "Formular 4"; Text[100])
        {
            TableRelation = "Payroll-E/D Codes.";
            ValidateTableRelation = false;
        }
        field(410; "Column Text 4"; Text[35])
        {
        }
        field(420; "Column Type 4"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(425; "Column Value Type 4"; Option)
        {
            OptionMembers = Amount,Quantity;
        }
        field(500; "Column ED 5"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                //"Column Text 5" := CaptionOfEd("Column ED 5");
            end;
        }
        field(505; "Formular 5"; Text[100])
        {
            TableRelation = "Payroll-E/D Codes.";
            ValidateTableRelation = false;
        }
        field(510; "Column Text 5"; Text[35])
        {
        }
        field(520; "Column Type 5"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(525; "Column Value Type 5"; Option)
        {
            OptionMembers = Amount,Quantity;
        }
        field(600; "Column ED 6"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                //"Column Text 6" := CaptionOfEd("Column ED 6");
            end;
        }
        field(605; "Formular 6"; Text[100])
        {
            TableRelation = "Payroll-E/D Codes.";
            ValidateTableRelation = false;
        }
        field(610; "Column Text 6"; Text[35])
        {
        }
        field(620; "Column Type 6"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(625; "Column Value Type 6"; Option)
        {
            OptionMembers = Amount,Quantity;
        }
        field(700; "Column ED 7"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                //"Column Text 7" := CaptionOfEd("Column ED 7");
            end;
        }
        field(705; "Formular 7"; Text[100])
        {
            TableRelation = "Payroll-E/D Codes.";
            ValidateTableRelation = false;
        }
        field(710; "Column Text 7"; Text[35])
        {
        }
        field(720; "Column Type 7"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(725; "Column Value Type 7"; Option)
        {
            OptionMembers = Amount,Quantity;
        }
        field(800; "Column ED 8"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                //"Column Text 8" := CaptionOfEd("Column ED 8");
            end;
        }
        field(805; "Formular 8"; Text[100])
        {
            TableRelation = "Payroll-E/D Codes.";
            ValidateTableRelation = false;
        }
        field(810; "Column Text 8"; Text[35])
        {
        }
        field(820; "Column Type 8"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(825; "Column Value Type 8"; Option)
        {
            OptionMembers = Amount,Quantity;
        }
        field(900; "Column ED 9"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                //"Column Text 9" := CaptionOfEd("Column ED 9");
            end;
        }
        field(905; "Formular 9"; Text[100])
        {
            TableRelation = "Payroll-E/D Codes.";
            ValidateTableRelation = false;
        }
        field(910; "Column Text 9"; Text[35])
        {
        }
        field(920; "Column Type 9"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(925; "Column Value Type 9"; Option)
        {
            OptionMembers = Amount,Quantity;
        }
        field(1000; "Column ED 10"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                //"Column Text 10" := CaptionOfEd("Column ED 10");
            end;
        }
        field(1005; "Formular 10"; Text[100])
        {
            TableRelation = "Payroll-E/D Codes.";
            ValidateTableRelation = false;
        }
        field(1010; "Column Text 10"; Text[35])
        {
        }
        field(1020; "Column Type 10"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(1025; "Column Value Type 10"; Option)
        {
            OptionMembers = Amount,Quantity;
        }
        field(1100; "Column ED 11"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                //"Column Text 11" := CaptionOfEd("Column ED 11");
            end;
        }
        field(1105; "Formular 11"; Text[100])
        {
            TableRelation = "Payroll-E/D Codes.";
            ValidateTableRelation = false;
        }
        field(1110; "Column Text 11"; Text[35])
        {
        }
        field(1120; "Column Type 11"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(1125; "Column Value Type 11"; Option)
        {
            OptionMembers = Amount,Quantity;
        }
        field(1200; "Column ED 12"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                //"Column Text 12" := CaptionOfEd("Column ED 12");
            end;
        }
        field(1205; "Formular 12"; Text[100])
        {
            TableRelation = "Payroll-E/D Codes.";
            ValidateTableRelation = false;
        }
        field(1210; "Column Text 12"; Text[35])
        {
        }
        field(1220; "Column Type 12"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(1225; "Column Value Type 12"; Option)
        {
            OptionMembers = Amount,Quantity;
        }
        field(1300; "Column ED 13"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                //"Column Text  13" := CaptionOfEd("Column ED 13");
            end;
        }
        field(1305; "Formular 13"; Text[100])
        {
            TableRelation = "Payroll-E/D Codes.";
            ValidateTableRelation = false;
        }
        field(1310; "Column Text  13"; Text[35])
        {
        }
        field(1320; "Column Type 13"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(1325; "Column Value Type 13"; Option)
        {
            OptionMembers = Amount,Quantity;
        }
        field(1400; "Column ED 14"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                //"Column Text 14" := CaptionOfEd("Column ED 14");
            end;
        }
        field(1405; "Formular 14"; Text[100])
        {
            TableRelation = "Payroll-E/D Codes.";
            ValidateTableRelation = false;
        }
        field(1410; "Column Text 14"; Text[35])
        {
        }
        field(1420; "Column Type 14"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(1425; "Column Value Type 14"; Option)
        {
            OptionMembers = Amount,Quantity;
        }
        field(1500; "Column ED 15"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                //"Column Text 15" := CaptionOfEd("Column ED 15");
            end;
        }
        field(1505; "Formular 15"; Text[100])
        {
            TableRelation = "Payroll-E/D Codes.";
            ValidateTableRelation = false;
        }
        field(1510; "Column Text 15"; Text[35])
        {
        }
        field(1520; "Column Type 15"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(1525; "Column Value Type 15"; Option)
        {
            OptionMembers = Amount,Quantity;
        }
        field(1600; "Column ED 16"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                //"Column Text 16" := CaptionOfEd("Column ED 16");
            end;
        }
        field(1605; "Formular 16"; Text[100])
        {
            TableRelation = "Payroll-E/D Codes.";
            ValidateTableRelation = false;
        }
        field(1610; "Column Text 16"; Text[35])
        {
        }
        field(1620; "Column Type 16"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(1625; "Column Value Type 16"; Option)
        {
            OptionMembers = Amount,Quantity;
        }
        field(1700; "Column ED 17"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                //"Column Text 17" := CaptionOfEd("Column ED 17");
            end;
        }
        field(1705; "Formular 17"; Text[100])
        {
            TableRelation = "Payroll-E/D Codes.";
            ValidateTableRelation = false;
        }
        field(1710; "Column Text 17"; Text[35])
        {
        }
        field(1720; "Column Type 17"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(1725; "Column Value Type 17"; Option)
        {
            OptionMembers = Amount,Quantity;
        }
        field(1800; "Column ED 18"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                //"Column Text 18" := CaptionOfEd("Column ED 18");
            end;
        }
        field(1805; "Formular 18"; Text[100])
        {
            TableRelation = "Payroll-E/D Codes.";
            ValidateTableRelation = false;
        }
        field(1810; "Column Text 18"; Text[35])
        {
        }
        field(1820; "Column Type 18"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(1825; "Column Value Type 18"; Option)
        {
            OptionMembers = Amount,Quantity;
        }
        field(1900; "Column ED 19"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                //"Column Text 19" := CaptionOfEd("Column ED 19");
            end;
        }
        field(1905; "Formular 19"; Text[100])
        {
            TableRelation = "Payroll-E/D Codes.";
            ValidateTableRelation = false;
        }
        field(1910; "Column Text 19"; Text[35])
        {
        }
        field(1920; "Column Type 19"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(1925; "Column Value Type 19"; Option)
        {
            OptionMembers = Amount,Quantity;
        }
        field(2000; "Column ED 20"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                //"Column Text 20" := CaptionOfEd("Column ED 20");
            end;
        }
        field(2005; "Formular 20"; Text[100])
        {
            TableRelation = "Payroll-E/D Codes.";
            ValidateTableRelation = false;
        }
        field(2010; "Column Text 20"; Text[35])
        {
        }
        field(2020; "Column Type 20"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(2025; "Column Value Type 20"; Option)
        {
            OptionMembers = Amount,Quantity;
        }
        field(2100; "Line Total Text"; Text[35])
        {
        }
        field(2120; "Line Total Columns"; Code[250])
        {
        }
    }

    keys
    {
        key(Key1; Id)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
    
    procedure CaptionOfEd(EDCode: Code[10]): Text[35]
    var
        EdTable: Record 50001;
    begin
        IF EdTable.GET(EDCode) THEN
            EXIT(EdTable."Payslip Text");
    end;
}

