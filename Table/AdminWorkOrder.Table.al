table 50177 "Admin Work Order"
{

    fields
    {
        field(1; "Work Order No."; Code[10])
        {
            Editable = false;
        }
        field(2; "Vehicle Registration No."; Code[20])
        {
        }
        field(3; "Vehicle Description"; Code[50])
        {
        }
        field(8; "No. Series"; Code[10])
        {
        }
        field(9; "Sent By"; Text[70])
        {
            Editable = false;
        }
        field(10; Date; Date)
        {
        }
        field(11; "KM Reading"; Integer)
        {
        }
        field(12; "Job Description1"; Text[200])
        {
        }
        field(13; "Date of Problem Report"; Date)
        {
        }
        field(14; Location; Code[10])
        {
        }
        field(15; "Fuel Level"; Integer)
        {
        }
        field(16; "Responsible Driver"; Code[10])
        {
        }
        field(17; "Driver Name"; Text[70])
        {
        }
        field(18; "Generate COF"; Boolean)
        {

            trigger OnValidate()
            begin
                COFRec.INIT;
                COFRec.VALIDATE(COFRec."Customer No.", "Responsible Driver");
                COFRec.VALIDATE(COFRec."Vehicle Registration No.", "Vehicle Registration No.");
                //COFRec.VALIDATE(COFRec."Job Details", "Job Description1");
                //COFRec.VALIDATE("COF Origin",COFRec."COF Origin"::VRI);
                COFRec.INSERT(TRUE);
                "COF No." := COFRec."Customer Order Form No.";

                UserSetup.GET("Sent By UserID");
                ToName := UserSetup."E-Mail";
                CCName := '';

                //SendMail.NewMessage(ToName, CCName, Subject, Body, Attachement, '', TRUE);

                MESSAGE('Customer Order Form has been created for this job!');
            end;
        }
        field(19; "COF No."; Code[10])
        {
            TableRelation = "Customer Order Table."."Customer Order Form No." WHERE("Customer Order Form No." = FIELD("COF No."));
        }
        field(20; "Job Description2"; Text[200])
        {
        }
        field(21; "Job Description3"; Text[200])
        {
        }
        field(22; "Job Description4"; Text[200])
        {
        }
        field(23; "Job Description5"; Text[200])
        {
        }
        field(24; "Job Type"; Option)
        {
            OptionCaption = 'Regular Maintenance, Repair Work';
            OptionMembers = "Periodic Maintenance"," Repair Work";
        }
        field(25; "Send To W/shop"; Boolean)
        {

            trigger OnValidate()
            begin
                ToName := 'Isuekebho@toyotanigeria.com';
                Subject := 'Work Order from Admin!';
                Body := STRSUBSTNO('Please attend to %1', "Vehicle Registration No.");

                //SendMail.NewMessage(ToName,CCName,Subject,Body,Attachement,'',TRUE);

                IF UserSetup.GET(USERID) THEN BEGIN
                    "Sent By" := UserSetup.Name;
                    "Sent By UserID" := UserSetup."User ID";
                END;
            end;
        }
        field(26; "Sent By UserID"; Code[20])
        {
        }

    }

    keys
    {
        key(Key1; "Work Order No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()

    begin
        IF "Work Order No." = '' THEN BEGIN
            ServMgtSetUp.GET;
            ServMgtSetUp.TESTFIELD("Work Order No.");
            Rec."No. Series" := ServMgtSetUp."Work Order No.";
            if NoSeriesMgt.AreRelated(Rec."No. Series", xRec."No. Series") then
                Rec."No. Series" := xRec."No. Series";
            Rec."Work Order No." := NoSeriesMgt.GetNextNo("No. Series");
        END;
        Date := TODAY;
    end;

    var
        ServMgtSetUp: Record "Service Mgt. Setup";
        NoSeriesMgt: Codeunit "No. Series";
        ItemLedgEntry: Record "Item Ledger Entry";
        ModelRec: Record Model;
        ItemRec: Record Item;
        COFRec: Record "Customer Order Table.";
        UserSetup: Record "User Setup";
        //SendMail: Codeunit Mail;
        mailsent: Boolean;
        ToName: Text[80];
        CCName: Text[80];
        Subject: Text[50];
        Body: Text[1000];
        Attachement: Text[260];
        Opendialog: Boolean;
        text001: Label 'ISPV No. %1 needs to be treated!';

}

