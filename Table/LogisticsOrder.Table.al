table 50172 "Logistics Order"
{

    fields
    {
        field(1; "Order No."; Code[10])
        {
            Editable = false;
        }
        field(2; "Chassis No."; Code[40])
        {

            trigger OnValidate()
            begin
                ItemLedgEntry.SETCURRENTKEY("Serial No.");
                ItemLedgEntry.SETRANGE("Serial No.", "Chassis No.");
                IF ItemLedgEntry.FINDFIRST THEN BEGIN
                    "Item No." := ItemLedgEntry."Item No.";
                    Description := ItemLedgEntry.Description;
                    "Engine No." := ItemLedgEntry."Engine No.";
                    "Colour Name" := ItemLedgEntry."Exterior Colour Name";
                    Location := ItemLedgEntry."Location Code";
                END;

                VRIRec.SETCURRENTKEY("Item Serial No.");
                VRIRec.SETRANGE("Item Serial No.", "Chassis No.");
                IF VRIRec.FINDFIRST THEN BEGIN
                    "VRI Code" := VRIRec."VRI Code";
                    //"Arrival Date" := VRIRec.
                END;

                IF ItemRec.GET("Item No.") THEN
                    ModelRec.SETCURRENTKEY("Model No.");
                ModelRec.SETRANGE("Model No.", ItemRec."Model No.");
                IF ModelRec.FINDFIRST THEN BEGIN
                    Model := ModelRec."Model No.";
                    "Model Name" := ModelRec."Model Name";
                END;
            end;
        }
        field(3; "Item No."; Code[20])
        {
        }
        field(4; Description; Text[50])
        {
        }
        field(5; Model; Code[50])
        {
        }
        field(6; "Model Name"; Code[50])
        {
        }
        field(7; "Engine No."; Code[20])
        {
        }
        field(8; "Colour Name"; Text[30])
        {
        }
        field(9; "No. Series"; Code[10])
        {
        }
        field(10; "VRI Code"; Code[20])
        {
        }
        field(11; "Notify VRI"; Boolean)
        {

            trigger OnValidate()
            begin
                IF UserSetup.GET(USERID) THEN
                    "Sent By" := UserSetup."User ID";
                SenderAddress := UserSetup."E-Mail";



                ToName := UserSetup."E-Mail";
                //Subject := STRSUBSTfalse(text001, "Order No.");
                ToName := 'adeyemi@toyotanigeria.com';
                CCName := 'Alamu@toyotanigeria.com';
                //SendMail.NewMessage(ToName,CCName,Subject,"Job Description",attachement,'',TRUE);

                /* IF CURRENTCLIENTTYPE = CLIENTTYPE::Windows THEN
                    SendMail.NewMessage(ToName, CCName, Subject, "Job Description", attachement, '', TRUE);
                IF CURRENTCLIENTTYPE = CLIENTTYPE::Web THEN BEGIN
                    SMTPMail.CreateMessage("Sent By", SenderAddress, 'adeyemi@toyotanigeria.com;Alamu@toyotanigeria.com', Subject, Body, FALSE);
                    SMTPMail.Send;
                    MESSAGE(text001); 
                END; */
            end;
        }
        field(12; "Sent By"; Text[50])
        {
            Editable = false;
        }
        field(13; Date; Date)
        {
        }
        field(14; "KM Reading"; Integer)
        {
        }
        field(15; "Job Description"; Text[200])
        {
        }
        field(16; "Date of Problem Report"; Date)
        {
        }
        field(17; "Arrival Date"; Date)
        {
        }
        field(18; Location; Code[10])
        {
        }
        field(19; "Fuel Level"; Option)
        {
            OptionCaption = 'Full,3/4,1/2,1/4';
            OptionMembers = Full,"3/4","1/2","1/4";
        }
        field(20; "No. of Keys"; Integer)
        {
        }
        field(21; "Responsible Customer"; Code[10])
        {
            TableRelation = Customer."No.";
        }
        field(22; "Customer Name"; Text[70])
        {
        }
        field(23; "O/L Comment"; Text[100])
        {
        }
        field(24; "O/L Approval Comment"; Text[100])
        {
        }
        field(25; "O/L Approval"; Boolean)
        {
        }
        field(26; "VRI Comment To O/L"; Text[100])
        {
        }
        field(27; "VRI To WShop"; Boolean)
        {
            Description = 'For Estimate';
        }
        field(28; Estimate; Decimal)
        {
        }
        field(29; "Claim No."; Code[20])
        {
        }
        field(30; "Estimate Approval"; Boolean)
        {
            Description = 'By O/L';
        }
        field(31; "ISPV to VRI"; Integer)
        {
            CalcFormula = Count("Logistics Order" WHERE("O/L Approval" = filter(false),
                                                         "VRI To WShop" = filter(false),
                                                         "Estimate Approval" = filter(false),
                                                         Completed = filter(false),
                                                         "Notify VRI" = filter(true)));
            FieldClass = FlowField;
        }
        field(32; "Awaiting Estimate"; Integer)
        {
            CalcFormula = Count("Logistics Order" WHERE("O/L Approval" = filter(false),
                                                         "VRI To WShop" = filter(true),
                                                         "Estimate Approval" = filter(false),
                                                         Completed = filter(false)));
            FieldClass = FlowField;
        }
        field(33; "Awaiting O/L Apprv."; Integer)
        {
            CalcFormula = Count("Logistics Order" WHERE("O/L Approval" = filter(false),
                                                         "VRI To WShop" = filter(true),
                                                         "Estimate Approval" = filter(true),
                                                         Completed = filter(false)));
            FieldClass = FlowField;
        }
        field(34; "Under Repair"; Integer)
        {
            CalcFormula = Count("Logistics Order" WHERE("O/L Approval" = filter(true),
                                                         "VRI To WShop" = filter(true),
                                                         "Estimate Approval" = filter(true),
                                                         Completed = filter(false)));
            FieldClass = FlowField;
        }
        field(35; "Completed Repair"; Integer)
        {
            CalcFormula = Count("Logistics Order" WHERE("O/L Approval" = filter(true),
                                                         "VRI To WShop" = filter(true),
                                                         "Estimate Approval" = filter(true),
                                                         Completed = filter(true)));
            FieldClass = FlowField;
        }
        field(36; Completed; Boolean)
        {
        }
        field(37; "Generate COF"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "COF No." <> '' THEN
                    ERROR('COF has been created before!') ELSE BEGIN
                    IF NOT ServiceItem.GET("VRI Code") THEN BEGIN
                        TESTFIELD("Responsible Customer");
                        ServiceItem.INIT;
                        ServiceItem."No." := "VRI Code";
                        ServiceItem."Model No." := Model;
                        ServiceItem.Make := "Model Name";
                        ServiceItem."Engine No." := "Engine No.";
                        ServiceItem."Serial No." := "Chassis No.";
                        ServiceItem.VALIDATE("Customer No.", "Responsible Customer");
                        ServiceItem.INSERT(TRUE);
                    END;

                    COFRec.INIT;
                    COFRec.VALIDATE(COFRec."Customer No.", "Responsible Customer");
                    COFRec.VALIDATE(COFRec."Vehicle Registration No.", "VRI Code");
                    COFRec.VALIDATE(COFRec."Job Details", "Job Description");
                    //COFRec.VALIDATE("COF Origin",COFRec."COF Origin"::VRI);
                    COFRec."Frame No./VIN" := "Chassis No.";
                    COFRec."(Engine No)" := "Engine No.";
                    COFRec."Model Name" := "Model Name";
                    COFRec.INSERT(TRUE);
                    "COF No." := COFRec."Customer Order Form No.";
                END;
            end;
        }
        field(38; "COF No."; Code[10])
        {
        }
        field(39; "All ISPV"; Integer)
        {
            CalcFormula = Count("Logistics Order" WHERE(Completed = filter(false)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Order No.")
        {
            Clustered = true;
        }
        key(Key2; "VRI Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF "Order No." = '' THEN BEGIN
            ServMgtSetUp.GET;
            ServMgtSetUp.TESTFIELD("Logistic Nos.");
            "No. Series" := ServMgtSetUp."Logistic Nos.";
            if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Order No." := NoSeriesMgt.GetNextNo("No. Series");
        END;
        
        Date := TODAY;
    end;

    var
        ServMgtSetUp: Record "Service Mgt. Setup";
        NoSeriesMgt: Codeunit "No. Series";
        ItemLedgEntry: Record "Item Ledger Entry";
        VRIRec: Record "VRI Table";
        ModelRec: Record Model;
        ItemRec: Record Item;
        COFRec: Record "Customer Order Table.";
        ServiceItem: Record "Service Item";
        UserSetup: Record "User Setup";
        //SendMail: Codeunit Mail;
        mailsent: Boolean;
        ToName: Text[80];
        CCName: Text[80];
        Subject: Text[50];
        Body: Text[100];
        attachement: Text[260];
        Opendialog: Boolean;
        text001: Label 'ISPV No. %1 needs to be treated!';
        //SMTPMail: Codeunit "400";
        SendersName: Text[50];
        SenderAddress: Text[50];
}

