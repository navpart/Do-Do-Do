table 50147 "Management Report Setup PR"
{

    fields
    {
        field(1; "Division Code"; Code[20])
        {
            Description = 'Company Code';
        }
        field(2; "Field 1"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(3; "Field 2"; Code[20])
        {
        }
        field(4; "Field 3"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(5; "Field 4"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(6; "Field 5"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(7; "Field 6"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(8; "Field 7"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(9; "Field 8"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(10; "Field 9"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(11; "Field 10"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(12; "Field 11"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(13; "Field 12"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(14; "Field 13"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(15; "Field 14"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(16; "Field 15"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(17; "Field 16"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(18; "Field 17"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(19; "Field 18"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(20; "Field 19"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(21; "Field 20"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(22; "Field 21"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(23; "Field 22"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(24; "Field 23"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(25; "Field 24"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(26; "Field 25"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(27; "Field 26"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(28; "Field 27"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(29; "Field 28"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(30; "Field 29"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(31; "Field 30"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(32; "Field 31"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(33; "Field 32"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(34; "Field 33"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(35; "Field 34"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(36; "Field 35"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(37; "Field 36"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(38; "Field 37"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(39; "Field 38"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(40; "Field 39"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(41; "Field 40"; Code[20])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(42; "Mid Month"; Boolean)
        {
        }
        field(43; "Company Name"; Text[80])
        {
        }
        field(50; Id; Integer)
        {
        }
        field(70; Title; Text[60])
        {
        }
        field(100; "Column ED 1"; Code[20])
        {
            
            trigger OnValidate()
            begin
                //"Column Text 1" := CaptionOfEd("Column ED 1");
            end;
        }
        field(110; "Column Text 1"; Text[30])
        {
        }
        field(120; "Column Type 1"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(200; "Column ED 2"; Code[20])
        {

            trigger OnValidate()
            begin
                //"Column Text 2" := CaptionOfEd("Column ED 2");
            end;
        }
        field(210; "Column Text 2"; Text[30])
        {
        }
        field(220; "Column Type 2"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(300; "Column ED 3"; Code[20])
        {

            trigger OnValidate()
            begin
               // "Column Text  3" := CaptionOfEd("Column ED 3");
            end;
        }
        field(310; "Column Text  3"; Text[30])
        {
        }
        field(320; "Column Type 3"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(400; "Column ED 4"; Code[20])
        {

            trigger OnValidate()
            begin
                //"Column Text 4" := CaptionOfEd("Column ED 4");
            end;
        }
        field(410; "Column Text 4"; Text[30])
        {
        }
        field(420; "Column Type 4"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(500; "Column ED 5"; Code[20])
        {

            trigger OnValidate()
            begin
                //"Column Text 5" := CaptionOfEd("Column ED 5");
            end;
        }
        field(510; "Column Text 5"; Text[30])
        {
        }
        field(520; "Column Type 5"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(600; "Column ED 6"; Code[20])
        {

            trigger OnValidate()
            begin
                //"Column Text 6" := CaptionOfEd("Column ED 6");
            end;
        }
        field(610; "Column Text 6"; Text[30])
        {
        }
        field(620; "Column Type 6"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(700; "Column ED 7"; Code[20])
        {

            trigger OnValidate()
            begin
                //"Column Text 7" := CaptionOfEd("Column ED 7");
            end;
        }
        field(710; "Column Text 7"; Text[30])
        {
        }
        field(720; "Column Type 7"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(800; "Column ED 8"; Code[20])
        {

            trigger OnValidate()
            begin
               // "Column Text 8" := CaptionOfEd("Column ED 8");
            end;
        }
        field(810; "Column Text 8"; Text[30])
        {
        }
        field(820; "Column Type 8"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(900; "Column ED 9"; Code[20])
        {

            trigger OnValidate()
            begin
               // "Column Text 9" := CaptionOfEd("Column ED 9");
            end;
        }
        field(910; "Column Text 9"; Text[30])
        {
        }
        field(920; "Column Type 9"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(1000; "Column ED 10"; Code[20])
        {

            trigger OnValidate()
            begin
                //"Column Text 10" := CaptionOfEd("Column ED 10");
            end;
        }
        field(1010; "Column Text 10"; Text[30])
        {
        }
        field(1020; "Column Type 10"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(1100; "Column ED 11"; Code[20])
        {

            trigger OnValidate()
            begin
               // "Column Text 11" := CaptionOfEd("Column ED 11");
            end;
        }
        field(1110; "Column Text 11"; Text[30])
        {
        }
        field(1120; "Column Type 11"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(1200; "Column ED 12"; Code[20])
        {

            trigger OnValidate()
            begin
               // "Column Text 12" := CaptionOfEd("Column ED 12");
            end;
        }
        field(1210; "Column Text 12"; Text[30])
        {
        }
        field(1220; "Column Type 12"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(1300; "Column ED 13"; Code[20])
        {

            trigger OnValidate()
            begin
              //  "Column Text  13" := CaptionOfEd("Column ED 13");
            end;
        }
        field(1310; "Column Text  13"; Text[30])
        {
        }
        field(1320; "Column Type 13"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(1400; "Column ED 14"; Code[20])
        {

            trigger OnValidate()
            begin
                //"Column Text 14" := CaptionOfEd("Column ED 14");
            end;
        }
        field(1410; "Column Text 14"; Text[30])
        {
        }
        field(1420; "Column Type 14"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(1500; "Column ED 15"; Code[20])
        {

            trigger OnValidate()
            begin
               // "Column Text 15" := CaptionOfEd("Column ED 15");
            end;
        }
        field(1510; "Column Text 15"; Text[30])
        {
        }
        field(1520; "Column Type 15"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(1600; "Column ED 16"; Code[20])
        {

            trigger OnValidate()
            begin
               // "Column Text 16" := CaptionOfEd("Column ED 16");
            end;
        }
        field(1610; "Column Text 16"; Text[30])
        {
        }
        field(1620; "Column Type 16"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(1700; "Column ED 17"; Code[20])
        {

            trigger OnValidate()
            begin
                //"Column Text 17" := CaptionOfEd("Column ED 17");
            end;
        }
        field(1710; "Column Text 17"; Text[30])
        {
        }
        field(1720; "Column Type 17"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(1800; "Column ED 18"; Code[20])
        {

            trigger OnValidate()
            begin
                //"Column Text 18" := CaptionOfEd("Column ED 18");
            end;
        }
        field(1810; "Column Text 18"; Text[30])
        {
        }
        field(1820; "Column Type 18"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(1900; "Column ED 19"; Code[20])
        {
            //TableRelation = Table40201;

            trigger OnValidate()
            begin
               // "Column Text 19" := CaptionOfEd("Column ED 19");
            end;
        }
        field(1910; "Column Text 19"; Text[30])
        {
        }
        field(1920; "Column Type 19"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
        field(2000; "Column ED 20"; Code[20])
        {

            trigger OnValidate()
            begin
                //"Column Text 20" := CaptionOfEd("Column ED 20");
            end;
        }
        field(2010; "Column Text 20"; Text[30])
        {
        }
        field(2020; "Column Type 20"; Option)
        {
            OptionMembers = " ","PRV Year","PRV Period",YTD,"Cum. to Date";
        }
    }

    keys
    {
        key(Key1; "Division Code", "Mid Month")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    
    procedure CaptionOfEd(EDCode: Code[10]): Text[30]
    var
        EdTable: Record "Payroll-E/D Codes.";
    begin
        EdTable.GET(EDCode);
        EXIT(EdTable."Payslip Text");
    end;
}

