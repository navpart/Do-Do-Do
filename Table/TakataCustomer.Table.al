table 70029 "Takata Customer"
{

    fields
    {
        field(10; "No."; Code[20])
        {
        }
        field(20; "Registration. No"; Code[100])
        {
        }
        field(30; "Chassis No"; Code[100])
        {
        }
        field(40; "Customer Name"; Text[100])
        {
        }
        field(50; Address; Text[200])
        {
        }
        field(60; "Mobile No"; Code[100])
        {
        }
        field(70; "Vehicle Make Name"; Text[100])
        {
        }
        field(80; Email; Text[100])
        {
        }
        field(90; Comment; Text[100])
        {
        }
        field(100; Name; Text[100])
        {
        }
        field(110; "Color Code"; Option)
        {
            OptionCaption = ',A,G,R,Y';
            OptionMembers = ,A,G,R,Y;
        }
        field(120; "Date of Call"; Date)
        {
        }
        field(130; "No. Series"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(131; "Call Result"; Option)
        {
            OptionCaption = ',Not Available,Did Not Pick,Email Not Given,Booked Appointment,Vehicle Sold/Scrapped,Not Vehicle Owner';
            OptionMembers = ,"Not Available","Did Not Pick","Email Not Given","Booked Appointment","Vehicle Sold/Scrapped","Not Vehicle Owner";
        }
        field(132; "Call Purpose"; Option)
        {
            OptionCaption = ',Takata, Memo Marketing';
            OptionMembers = ,Takata," Memo Marketing";
        }
        field(133; "Vehicle Model Name"; Text[100])
        {
        }
        field(134; "KIV Customer"; Boolean)
        {
        }
        field(135; "Not Reachable"; Boolean)
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
        IF "No." = '' THEN BEGIN
            PurchSetup.GET;
            PurchSetup.TESTFIELD("Takata Customer");
            "No. Series" := PurchSetup."Takata Customer";
            if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeriesMgt.GetNextNo("No. Series");

            //NoSeriesMgt.InitSeries(PurchSetup."Takata Customer", xRec."No. Series", 0D, "No.", "No. Series");
        END;
    end;

    var
        UserSetup: Record 91;
        NoSeriesMgt: Codeunit "No. Series";
        PurchSetup: Record 312;
        TakataCustomer: Record 70029;
}

