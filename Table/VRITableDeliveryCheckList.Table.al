#pragma warning disable AL0914
table 50160 "VRI Table Delivery Check List"
#pragma warning restore AL0914
{
    DataCaptionFields = "VRI Code", "VRI Location", "Model Name";
    PasteIsValid = true;

    fields
    {
        field(1; "VRI Code"; Code[30])
        {
        }
        field(2; "VRI Location"; Code[30])
        {
            TableRelation = Location.Code;
        }
        field(3; "VRI Date"; Date)
        {
        }
        field(4; "Item No."; Code[30])
        {
            TableRelation = Item."No.";

            trigger OnValidate()
            begin
                IF VRIItem.GET("Item No.") THEN BEGIN
                    Description := VRIItem.Description;
                    "Model No." := VRIItem."Model No.";
                    ModelRec.SETCURRENTKEY(ModelRec."Model No.");
                    ModelRec.SETRANGE(ModelRec."Model No.", "Model No.");
                    IF ModelRec.FINDFIRST THEN
                        "Model Name" := ModelRec."Model Name";
                    //  "Product Group":= VRIItem."Product Group Code";
                END;
            end;
        }
        field(5; "Model No."; Code[30])
        {
            TableRelation = Model."Model No.";

            trigger OnValidate()
            begin
                ModelRec.SETCURRENTKEY(ModelRec."Model No.");
                ModelRec.SETRANGE(ModelRec."Model No.", "Model No.");
                IF ModelRec.FINDFIRST THEN
                    "Model Name" := ModelRec."Model Name";
            end;
        }
        field(6; "Model Name"; Text[50])
        {
        }
        field(7; Description; Text[40])
        {
        }
        field(8; "Item Serial No."; Code[30])
        {

            trigger OnValidate()
            begin
                ItemLedgEntry.SETCURRENTKEY("Serial No.");
                ItemLedgEntry.SETRANGE("Serial No.", "Item Serial No.");
                IF ItemLedgEntry.FINDFIRST THEN BEGIN
                    "Engine No." := ItemLedgEntry."Engine No.";
                    "Key No." := ItemLedgEntry."Key No.";
                    "Exterior Colour" := ItemLedgEntry."Exterior Colour Name";
                    VALIDATE("Item No.", ItemLedgEntry."Item No.");
                    Description := ItemLedgEntry.Description;
                END;
            end;
        }
        field(9; "Engine No."; Code[20])
        {
        }
        field(10; "Key No."; Text[30])
        {
        }
        field(11; "Exterior Colour"; Code[30])
        {
        }
        field(12; "Check Light"; Boolean)
        {
        }
        field(13; "Check Wiper"; Boolean)
        {
        }
        field(14; "Check Tyres"; Boolean)
        {
        }
        field(15; "Check Seat"; Boolean)
        {
        }
        field(16; Status; Option)
        {
            BlankZero = true;
            OptionCaption = ',Okay,Problem Vehicle';
            OptionMembers = ,Okay,"Problem Vehicle";
        }
        field(17; "Raise Service Req."; Boolean)
        {
        }
        field(18; "Send VRI Request"; Boolean)
        {

            
        }
        field(19; "Op./Log.  Approval"; Boolean)
        {
            NotBlank = true;

            /*         trigger OnValidate()
                    begin
                        IF "Responsible Customer" = '' THEN
                        ERROR('You must specify the responsible customer!');

                        IF  "Op./Log.  Approval" =TRUE
                        THEN BEGIN
                          TESTFIELD("Send VRI Request");
                          TESTFIELD("Logistic Action")
                        END ELSE
                          VALIDATE("Op./Log.  Approval",FALSE);
                          "Op./Log Approval Name" := USERID;
                          "Log. Approval Date&Time" := CURRENTDATETIME;
                          "O/Log Comment":="O/Log Comment2";
                          "Op/Log Approval Comment2":="Op./Log Approval Comment";
                          UserSetup.GET(USERID);
                          SenderEmail := UserSetup."E-Mail";
                          UserSetup2.GET("Send To VRI");
                          ToName := UserSetup2."E-Mail";
                          //       Servicesetup.GET;
                          //      ToName  :=Servicesetup."Operation/Log Approval";
                          CCName := '';
                          Bcc:= '';
                          Subject := STRSUBSTNO(Text003,"VRI Code");
                          Body:=  STRSUBSTNO( Text004,"VRI Code","O/Log Comment");
                          SenderInitial := UserSetup2.Initials;
                          Initials := UserSetup.Initials;

                          WITH TempEmailItem DO BEGIN
                            "Send to" := ToName;
                            "Send CC" := SenderEmail;
                            "Send BCC" := '';
                            Subject := STRSUBSTNO(Text003,"VRI Code");

                            CRLF := '';
                            CRLF[1] := 13;
                            CRLF[2] := 10;

                            BodyBlob.Blob.CREATEOUTSTREAM(BodyStream);
                            BodyStream.WRITETEXT(Text016 + Initials + ',');
                            BodyStream.WRITETEXT(CRLF + CRLF);
                            BodyStream.WRITETEXT(STRSUBSTNO(Text004,"VRI Code","O/Log Comment") + CRLF + CRLF +
                            CRLF + CRLF +
                            Text017 + CRLF);
                            BodyStream.WRITETEXT(SenderInitial);
                            BodyStream.WRITETEXT(CRLF + CRLF);
                            BodyStream.WRITETEXT('This is a system generated mail. Please do not reply to this email ID.');
                            Body := BodyBlob.Blob;
                            Send(FALSE);
                          END;
                    end; */
        }
        field(20; "No. Series"; Code[30])
        {
            TableRelation = "No. Series".Code;
        }
        field(21; "Problem Statement"; Text[200])
        {
        }
        field(22; "Line No."; Code[10])
        {
        }
        field(23; "Send to VRI by"; Code[20])
        {
        }
        field(24; Date; DateTime)
        {
        }
        field(25; "COF No"; Code[10])
        {
            TableRelation = "Customer Order Table."."Customer Order Form No.";
        }
        field(26; "COF Created By"; Code[30])
        {
        }
        field(27; "COF Creation Date"; DateTime)
        {
        }
        field(28; "Customer Account"; Code[20])
        {
        }
        field(29; "Service Item No"; Code[20])
        {
        }
        field(30; "Item Entry"; Integer)
        {
            BlankZero = true;
            TableRelation = "Reservation Entry"."Entry No.";

            /* trigger OnValidate()
            begin
                IF ItemLedgerE.GET("Item Entry") THEN
                  BEGIN
                    "Item Serial No.":=ItemLedgerE."Serial No.";
                    "Engine No.":=ItemLedgerE."Engine No.";
                    "Key No.":=ItemLedgerE."Key No.";
                    "Exterior Colour":=ItemLedgerE."Exterior Colour Name";
                  END;
            end; */
        }
        field(31; "Factory loaded parts present"; Option)
        {
            BlankZero = false;
            Caption = 'Check that all factory loaded parts are present';
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Factory loaded parts present" = "Factory loaded parts present"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(32; "Factory loaded parts condition"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Factory loaded parts condition" = "Factory loaded parts condition"::"Not OK" THEN BEGIN
                  "Pass to Sales/Marketing" := FALSE;
                  "Problem Vehicle" := TRUE;
                  "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(33; "Quantities of keys/Transmitter"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Quantities of keys/Transmitter" = "Quantities of keys/Transmitter"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(34; Accidents; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF Accidents = Accidents::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(35; "Body protective film"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*     trigger OnValidate()
                begin
                    TESTFIELD("VRI Inspector Code");
                    TESTFIELD("VRI Supervisor No");
                    TESTFIELD("VRI Date");
                    IF "Body protective film" = "Body protective film"::"Not OK" THEN BEGIN
                      "Pass to Sales/Marketing" := FALSE;
                      "Problem Vehicle" := TRUE;
                      "OK Value" := "OK Value" + 1;
                    END ELSE BEGIN
                      "Problem Vehicle" := FALSE;
                      IF "OK Value" <> 0 THEN
                      "OK Value" := "OK Value" - 1;
                    END;

                    IF "OK Value" <> 0 THEN
                      IF Fixed = FALSE THEN
                      "Pass to Sales/Marketing" := FALSE;

                    IF "OK Value" = 0 THEN
                      "Pass to Sales/Marketing" := TRUE;
                end; */
        }
        field(36; Dents; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            trigger OnValidate()
            begin
                TESTFIELD("VRI Inspector Code");
                TESTFIELD("VRI Supervisor No");
                TESTFIELD("VRI Date");
                IF Dents = Dents::"Not OK" THEN BEGIN
                    "Pass to Sales/Marketing" := FALSE;
                    "Problem Vehicle" := TRUE;
                    "OK Value" := "OK Value" + 1;
                END ELSE BEGIN
                    "Problem Vehicle" := FALSE;
                    IF "OK Value" <> 0 THEN
                        "OK Value" := "OK Value" - 1;
                END;

                IF "OK Value" <> 0 THEN
                    IF Fixed = FALSE THEN
                        "Pass to Sales/Marketing" := FALSE;

                IF "OK Value" = 0 THEN
                    "Pass to Sales/Marketing" := TRUE;
            end;
        }
        field(37; Scratches; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            trigger OnValidate()
            begin
                TESTFIELD("VRI Inspector Code");
                TESTFIELD("VRI Supervisor No");
                TESTFIELD("VRI Date");
                IF Scratches = Scratches::"Not OK" THEN BEGIN
                    "Pass to Sales/Marketing" := FALSE;
                    "Problem Vehicle" := TRUE;
                    "OK Value" := "OK Value" + 1;
                END ELSE BEGIN
                    "Problem Vehicle" := FALSE;
                    IF "OK Value" <> 0 THEN
                        "OK Value" := "OK Value" - 1;
                END;

                IF "OK Value" <> 0 THEN
                    IF Fixed = FALSE THEN
                        "Pass to Sales/Marketing" := FALSE;

                IF "OK Value" = 0 THEN
                    "Pass to Sales/Marketing" := TRUE;
            end;
        }
        field(38; "Body Trim damages"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*   trigger OnValidate()
              begin
                  TESTFIELD("VRI Inspector Code");
                  TESTFIELD("VRI Supervisor No");
                  TESTFIELD("VRI Date");
                  IF "Body Trim damages" = "Body Trim damages"::"Not OK" THEN BEGIN
                    "Pass to Sales/Marketing" := FALSE;
                    "Problem Vehicle" := TRUE;
                    "OK Value" := "OK Value" + 1;
                  END ELSE BEGIN
                    "Problem Vehicle" := FALSE;
                    IF "OK Value" <> 0 THEN
                    "OK Value" := "OK Value" - 1;
                  END;

                  IF "OK Value" <> 0 THEN
                    IF Fixed = FALSE THEN
                    "Pass to Sales/Marketing" := FALSE;

                  IF "OK Value" = 0 THEN
                    "Pass to Sales/Marketing" := TRUE;
              end; */
        }
        field(39; Windscreen; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*   trigger OnValidate()
              begin
                  TESTFIELD("VRI Inspector Code");
                  TESTFIELD("VRI Supervisor No");
                  TESTFIELD("VRI Date");
                  IF Windscreen = Windscreen::"Not OK" THEN BEGIN
                    "Pass to Sales/Marketing" := FALSE;
                    "Problem Vehicle" := TRUE;
                    "OK Value" := "OK Value" + 1;
                  END ELSE BEGIN
                    "Problem Vehicle" := FALSE;
                    IF "OK Value" <> 0 THEN
                    "OK Value" := "OK Value" - 1;
                  END;

                  IF "OK Value" <> 0 THEN
                    IF Fixed = FALSE THEN
                    "Pass to Sales/Marketing" := FALSE;

                  IF "OK Value" = 0 THEN
                    "Pass to Sales/Marketing" := TRUE;
              end; */
        }
        field(40; "Side glasses"; Option)
        {
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Side glasses" = "Side glasses"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(41; "Side Mirrors"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Side Mirrors" = "Side Mirrors"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(42; Lamps; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*     trigger OnValidate()
                begin
                    TESTFIELD("VRI Inspector Code");
                    TESTFIELD("VRI Supervisor No");
                    TESTFIELD("VRI Date");
                    IF Lamps = Lamps::"Not OK" THEN BEGIN
                      "Pass to Sales/Marketing" := FALSE;
                      "Problem Vehicle" := TRUE;
                      "OK Value" := "OK Value" + 1;
                    END ELSE BEGIN
                      "Problem Vehicle" := FALSE;
                      IF "OK Value" <> 0 THEN
                      "OK Value" := "OK Value" - 1;
                    END;

                    IF "OK Value" <> 0 THEN
                      IF Fixed = FALSE THEN
                      "Pass to Sales/Marketing" := FALSE;

                    IF "OK Value" = 0 THEN
                      "Pass to Sales/Marketing" := TRUE;
                end; */
        }
        field(43; "Wiper blades"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*       trigger OnValidate()
                  begin
                      TESTFIELD("VRI Inspector Code");
                      TESTFIELD("VRI Supervisor No");
                      TESTFIELD("VRI Date");
                      IF "Wiper blades" = "Wiper blades"::"Not OK" THEN BEGIN
                        "Pass to Sales/Marketing" := FALSE;
                        "Problem Vehicle" := TRUE;
                        "OK Value" := "OK Value" + 1;
                      END ELSE BEGIN
                        "Problem Vehicle" := FALSE;
                        IF "OK Value" <> 0 THEN
                        "OK Value" := "OK Value" - 1;
                      END;

                      IF "OK Value" <> 0 THEN
                        IF Fixed = FALSE THEN
                        "Pass to Sales/Marketing" := FALSE;

                      IF "OK Value" = 0 THEN
                        "Pass to Sales/Marketing" := TRUE;
                  end; */
        }
        field(44; Label; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*      trigger OnValidate()
                 begin
                     TESTFIELD("VRI Inspector Code");
                     TESTFIELD("VRI Supervisor No");
                     TESTFIELD("VRI Date");
                     IF Label = Label::"Not OK" THEN BEGIN
                       "Pass to Sales/Marketing" := FALSE;
                       "Problem Vehicle" := TRUE;
                       "OK Value" := "OK Value" + 1;
                     END ELSE BEGIN
                       "Problem Vehicle" := FALSE;
                       IF "OK Value" <> 0 THEN
                       "OK Value" := "OK Value" - 1;
                     END;

                     IF "OK Value" <> 0 THEN
                       IF Fixed = FALSE THEN
                       "Pass to Sales/Marketing" := FALSE;

                     IF "OK Value" = 0 THEN
                       "Pass to Sales/Marketing" := TRUE;
                 end; */
        }
        field(45; Tyres; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*     trigger OnValidate()
                begin
                    TESTFIELD("VRI Inspector Code");
                    TESTFIELD("VRI Supervisor No");
                    TESTFIELD("VRI Date");
                    IF Tyres = Tyres::"Not OK" THEN BEGIN
                      "Pass to Sales/Marketing" := FALSE;
                      "Problem Vehicle" := TRUE;
                      "OK Value" := "OK Value" + 1;
                    END ELSE BEGIN
                      "Problem Vehicle" := FALSE;
                      IF "OK Value" <> 0 THEN
                      "OK Value" := "OK Value" - 1;
                    END;

                    IF "OK Value" <> 0 THEN
                      IF Fixed = FALSE THEN
                      "Pass to Sales/Marketing" := FALSE;

                    IF "OK Value" = 0 THEN
                      "Pass to Sales/Marketing" := TRUE;
                end; */
        }
        field(46; Trunk; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF Trunk = Trunk::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(47; "Brake disc"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*   trigger OnValidate()
              begin
                  TESTFIELD("VRI Inspector Code");
                  TESTFIELD("VRI Supervisor No");
                  TESTFIELD("VRI Date");
                  IF "Brake disc" = "Brake disc"::"Not OK" THEN BEGIN
                    "Pass to Sales/Marketing" := FALSE;
                    "Problem Vehicle" := TRUE;
                    "OK Value" := "OK Value" + 1;
                  END ELSE BEGIN
                    "Problem Vehicle" := FALSE;
                    IF "OK Value" <> 0 THEN
                    "OK Value" := "OK Value" - 1;
                  END;

                  IF "OK Value" <> 0 THEN
                    IF Fixed = FALSE THEN
                    "Pass to Sales/Marketing" := FALSE;

                  IF "OK Value" = 0 THEN
                    "Pass to Sales/Marketing" := TRUE;
              end; */
        }
        field(48; "Missing items"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*   trigger OnValidate()
              begin
                  TESTFIELD("VRI Inspector Code");
                  TESTFIELD("VRI Supervisor No");
                  TESTFIELD("VRI Date");
                  IF "Missing items" = "Missing items"::"Not OK" THEN BEGIN
                    "Pass to Sales/Marketing" := FALSE;
                    "Problem Vehicle" := TRUE;
                    "OK Value" := "OK Value" + 1;
                  END ELSE BEGIN
                    "Problem Vehicle" := FALSE;
                    IF "OK Value" <> 0 THEN
                    "OK Value" := "OK Value" - 1;
                  END;

                  IF "OK Value" <> 0 THEN
                    IF Fixed = FALSE THEN
                    "Pass to Sales/Marketing" := FALSE;

                  IF "OK Value" = 0 THEN
                    "Pass to Sales/Marketing" := TRUE;
              end; */
        }
        field(49; "Install Side mirrors"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Install Side mirrors" = "Install Side mirrors"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(50; "Snorkel Pipe"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*   trigger OnValidate()
              begin
                  TESTFIELD("VRI Inspector Code");
                  TESTFIELD("VRI Supervisor No");
                  TESTFIELD("VRI Date");
                  IF "Snorkel Pipe" = "Snorkel Pipe"::"Not OK" THEN BEGIN
                    "Pass to Sales/Marketing" := FALSE;
                    "Problem Vehicle" := TRUE;
                    "OK Value" := "OK Value" + 1;
                  END ELSE BEGIN
                    "Problem Vehicle" := FALSE;
                    IF "OK Value" <> 0 THEN
                    "OK Value" := "OK Value" - 1;
                  END;

                  IF "OK Value" <> 0 THEN
                    IF Fixed = FALSE THEN
                    "Pass to Sales/Marketing" := FALSE;

                  IF "OK Value" = 0 THEN
                    "Pass to Sales/Marketing" := TRUE;
              end; */
        }
        field(51; "Rear Sticker"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*   trigger OnValidate()
              begin
                  TESTFIELD("VRI Inspector Code");
                  TESTFIELD("VRI Supervisor No");
                  TESTFIELD("VRI Date");
                  IF "Rear Sticker" = "Rear Sticker"::"Not OK" THEN BEGIN
                    "Pass to Sales/Marketing" := FALSE;
                    "Problem Vehicle" := TRUE;
                    "OK Value" := "OK Value" + 1;
                  END ELSE BEGIN
                    "Problem Vehicle" := FALSE;
                    IF "OK Value" <> 0 THEN
                    "OK Value" := "OK Value" - 1;
                  END;

                  IF "OK Value" <> 0 THEN
                    IF Fixed = FALSE THEN
                    "Pass to Sales/Marketing" := FALSE;

                  IF "OK Value" = 0 THEN
                    "Pass to Sales/Marketing" := TRUE;
              end; */
        }
        field(52; "Air Spoiler"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Air Spoiler" = "Air Spoiler"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(53; "Wheel Covers"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /* trigger OnValidate()
            begin
                TESTFIELD("VRI Inspector Code");
                TESTFIELD("VRI Supervisor No");
                TESTFIELD("VRI Date");
                IF "Wheel Covers" = "Wheel Covers"::"Not OK" THEN BEGIN
                  "Pass to Sales/Marketing" := FALSE;
                  "Problem Vehicle" := TRUE;
                  "OK Value" := "OK Value" + 1;
                END ELSE BEGIN
                  "Problem Vehicle" := FALSE;
                  IF "OK Value" <> 0 THEN
                  "OK Value" := "OK Value" - 1;
                END;

                IF "OK Value" <> 0 THEN
                  IF Fixed = FALSE THEN
                  "Pass to Sales/Marketing" := FALSE;

                IF "OK Value" = 0 THEN
                  "Pass to Sales/Marketing" := TRUE;
            end; */
        }
        field(54; "Towing eyelet"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /* trigger OnValidate()
            begin
                TESTFIELD("VRI Inspector Code");
                TESTFIELD("VRI Supervisor No");
                TESTFIELD("VRI Date");
                IF "Towing eyelet" = "Towing eyelet"::"Not OK" THEN BEGIN
                  "Pass to Sales/Marketing" := FALSE;
                  "Problem Vehicle" := TRUE;
                  "OK Value" := "OK Value" + 1;
                END ELSE BEGIN
                  "Problem Vehicle" := FALSE;
                  IF "OK Value" <> 0 THEN
                  "OK Value" := "OK Value" - 1;
                END;

                IF "OK Value" <> 0 THEN
                  IF Fixed = FALSE THEN
                  "Pass to Sales/Marketing" := FALSE;

                IF "OK Value" = 0 THEN
                  "Pass to Sales/Marketing" := TRUE;
            end; */
        }
        field(55; "Battery teminal"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /* trigger OnValidate()
            begin
                TESTFIELD("VRI Inspector Code");
                TESTFIELD("VRI Supervisor No");
                TESTFIELD("VRI Date");
                IF "Battery teminal" = "Battery teminal"::"Not OK" THEN BEGIN
                  "Pass to Sales/Marketing" := FALSE;
                  "Problem Vehicle" := TRUE;
                  "OK Value" := "OK Value" + 1;
                END ELSE BEGIN
                  "Problem Vehicle" := FALSE;
                  IF "OK Value" <> 0 THEN
                  "OK Value" := "OK Value" - 1;
                END;

                IF "OK Value" <> 0 THEN
                  IF Fixed = FALSE THEN
                  "Pass to Sales/Marketing" := FALSE;

                IF "OK Value" = 0 THEN
                  "Pass to Sales/Marketing" := TRUE;
            end; */
        }
        field(56; Antennas; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*         trigger OnValidate()
                    begin
                        TESTFIELD("VRI Inspector Code");
                        TESTFIELD("VRI Supervisor No");
                        TESTFIELD("VRI Date");
                        IF Antennas = Antennas::"Not OK" THEN BEGIN
                          "Pass to Sales/Marketing" := FALSE;
                          "Problem Vehicle" := TRUE;
                          "OK Value" := "OK Value" + 1;
                        END ELSE BEGIN
                          "Problem Vehicle" := FALSE;
                          IF "OK Value" <> 0 THEN
                          "OK Value" := "OK Value" - 1;
                        END;

                        IF "OK Value" <> 0 THEN
                          IF Fixed = FALSE THEN
                          "Pass to Sales/Marketing" := FALSE;

                        IF "OK Value" = 0 THEN
                          "Pass to Sales/Marketing" := TRUE;
                    end; */
        }
        field(57; "Ear phone"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /* trigger OnValidate()
            begin
                TESTFIELD("VRI Inspector Code");
                TESTFIELD("VRI Supervisor No");
                TESTFIELD("VRI Date");
                IF "Ear phone" = "Ear phone"::"Not OK" THEN BEGIN
                  "Pass to Sales/Marketing" := FALSE;
                  "Problem Vehicle" := TRUE;
                  "OK Value" := "OK Value" + 1;
                END ELSE BEGIN
                  "Problem Vehicle" := FALSE;
                  IF "OK Value" <> 0 THEN
                  "OK Value" := "OK Value" - 1;
                END;

                IF "OK Value" <> 0 THEN
                  IF Fixed = FALSE THEN
                  "Pass to Sales/Marketing" := FALSE;

                IF "OK Value" = 0 THEN
                  "Pass to Sales/Marketing" := TRUE;
            end; */
        }
        field(58; "Floor Mats"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*    trigger OnValidate()
               begin
                   TESTFIELD("VRI Inspector Code");
                   TESTFIELD("VRI Supervisor No");
                   TESTFIELD("VRI Date");
                   IF "Floor Mats" = "Floor Mats"::"Not OK" THEN BEGIN
                     "Pass to Sales/Marketing" := FALSE;
                     "Problem Vehicle" := TRUE;
                     "OK Value" := "OK Value" + 1;
                   END ELSE BEGIN
                     "Problem Vehicle" := FALSE;
                     IF "OK Value" <> 0 THEN
                     "OK Value" := "OK Value" - 1;
                   END;

                   IF "OK Value" <> 0 THEN
                     IF Fixed = FALSE THEN
                     "Pass to Sales/Marketing" := FALSE;

                   IF "OK Value" = 0 THEN
                     "Pass to Sales/Marketing" := TRUE;
               end; */
        }
        field(59; "Jack and Tool"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*     trigger OnValidate()
                begin
                    TESTFIELD("VRI Inspector Code");
                    TESTFIELD("VRI Supervisor No");
                    TESTFIELD("VRI Date");
                    IF "Jack and Tool" = "Jack and Tool"::"Not OK" THEN BEGIN
                      "Pass to Sales/Marketing" := FALSE;
                      "Problem Vehicle" := TRUE;
                      "OK Value" := "OK Value" + 1;
                    END ELSE BEGIN
                      "Problem Vehicle" := FALSE;
                      IF "OK Value" <> 0 THEN
                      "OK Value" := "OK Value" - 1;
                    END;

                    IF "OK Value" <> 0 THEN
                      IF Fixed = FALSE THEN
                      "Pass to Sales/Marketing" := FALSE;

                    IF "OK Value" = 0 THEN
                      "Pass to Sales/Marketing" := TRUE;
                end; */
        }
        field(60; "Spare tyres"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*   trigger OnValidate()
              begin
                  TESTFIELD("VRI Inspector Code");
                  TESTFIELD("VRI Supervisor No");
                  TESTFIELD("VRI Date");
                  IF "Spare tyres" = "Spare tyres"::"Not OK" THEN BEGIN
                    "Pass to Sales/Marketing" := FALSE;
                    "Problem Vehicle" := TRUE;
                    "OK Value" := "OK Value" + 1;
                  END ELSE BEGIN
                    "Problem Vehicle" := FALSE;
                    IF "OK Value" <> 0 THEN
                    "OK Value" := "OK Value" - 1;
                  END;

                  IF "OK Value" <> 0 THEN
                    IF Fixed = FALSE THEN
                    "Pass to Sales/Marketing" := FALSE;

                  IF "OK Value" = 0 THEN
                    "Pass to Sales/Marketing" := TRUE;
              end; */
        }
        field(61; "Battery terminals torque"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Battery terminals torque" = "Battery terminals torque"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(62; "Fuse Box"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Fuse Box" = "Fuse Box"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(63; "Engine warm up"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*    trigger OnValidate()
               begin
                   TESTFIELD("VRI Inspector Code");
                   TESTFIELD("VRI Supervisor No");
                   TESTFIELD("VRI Date");
                   IF "Engine warm up" = "Engine warm up"::"Not OK" THEN BEGIN
                     "Pass to Sales/Marketing" := FALSE;
                     "Problem Vehicle" := TRUE;
                     "OK Value" := "OK Value" + 1;
                   END ELSE BEGIN
                     "Problem Vehicle" := FALSE;
                     IF "OK Value" <> 0 THEN
                     "OK Value" := "OK Value" - 1;
                   END;

                   IF "OK Value" <> 0 THEN
                     IF Fixed = FALSE THEN
                     "Pass to Sales/Marketing" := FALSE;

                   IF "OK Value" = 0 THEN
                     "Pass to Sales/Marketing" := TRUE;
               end; */
        }
        field(64; Lubrication; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /* trigger OnValidate()
            begin
                TESTFIELD("VRI Inspector Code");
                TESTFIELD("VRI Supervisor No");
                TESTFIELD("VRI Date");
                IF Lubrication = Lubrication::"Not OK" THEN BEGIN
                  "Pass to Sales/Marketing" := FALSE;
                  "Problem Vehicle" := TRUE;
                  "OK Value" := "OK Value" + 1;
                END ELSE BEGIN
                  "Problem Vehicle" := FALSE;
                  IF "OK Value" <> 0 THEN
                  "OK Value" := "OK Value" - 1;
                END;

                IF "OK Value" <> 0 THEN
                  IF Fixed = FALSE THEN
                  "Pass to Sales/Marketing" := FALSE;

                IF "OK Value" = 0 THEN
                  "Pass to Sales/Marketing" := TRUE;
            end; */
        }
        field(65; "Wiper washer"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /* trigger OnValidate()
            begin
                TESTFIELD("VRI Inspector Code");
                TESTFIELD("VRI Supervisor No");
                TESTFIELD("VRI Date");
                IF "Wiper washer" = "Wiper washer"::"Not OK" THEN BEGIN
                  "Pass to Sales/Marketing" := FALSE;
                  "Problem Vehicle" := TRUE;
                  "OK Value" := "OK Value" + 1;
                END ELSE BEGIN
                  "Problem Vehicle" := FALSE;
                  IF "OK Value" <> 0 THEN
                  "OK Value" := "OK Value" - 1;
                END;

                IF "OK Value" <> 0 THEN
                  IF Fixed = FALSE THEN
                  "Pass to Sales/Marketing" := FALSE;

                IF "OK Value" = 0 THEN
                  "Pass to Sales/Marketing" := TRUE;
            end; */
        }
        field(66; "Water coolant"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Water coolant" = "Water coolant"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(67; "Power steering"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /* trigger OnValidate()
            begin
                TESTFIELD("VRI Inspector Code");
                TESTFIELD("VRI Supervisor No");
                TESTFIELD("VRI Date");
                IF "Power steering" = "Power steering"::"Not OK" THEN BEGIN
                  "Pass to Sales/Marketing" := FALSE;
                  "Problem Vehicle" := TRUE;
                  "OK Value" := "OK Value" + 1;
                END ELSE BEGIN
                  "Problem Vehicle" := FALSE;
                  IF "OK Value" <> 0 THEN
                  "OK Value" := "OK Value" - 1;
                END;

                IF "OK Value" <> 0 THEN
                  IF Fixed = FALSE THEN
                  "Pass to Sales/Marketing" := FALSE;

                IF "OK Value" = 0 THEN
                  "Pass to Sales/Marketing" := TRUE;
            end; */
        }
        field(68; "Battery electrolyte"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Battery electrolyte" = "Battery electrolyte"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(69; "Fusible link"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Fusible link" = "Fusible link"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(70; "Warranty booklet"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /* trigger OnValidate()
            begin
                TESTFIELD("VRI Inspector Code");
                TESTFIELD("VRI Supervisor No");
                TESTFIELD("VRI Date");
                IF "Warranty booklet" = "Warranty booklet"::"Not OK" THEN BEGIN
                  "Pass to Sales/Marketing" := FALSE;
                  "Problem Vehicle" := TRUE;
                  "OK Value" := "OK Value" + 1;
                END ELSE BEGIN
                  "Problem Vehicle" := FALSE;
                  IF "OK Value" <> 0 THEN
                  "OK Value" := "OK Value" - 1;
                END;

                IF "OK Value" <> 0 THEN
                  IF Fixed = FALSE THEN
                  "Pass to Sales/Marketing" := FALSE;

                IF "OK Value" = 0 THEN
                  "Pass to Sales/Marketing" := TRUE;
            end; */
        }
        field(71; "Service sticker"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*       trigger OnValidate()
                  begin
                      TESTFIELD("VRI Inspector Code");
                      TESTFIELD("VRI Supervisor No");
                      TESTFIELD("VRI Date");
                      IF "Service sticker" = "Service sticker"::"Not OK" THEN BEGIN
                        "Pass to Sales/Marketing" := FALSE;
                        "Problem Vehicle" := TRUE;
                        "OK Value" := "OK Value" + 1;
                      END ELSE BEGIN
                        "Problem Vehicle" := FALSE;
                        IF "OK Value" <> 0 THEN
                        "OK Value" := "OK Value" - 1;
                      END;

                      IF "OK Value" <> 0 THEN
                        IF Fixed = FALSE THEN
                        "Pass to Sales/Marketing" := FALSE;

                      IF "OK Value" = 0 THEN
                        "Pass to Sales/Marketing" := TRUE;
                  end; */
        }
        field(72; "Owners manual"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /* trigger OnValidate()
            begin
                TESTFIELD("VRI Inspector Code");
                TESTFIELD("VRI Supervisor No");
                TESTFIELD("VRI Date");
                IF "Owners manual" = "Owners manual"::"Not OK" THEN BEGIN
                  "Pass to Sales/Marketing" := FALSE;
                  "Problem Vehicle" := TRUE;
                  "OK Value" := "OK Value" + 1;
                END ELSE BEGIN
                  "Problem Vehicle" := FALSE;
                  IF "OK Value" <> 0 THEN
                  "OK Value" := "OK Value" - 1;
                END;

                IF "OK Value" <> 0 THEN
                  IF Fixed = FALSE THEN
                  "Pass to Sales/Marketing" := FALSE;

                IF "OK Value" = 0 THEN
                  "Pass to Sales/Marketing" := TRUE;
            end; */
        }
        field(73; "Key/Transmitter Operation"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";
            /*       trigger OnValidate()
                  begin
                      TESTFIELD("VRI Inspector Code");
                      TESTFIELD("VRI Supervisor No");
                      TESTFIELD("VRI Date");
                      IF "Key/Transmitter Operation" = "Key/Transmitter Operation"::"Not OK" THEN BEGIN
                        "Pass to Sales/Marketing" := FALSE;
                        "Problem Vehicle" := TRUE;
                        "OK Value" := "OK Value" + 1;
                      END ELSE BEGIN
                        "Problem Vehicle" := FALSE;
                        IF "OK Value" <> 0 THEN
                        "OK Value" := "OK Value" - 1;
                      END;

                      IF "OK Value" <> 0 THEN
                        IF Fixed = FALSE THEN
                        "Pass to Sales/Marketing" := FALSE;

                      IF "OK Value" = 0 THEN
                        "Pass to Sales/Marketing" := TRUE;
                  end; */
        }
        field(74; "Meters at Dashboard"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*    trigger OnValidate()
               begin
                   TESTFIELD("VRI Inspector Code");
                   TESTFIELD("VRI Supervisor No");
                   TESTFIELD("VRI Date");
                   IF "Meters at Dashboard" = "Meters at Dashboard"::"Not OK" THEN BEGIN
                     "Pass to Sales/Marketing" := FALSE;
                     "Problem Vehicle" := TRUE;
                     "OK Value" := "OK Value" + 1;
                   END ELSE BEGIN
                     "Problem Vehicle" := FALSE;
                     IF "OK Value" <> 0 THEN
                     "OK Value" := "OK Value" - 1;
                   END;

                   IF "OK Value" <> 0 THEN
                     IF Fixed = FALSE THEN
                     "Pass to Sales/Marketing" := FALSE;

                   IF "OK Value" = 0 THEN
                     "Pass to Sales/Marketing" := TRUE;
               end; */
        }
        field(75; "Hood opening"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*      trigger OnValidate()
                 begin
                     TESTFIELD("VRI Inspector Code");
                     TESTFIELD("VRI Supervisor No");
                     TESTFIELD("VRI Date");
                     IF "Hood opening" = "Hood opening"::"Not OK" THEN BEGIN
                       "Pass to Sales/Marketing" := FALSE;
                       "Problem Vehicle" := TRUE;
                       "OK Value" := "OK Value" + 1;
                     END ELSE BEGIN
                       "Problem Vehicle" := FALSE;
                       IF "OK Value" <> 0 THEN
                       "OK Value" := "OK Value" - 1;
                     END;

                     IF "OK Value" <> 0 THEN
                       IF Fixed = FALSE THEN
                       "Pass to Sales/Marketing" := FALSE;

                     IF "OK Value" = 0 THEN
                       "Pass to Sales/Marketing" := TRUE;
                 end; */
        }
        field(76; "Fuel Tank"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*   trigger OnValidate()
              begin
                  TESTFIELD("VRI Inspector Code");
                  TESTFIELD("VRI Supervisor No");
                  TESTFIELD("VRI Date");
                  IF "Fuel Tank" = "Fuel Tank"::"Not OK" THEN BEGIN
                    "Pass to Sales/Marketing" := FALSE;
                    "Problem Vehicle" := TRUE;
                    "OK Value" := "OK Value" + 1;
                  END ELSE BEGIN
                    "Problem Vehicle" := FALSE;
                    IF "OK Value" <> 0 THEN
                    "OK Value" := "OK Value" - 1;
                  END;

                  IF "OK Value" <> 0 THEN
                    IF Fixed = FALSE THEN
                    "Pass to Sales/Marketing" := FALSE;

                  IF "OK Value" = 0 THEN
                    "Pass to Sales/Marketing" := TRUE;
              end; */
        }
        field(77; "Trunk lid"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*   trigger OnValidate()
              begin
                  TESTFIELD("VRI Inspector Code");
                  TESTFIELD("VRI Supervisor No");
                  TESTFIELD("VRI Date");
                  IF "Trunk lid" = "Trunk lid"::"Not OK" THEN BEGIN
                    "Pass to Sales/Marketing" := FALSE;
                    "Problem Vehicle" := TRUE;
                    "OK Value" := "OK Value" + 1;
                  END ELSE BEGIN
                    "Problem Vehicle" := FALSE;
                    IF "OK Value" <> 0 THEN
                    "OK Value" := "OK Value" - 1;
                  END;

                  IF "OK Value" <> 0 THEN
                    IF Fixed = FALSE THEN
                    "Pass to Sales/Marketing" := FALSE;

                  IF "OK Value" = 0 THEN
                    "Pass to Sales/Marketing" := TRUE;
              end; */
        }
        field(78; "Car Stereo"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Car Stereo" = "Car Stereo"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(79; "Lights operation"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Lights operation" = "Lights operation"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(80; "Wipers operation"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*    trigger OnValidate()
               begin
                   TESTFIELD("VRI Inspector Code");
                   TESTFIELD("VRI Supervisor No");
                   TESTFIELD("VRI Date");
                   IF "Wipers operation" = "Wipers operation"::"Not OK" THEN BEGIN
                     "Pass to Sales/Marketing" := FALSE;
                     "Problem Vehicle" := TRUE;
                     "OK Value" := "OK Value" + 1;
                   END ELSE BEGIN
                     "Problem Vehicle" := FALSE;
                     IF "OK Value" <> 0 THEN
                     "OK Value" := "OK Value" - 1;
                   END;

                   IF "OK Value" <> 0 THEN
                     IF Fixed = FALSE THEN
                     "Pass to Sales/Marketing" := FALSE;

                   IF "OK Value" = 0 THEN
                     "Pass to Sales/Marketing" := TRUE;
               end; */
        }
        field(81; "Seat belts Operation"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Seat belts Operation" = "Seat belts Operation"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(82; "Seat operation"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*        trigger OnValidate()
                   begin
                       TESTFIELD("VRI Inspector Code");
                       TESTFIELD("VRI Supervisor No");
                       TESTFIELD("VRI Date");
                       IF "Seat operation" = "Seat operation"::"Not OK" THEN BEGIN
                         "Pass to Sales/Marketing" := FALSE;
                         "Problem Vehicle" := TRUE;
                         "OK Value" := "OK Value" + 1;
                       END ELSE BEGIN
                         "Problem Vehicle" := FALSE;
                         IF "OK Value" <> 0 THEN
                         "OK Value" := "OK Value" - 1;
                       END;

                       IF "OK Value" <> 0 THEN
                         IF Fixed = FALSE THEN
                         "Pass to Sales/Marketing" := FALSE;

                       IF "OK Value" = 0 THEN
                         "Pass to Sales/Marketing" := TRUE;
                   end; */
        }
        field(83; "Cigarrette lighter"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*    trigger OnValidate()
               begin
                   TESTFIELD("VRI Inspector Code");
                   TESTFIELD("VRI Supervisor No");
                   TESTFIELD("VRI Date");
                   IF"Cigarrette lighter" = "Cigarrette lighter"::"Not OK" THEN BEGIN
                     "Pass to Sales/Marketing" := FALSE;
                     "Problem Vehicle" := TRUE;
                     "OK Value" := "OK Value" + 1;
                   END ELSE BEGIN
                     "Problem Vehicle" := FALSE;
                     IF "OK Value" <> 0 THEN
                     "OK Value" := "OK Value" - 1;
                   END;

                   IF "OK Value" <> 0 THEN
                     IF Fixed = FALSE THEN
                     "Pass to Sales/Marketing" := FALSE;

                   IF "OK Value" = 0 THEN
                     "Pass to Sales/Marketing" := TRUE;
               end; */
        }
        field(84; "Steering wheel"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*    trigger OnValidate()
               begin
                   TESTFIELD("VRI Inspector Code");
                   TESTFIELD("VRI Supervisor No");
                   TESTFIELD("VRI Date");
                   IF "Steering wheel" = "Steering wheel"::"Not OK" THEN BEGIN
                     "Pass to Sales/Marketing" := FALSE;
                     "Problem Vehicle" := TRUE;
                     "OK Value" := "OK Value" + 1;
                   END ELSE BEGIN
                     "Problem Vehicle" := FALSE;
                     IF "OK Value" <> 0 THEN
                     "OK Value" := "OK Value" - 1;
                   END;

                   IF "OK Value" <> 0 THEN
                     IF Fixed = FALSE THEN
                     "Pass to Sales/Marketing" := FALSE;

                   IF "OK Value" = 0 THEN
                     "Pass to Sales/Marketing" := TRUE;
               end; */
        }
        field(85; "Air condition"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*      trigger OnValidate()
                 begin
                     TESTFIELD("VRI Inspector Code");
                     TESTFIELD("VRI Supervisor No");
                     TESTFIELD("VRI Date");
                     IF "Air condition" = "Air condition"::"Not OK" THEN BEGIN
                       "Pass to Sales/Marketing" := FALSE;
                       "Problem Vehicle" := TRUE;
                       "OK Value" := "OK Value" + 1;
                     END ELSE BEGIN
                       "Problem Vehicle" := FALSE;
                       IF "OK Value" <> 0 THEN
                       "OK Value" := "OK Value" - 1;
                     END;

                     IF "OK Value" <> 0 THEN
                       IF Fixed = FALSE THEN
                       "Pass to Sales/Marketing" := FALSE;

                     IF "OK Value" = 0 THEN
                       "Pass to Sales/Marketing" := TRUE;
                 end; */
        }
        field(86; "Sun roof"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*   trigger OnValidate()
              begin
                  TESTFIELD("VRI Inspector Code");
                  TESTFIELD("VRI Supervisor No");
                  TESTFIELD("VRI Date");
                  IF "Sun roof" = "Sun roof"::"Not OK" THEN BEGIN
                    "Pass to Sales/Marketing" := FALSE;
                    "Problem Vehicle" := TRUE;
                    "OK Value" := "OK Value" + 1;
                  END ELSE BEGIN
                    "Problem Vehicle" := FALSE;
                    IF "OK Value" <> 0 THEN
                    "OK Value" := "OK Value" - 1;
                  END;

                  IF "OK Value" <> 0 THEN
                    IF Fixed = FALSE THEN
                    "Pass to Sales/Marketing" := FALSE;

                  IF "OK Value" = 0 THEN
                    "Pass to Sales/Marketing" := TRUE;
              end; */
        }
        field(87; "Hand brake"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*     trigger OnValidate()
                begin
                    TESTFIELD("VRI Inspector Code");
                    TESTFIELD("VRI Supervisor No");
                    TESTFIELD("VRI Date");
                    IF "Hand brake" = "Hand brake"::"Not OK" THEN BEGIN
                      "Pass to Sales/Marketing" := FALSE;
                      "Problem Vehicle" := TRUE;
                      "OK Value" := "OK Value" + 1;
                    END ELSE BEGIN
                      "Problem Vehicle" := FALSE;
                      IF "OK Value" <> 0 THEN
                      "OK Value" := "OK Value" - 1;
                    END;

                    IF "OK Value" <> 0 THEN
                      IF Fixed = FALSE THEN
                      "Pass to Sales/Marketing" := FALSE;

                    IF "OK Value" = 0 THEN
                      "Pass to Sales/Marketing" := TRUE;
                end; */
        }
        field(88; Headphone; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF Headphone = Headphone::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(89; "Interior floor mat"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";
            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Interior floor mat" = "Interior floor mat"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(90; "Interior roof"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*    trigger OnValidate()
               begin
                   TESTFIELD("VRI Inspector Code");
                   TESTFIELD("VRI Supervisor No");
                   TESTFIELD("VRI Date");
                   IF "Interior roof" = "Interior roof"::"Not OK" THEN BEGIN
                     "Pass to Sales/Marketing" := FALSE;
                     "Problem Vehicle" := TRUE;
                     "OK Value" := "OK Value" + 1;
                   END ELSE BEGIN
                     "Problem Vehicle" := FALSE;
                     IF "OK Value" <> 0 THEN
                     "OK Value" := "OK Value" - 1;
                   END;

                   IF "OK Value" <> 0 THEN
                     IF Fixed = FALSE THEN
                     "Pass to Sales/Marketing" := FALSE;

                   IF "OK Value" = 0 THEN
                     "Pass to Sales/Marketing" := TRUE;
               end; */
        }
        field(91; "Sun visor"; Option)
        {
            BlankZero = false;
            NotBlank = true;
            OptionMembers = OK,"Not OK","Not Applicable";

            /*      trigger OnValidate()
                 begin
                     TESTFIELD("VRI Inspector Code");
                     TESTFIELD("VRI Supervisor No");
                     TESTFIELD("VRI Date");
                     IF "Sun visor" = "Sun visor"::"Not OK" THEN BEGIN
                       "Pass to Sales/Marketing" := FALSE;
                       "Problem Vehicle" := TRUE;
                       "OK Value" := "OK Value" + 1;
                     END ELSE BEGIN
                       "Problem Vehicle" := FALSE;
                       IF "OK Value" <> 0 THEN
                       "OK Value" := "OK Value" - 1;
                     END;

                     IF "OK Value" <> 0 THEN
                       IF Fixed = FALSE THEN
                       "Pass to Sales/Marketing" := FALSE;

                     IF "OK Value" = 0 THEN
                       "Pass to Sales/Marketing" := TRUE;
                 end; */
        }
        field(92; "Inner Mirror"; Boolean)
        {
            BlankZero = true;

            /* trigger OnValidate()
            begin
                TESTFIELD("VRI Inspector Code");
                TESTFIELD("VRI Supervisor No");
                TESTFIELD("VRI Date");

                IF "OK Value" <> 0 THEN
                  IF Fixed = FALSE THEN
                  "Pass to Sales/Marketing" := FALSE;

                IF "OK Value" = 0 THEN
                  "Pass to Sales/Marketing" := TRUE;
            end; */
        }
        field(94; "VRI Approval Name"; Text[30])
        {
        }
        field(95; "VRI Approved Date"; Date)
        {
        }
        field(96; "Workshop Approval"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Workshop Approval" = TRUE
                THEN
                    TESTFIELD("Op./Log.  Approval")
                ELSE
                    VALIDATE("Workshop Approval", FALSE);
            end;
        }
        field(97; "Op./Log Approval Name"; Text[30])
        {
        }
        field(98; "Op.t/Log Approval Date"; Date)
        {
        }
        field(99; "Comment to WorkshopII"; Text[100])
        {
        }
        field(100; "Workshop Approval Date"; Date)
        {
        }
        field(101; "Comment to Workshop"; Text[100])
        {
        }
        field(102; "Op./Log Approval Comment"; Text[100])
        {
        }
        field(103; "Open COF"; Boolean)
        {

            /*    trigger OnValidate()
               begin
                   TESTFIELD("Send to Workshop Aprroval",TRUE);
                   IF "Responsible Customer" = '' THEN
                   ERROR('You must specify the responsible customer!');

                   IF "COF No" <> '' THEN ERROR('COF has been created before!') ELSE
                   BEGIN
                   IF NOT ServiceItem.GET("VRI Code") THEN
                   BEGIN
                     TESTFIELD("Responsible Customer");
                     ServiceItem.INIT;
                     ServiceItem."No.":= "VRI Code";
                     ServiceItem."Model No.":="Model No.";
                     ServiceItem.Make:="Model Name";
                     ServiceItem."Engine No.":="Engine No.";
                     ServiceItem."Serial No." := "Item Serial No.";

                     ServiceItem.VALIDATE(ServiceItem."Customer No.","Responsible Customer");
                     ServiceItem.INSERT(TRUE);
                   END;

                     COFrec.INIT;
                     COFrec.VALIDATE(COFrec."Customer No.","Customer Account");
                     COFrec.VALIDATE(COFrec."Vehicle Registration No.","VRI Code");
                     COFrec.VALIDATE(COFrec."Job Details","Comment to Workshop");
                     COFrec.VALIDATE(COFrec."COF Origin","COF Origin"::VRI);
                     COFrec."Frame No./VIN":= "Item Serial No.";
                     COFrec."(Engine No)":= "Engine No.";
                     COFrec."Model Name":= "Model Name";
                     Servicesetup.GET();
                     Servicesetup.TESTFIELD(Servicesetup.VCOF);
                     COFrec."No. Series" := Servicesetup.VCOF;
                     COFrec.INSERT(TRUE);
                     "COF No" := COFrec."Customer Order Form No.";
                     "COF Creation Date" := CURRENTDATETIME;
                     "COF Created By" := USERID;
                   END;

                   IF "Responsible Customer" ='970000' THEN BEGIN  //VRI-TNL (Non-Recoverable)
                       "VRI Approved Ok" := TRUE;
                       "VRI Approved Ok By" := 'SYSTEM';
                       "Estimate Approved" := TRUE;
                       "Estimate Approve By" := 'SYSTEM';
                       "Estimate Approve Date&Time" := CURRENTDATETIME;
                       MODIFY;
                   END;
               end; */
        }
        field(104; "VRI Next Action"; Option)
        {
            BlankZero = true;
            OptionCaption = ' ,Pending Waranty,Send to operation& Logistic';
            OptionMembers = " ","Pending Waranty","Send to operation& Logistic";

            /*   trigger OnValidate()
              begin
                  IF "VRI Next Action" = "VRI Next Action"::"Pending Waranty" THEN BEGIN
                       UserSetup.GET(USERID);
                       SenderEmail := UserSetup."E-Mail";
                       ToName  :='eot@toyotanigeria.com';
                       Subject := STRSUBSTNO(Text011,"VRI Code");
                       Body:=  STRSUBSTNO( Text013,"VRI Code");
                       //mailsent := approvalmessage.NewMessage(ToName,CCName,Bcc,Subject,Body,attachement,TRUE);
                       SMTPMail.CreateMessage (USERID,SenderEmail,ToName,Subject,Body,FALSE);
                        SMTPMail.Send;
                        MESSAGE('Mail sent successfully');
                       VALIDATE("Responsible Customer",'980000');
                  END;
              end; */
        }
        field(105; "Logistic Action"; Option)
        {
            BlankZero = true;
            OptionCaption = ' ,Pending Insurance,Send to VRI,Send to Waranty';
            OptionMembers = " ","Pending Insurance","Send to VRI","Send to Waranty";
        }
        field(106; "Responsible Customer"; Code[20])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                IF CustRec.GET("Responsible Customer") THEN BEGIN
                    "Responsible Customer Name" := CustRec.Name;
                    CustRec.INIT;
                    CustRec.VALIDATE(CustRec."No.", "Customer Account");
                    ServiceItem.VALIDATE(ServiceItem."Chasis No.", "VRI Code");
                END;
            end;
        }
        field(107; "Responsible Customer Name"; Text[30])
        {
        }
        field(108; "VRI Request Date&Time"; DateTime)
        {
        }
        field(109; "Log. Approval Date&Time"; DateTime)
        {
        }
        field(110; "Pass to Sales/Marketing"; Boolean)
        {
            Editable = true;

            trigger OnValidate()
            begin
                TESTFIELD("VRI Inspector Code");
                TESTFIELD("VRI Supervisor No");
                TESTFIELD("VRI Date");
            end;
        }
        field(111; "VRI  Type"; Option)
        {
            BlankZero = true;
            OptionCaption = ',VRI Internal,VRI External';
            OptionMembers = ,"VRI Internal","VRI External";
        }
        field(112; "Customer Type"; Option)
        {
            BlankZero = true;
            OptionCaption = ',Insurance,Warranty,Internal';
            OptionMembers = ,Insurance,Warranty,Internal;
        }
        field(113; "Receipt No."; Code[20])
        {
            TableRelation = "Purchase Header"."No.";
        }
        field(114; "Problem Vehicle"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Problem Vehicle" THEN BEGIN
                    TESTFIELD("VRI Inspector Code");
                    TESTFIELD("VRI Supervisor No");
                    TESTFIELD("VRI Date");
                END
            end;
        }
        field(115; "VRI Inspector Code"; Code[10])
        {
            TableRelation = "VRI Inspector".Code WHERE(Status = CONST(Inspector));

            /*  trigger OnValidate()
             begin
                 IF VRec.GET("VRI Inspector Code") THEN
                   BEGIN
                    "VRI Inspector Name":=VRec.Name;
                    "VRI Inspector Department":=VRec.Department;
                    "VRI Operative Location":=VRec.Location;
                    "VRI Operative Unit":=VRec.Unit;
                    "VRI Inspector Address":=VRec.Address;
                    "VRI Inspector Phone No.":=VRec."Phone Nos";
                   END;
             end; */
        }
        field(116; "VRI Inspector Name"; Text[30])
        {
        }
        field(117; "VRI Inspector Department"; Text[30])
        {
        }
        field(118; "VRI Operative Location"; Text[30])
        {
        }
        field(119; "VRI Operative Unit"; Text[30])
        {
        }
        field(120; "O/Log Comment"; Text[200])
        {
        }
        field(121; "Comment(Warantty)"; Text[200])
        {
        }
        field(122; "O/Log Comment2"; Text[200])
        {
        }
        field(123; "Problem Statement from VRI"; Text[200])
        {
        }
        field(124; "Send For Approval"; Boolean)
        {

            /*     trigger OnValidate()
                begin
                    TESTFIELD("Problem Vehicle");
                    TESTFIELD("Pass to Sales/Marketing",FALSE);
                    TESTFIELD("Send to Workshop Aprroval",FALSE);
                    TESTFIELD("Op./Log.  Approval",FALSE);
                    TESTFIELD("Send VRI Request",FALSE);
                    TESTFIELD(Delivered,FALSE);
                    TESTFIELD("Open COF",FALSE);
                    TESTFIELD("Estimate Approved",FALSE);
                    TESTFIELD(Arrived,TRUE);
                    TESTFIELD("Problem Vehicle",TRUE);
                end; */
        }
        field(125; "Approved for Sales&Mkt"; Boolean)
        {

            /*   trigger OnValidate()
              begin
                  IF "Approved for Sales&Mkt" THEN
                    IF (Fixed = FALSE) AND ("Not Fixed" = FALSE) THEN
                      ERROR('Please specify if vehicle is Fixed or Not Fixed!');


                  UserRec.GET(USERID);
                  IF NOT UserRec."Approved for Sales&Mkt" THEN
                    ERROR('Unauthorized action. Contact your system administrator!');

                  IF UserRec."User ID" = 'ALAMU' THEN
                    IF "Problem Vehicle" = TRUE THEN
                      ERROR('Unauthorized action. Contact your system administrator!');

                  IF "Approved for Sales&Mkt"  = TRUE THEN
                  BEGIN
                    UserRec.GET(USERID);
                    "Approve for Sales&mkt By" := USERID;
                    "Approved Date&Time" := CURRENTDATETIME;
                    "Pass to Sales/Marketing":=TRUE;
                  END ELSE BEGIN
                    "Approve for Sales&mkt By" := USERID;
                    "Approved Date&Time" := CURRENTDATETIME;
                    "Pass to Sales/Marketing":=FALSE;
                  END;
              end; */
        }
        field(126; "Approved for Workshop"; Boolean)
        {
        }
        field(127; "Good for Sales&Mkt"; Boolean)
        {
        }
        field(128; "O/L Approv for Workshp"; Boolean)
        {
        }
        field(129; "Send Request to Logistics"; Boolean)
        {
        }
        field(130; Estimate; Code[10])
        {
        }
        field(131; "Send For Approval 2"; Integer)
        {
            /* CalcFormula = Count("VRI Table" WHERE (Arrived=CONST(Yes),
                                                   Problem Vehicle=CONST(Yes),
                                                   Pass to Sales/Marketing=CONST(No),
                                                   Send For Approval=CONST(Yes),
                                                   Send VRI Request=CONST(No),
                                                   Op./Log.  Approval=CONST(No),
                                                   Send to Workshop Aprroval=CONST(No),
                                                   Open COF=CONST(No),
                                                   Estimate Approved=CONST(No),
                                                   Delivered=CONST(No),
                                                   VRI Location=FIELD(Location Filter),
                                                   Model Name=FIELD(Model Filter)));
            Description = 'check later';
            FieldClass = FlowField; */
        }
        field(132; "PENDING LOG  Approval COUNT"; Integer)
        {
            /* CalcFormula = Count("VRI Table" WHERE (Arrived=CONST(Yes),
                                                   Problem Vehicle=CONST(Yes),
                                                   Pass to Sales/Marketing=CONST(No),
                                                   Send For Approval=CONST(Yes),
                                                   Send VRI Request=CONST(Yes),
                                                   Op./Log.  Approval=CONST(Yes),
                                                   Send to Workshop Aprroval=CONST(No),
                                                   Open COF=CONST(No),
                                                   Estimate Approved=CONST(No),
                                                   Delivered=CONST(No),
                                                   VRI Location=FIELD(Location Filter),
                                                   Model Name=FIELD(Model Filter)));
            Description = 'k';
            FieldClass = FlowField; */
        }
        field(133; "Send to Workshop"; Integer)
        {
            /* CalcFormula = Count("VRI Table" WHERE (Arrived=CONST(Yes),
                                                   Problem Vehicle=CONST(Yes),
                                                   Pass to Sales/Marketing=CONST(No),
                                                   Send For Approval=CONST(Yes),
                                                   Send VRI Request=CONST(Yes),
                                                   Op./Log.  Approval=CONST(Yes),
                                                   Send to Workshop Aprroval=CONST(Yes),
                                                   Open COF=CONST(No),
                                                   Estimate Approved=CONST(No),
                                                   Delivered=CONST(No),
                                                   VRI Location=FIELD(Location Filter),
                                                   Model Name=FIELD(Model Filter),
                                                   Sold=CONST(No)));
            Description = 'k';
            FieldClass = FlowField; */
        }
        field(134; "Open COF  Approval"; Integer)
        {
            /* CalcFormula = Count("VRI Table" WHERE (Arrived=CONST(Yes),
                                                   Problem Vehicle=CONST(Yes),
                                                   Pass to Sales/Marketing=CONST(No),
                                                   Send For Approval=CONST(Yes),
                                                   Send VRI Request=CONST(Yes),
                                                   Op./Log.  Approval=CONST(Yes),
                                                   Send to Workshop Aprroval=CONST(Yes),
                                                   Open COF=CONST(Yes),
                                                   VRI Approved Ok=CONST(No),
                                                   Delivered=CONST(No),
                                                   VRI Location=FIELD(Location Filter),
                                                   Model Name=FIELD(Model Filter),
                                                   Estimate Approved=CONST(No),
                                                   Send for Est. Verification=CONST(No),
                                                   Sold=CONST(No)));
            Description = 'k';
            FieldClass = FlowField; */
        }
        field(135; "Pass to Sales/MarketingCOUNT"; Integer)
        {
            /* CalcFormula = Count("VRI Table" WHERE (Arrived=CONST(Yes),
                                                   Pass to Sales/Marketing=CONST(Yes),
                                                   VRI Location=FIELD(Location Filter),
                                                   Model Name=FIELD(Model Filter),
                                                   Transferred=CONST(Yes),
                                                   Sold=CONST(No)));
            Description = 'k';
            FieldClass = FlowField; */
        }
        field(136; "Problem Vehicle COUNT"; Integer)
        {
            /* CalcFormula = Count("VRI Table" WHERE (Arrived=CONST(Yes),
                                                   Problem Vehicle=CONST(Yes),
                                                   Pass to Sales/Marketing=CONST(No),
                                                   Send For Approval=CONST(No),
                                                   Send VRI Request=CONST(No),
                                                   Op./Log.  Approval=CONST(No),
                                                   Send to Workshop Aprroval=CONST(No),
                                                   Open COF=CONST(No),
                                                   Estimate Approved=CONST(No),
                                                   Delivered=CONST(No),
                                                   VRI Location=FIELD(Location Filter),
                                                   Model Name=FIELD(Model Filter),
                                                   Sold=CONST(No)));
            Description = 'k';
            FieldClass = FlowField; */
        }
        field(137; "Pending VRI Approval COUNT"; Integer)
        {
            /* CalcFormula = Count("VRI Table" WHERE (Arrived=CONST(Yes),
                                                   Problem Vehicle=CONST(Yes),
                                                   Pass to Sales/Marketing=CONST(No),
                                                   Send For Approval=CONST(Yes),
                                                   Send VRI Request=CONST(Yes),
                                                   Op./Log.  Approval=CONST(No),
                                                   Send to Workshop Aprroval=CONST(No),
                                                   Open COF=CONST(No),
                                                   Estimate Approved=CONST(No),
                                                   Delivered=CONST(No),
                                                   VRI Location=FIELD(Location Filter),
                                                   Model Name=FIELD(Model Filter),
                                                   Sold=CONST(No)));
            Description = 'k';
            FieldClass = FlowField; */
        }
        field(138; "Estimate Approval"; Integer)
        {
            /* CalcFormula = Count("VRI Table" WHERE (Arrived=CONST(Yes),
                                                   Problem Vehicle=CONST(Yes),
                                                   Pass to Sales/Marketing=CONST(No),
                                                   Send For Approval=CONST(Yes),
                                                   Send VRI Request=CONST(Yes),
                                                   Op./Log.  Approval=CONST(Yes),
                                                   Send to Workshop Aprroval=CONST(Yes),
                                                   Open COF=CONST(Yes),
                                                   VRI Approved Ok=CONST(Yes),
                                                   Delivered=CONST(No),
                                                   VRI Location=FIELD(Location Filter),
                                                   Model Name=FIELD(Model Filter),
                                                   Estimate Approved=CONST(No),
                                                   Sold=CONST(No)));
            Description = 'k';
            FieldClass = FlowField; */
        }
        field(139; Comment; Boolean)
        {
            /* CalcFormula = Exist("Service Comment Line" WHERE (Table Name=CONST(7),
                                                              Table Subtype=CONST(0),
                                                              No.=FIELD(VRI Code),
                                                              Type=CONST(6)));
            Editable = false;
            FieldClass = FlowField; */
        }
        field(140; "Job Estimate Value"; Decimal)
        {
            CalcFormula = Sum("Customer Order Line"."Amount Inc. VAT" WHERE("Customer Order Form No." = FIELD("COF No")));
            Editable = false;
            FieldClass = FlowField;
            TableRelation = "Customer Order Table.".Estimation;
        }
        field(141; "VRI Inspector Address"; Text[50])
        {
        }
        field(142; "VRI Inspector Phone No."; Text[30])
        {
        }
        field(143; "Send to Workshop Aprroval"; Boolean)
        {

            /*   trigger OnValidate()
              begin
                  TESTFIELD("Op./Log.  Approval",TRUE);
                    "Send to Workshop By":=USERID;
                    "Send to Workshp Date&time":=CURRENTDATETIME;
                    "Comment to WorkshopII":="Comment to Workshop";
                    Servicesetup.GET;
                    ToName  := 'adeyemi@toyotanigeria.com';
                    CCName := 'eot@toyotanigeria.com';
                    Bcc:= '';
                    Subject := STRSUBSTNO(Text005,"VRI Code");
                    Body += STRSUBSTNO(Text006,"VRI Code","Comment to WorkshopII");
                    NL := 10;
                    LF := 13;
                    Body += 'We hereby request the following:';
                    Body += FORMAT(NL)+FORMAT(LF);
                    Body += "Comment to WorkshopII";
                    Body += FORMAT(NL)+FORMAT(LF);
                    Body += 'Kindly attend to this request with urgency.';
                    UserSetup.GET(USERID);
                    SenderEmail := UserSetup."E-Mail";
                    SenderInitial := UserSetup2.Initials;
                    Initials := UserSetup.Initials;

                    WITH TempEmailItem DO BEGIN
                      "Send to" := ToName;
                      "Send CC" := SenderEmail + ';' + CCName;
                      "Send BCC" := '';
                      Subject := STRSUBSTNO(Text005,"VRI Code");

                      CRLF := '';
                      CRLF[1] := 13;
                      CRLF[2] := 10;

                      BodyBlob.Blob.CREATEOUTSTREAM(BodyStream);
                      BodyStream.WRITETEXT(Text016 + 'Sir,');
                      BodyStream.WRITETEXT(CRLF + CRLF);
                      BodyStream.WRITETEXT(STRSUBSTNO(Text006,"VRI Code","Comment to WorkshopII") + CRLF + CRLF +
                      CRLF + CRLF +
                      'Kindly attend to this request with urgency.' + CRLF + CRLF +
                      Text017 + CRLF);
                      BodyStream.WRITETEXT(SenderInitial);
                      BodyStream.WRITETEXT(CRLF + CRLF);
                      BodyStream.WRITETEXT('This is a system generated mail. Please do not reply to this email ID.');
                      Body := BodyBlob.Blob;
                      Send(FALSE);
                    END;
              end; */
        }
        field(144; "Part Order"; Boolean)
        {
        }
        field(145; "Part Arrival"; Boolean)
        {
        }
        field(146; "For Production"; Boolean)
        {
        }
        field(147; "Estimate Approved"; Boolean)
        {

            /*       trigger OnValidate()
                  begin
                      IF "Claim No." = '' THEN
                      ERROR('Claim No. can not be blank!');

                      IF "Estimate Approved" THEN BEGIN
                       "Estimate Approve By":=USERID;
                       "Estimate Approve Date&Time":=CURRENTDATETIME;

                      IF COFrec.GET("COF No") THEN
                       COFrec.VALIDATE(COFrec."VRI Estimate Approved",TRUE);
                       COFrec.MODIFY;
                      END ELSE BEGIN
                       IF COFrec.GET("COF No") THEN
                       COFrec.VALIDATE(COFrec."VRI Estimate Approved",FALSE);
                       COFrec.MODIFY;
                      END;
                        Servicesetup.GET;
                        ToName  :=Servicesetup."Estimate Approved";
                        CCName := 'eot@toyotanigeria.com';
                        Subject := STRSUBSTNO(Text011,"VRI Code");
                        Body:=  STRSUBSTNO( Text012,"VRI Code","O/Log Comment");
                        UserSetup.GET(USERID);
                        SenderEmail := UserSetup."E-Mail";

                        SenderInitial := UserSetup2.Initials;
                        Initials := UserSetup.Initials;

                        WITH TempEmailItem DO BEGIN
                          "Send to" := ToName;
                          "Send CC" := SenderEmail + ';' + CCName;
                          "Send BCC" := '';
                          Subject := STRSUBSTNO(Text011,"VRI Code");

                          CRLF := '';
                          CRLF[1] := 13;
                          CRLF[2] := 10;

                          BodyBlob.Blob.CREATEOUTSTREAM(BodyStream);
                          BodyStream.WRITETEXT(Text016 + 'Sir,');
                          BodyStream.WRITETEXT(CRLF + CRLF);
                          BodyStream.WRITETEXT(STRSUBSTNO(Text011,"VRI Code","O/Log Comment") + CRLF + CRLF +
                          CRLF + CRLF +
                          'Kindly attend to this request with urgency.' + CRLF + CRLF +
                          Text017 + CRLF);
                          BodyStream.WRITETEXT(SenderInitial);
                          BodyStream.WRITETEXT(CRLF + CRLF);
                          BodyStream.WRITETEXT('This is a system generated mail. Please do not reply to this email ID.');
                          Body := BodyBlob.Blob;
                          Send(FALSE);
                        END;
                  end; */
        }
        field(148; Arrived; Boolean)
        {

            /*   trigger OnValidate()
              begin
                  IF Arrived = TRUE THEN BEGIN
                  "Arrive Approve by":=USERID;
                  "Time of Arrival":=TIME;
                  "Date Of Arrival":=TODAY;
                  END ELSE BEGIN
                  "Arrive Approve by":=USERID;
                  "Time of Arrival":=0T;
                  "Date Of Arrival":=0D;
                  END;
              end; */
        }
        field(149; "VRI Supervisor No"; Code[20])
        {
            TableRelation = "VRI Inspector".Code WHERE(Status = CONST(Supervisor));

            /* trigger OnValidate()
            begin
                IF VRec.GET("VRI Supervisor No") THEN
                  "VRI Supervisor Name":=VRec.Name;
            end; */
        }
        field(150; "VRI Supervisor Name"; Text[30])
        {
        }
        field(151; Location; Code[20])
        {
            TableRelation = Location.Code;
        }
        field(152; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(153; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(154; "Arrival Inspector"; Code[20])
        {
        }
        field(155; "Time of Arrival"; Time)
        {
        }
        field(156; "Date Of Arrival"; Date)
        {
        }
        field(160; "Send for Approval2"; Boolean)
        {

            trigger OnValidate()
            begin
                /*IF "Send for Approval" = TRUE THEN
                IF UserSetup.GET("1st Approval to") THEN
                  BEGIN
                     Sender := USERID;
                    "Sent Time"  := CURRENTDATETIME;
                    UserSetup2.GET(USERID);
                    SenderEmail := UserSetup2."E-Mail";
                    TESTFIELD(Amount);
                    TESTFIELD("1st Approval to");
                    TESTFIELD("1st Apprv. Status",0);
                     "Current pending Person" := "1st Approval to";
                     ToName  := UserSetup."E-Mail";
                     Subject := STRSUBSTNO(text001,"No.");
                     SMTPMail.CreateMessage(USERID,SenderEmail,ToName,Subject,Body,FALSE);
                      SMTPMail.Send;
                      MESSAGE('Mail sent successfully');
                  END;
                */

            end;
        }
        field(161; Sender; Text[50])
        {
            Editable = true;
        }
        field(162; "Sent Time"; DateTime)
        {
            Editable = false;
        }
        field(183; "PENDING OP/LOG  Approval COUNT"; Integer)
        {
            /*   CalcFormula = Count("VRI Table" WHERE (Send For Approval=CONST(Yes),
                                                     Send Request to Logistics=CONST(No),
                                                     Send VRI Request=CONST(Yes),
                                                     Problem Vehicle=CONST(Yes),
                                                     Op./Log.  Approval=CONST(Yes),
                                                     Pass to Sales/Marketing=CONST(No),
                                                     Workshop Approval=CONST(No),
                                                     Arrived=CONST(Yes),
                                                     VRI Location=FIELD(Location Filter),
                                                     Model Name=FIELD(Model Filter)));
              Description = 'k';
              FieldClass = FlowField; */
        }
        field(184; "Estimate Approve By"; Text[30])
        {
        }
        field(185; "Estimate Approve Date&Time"; DateTime)
        {
        }
        field(186; "Send to Workshop By"; Text[30])
        {
        }
        field(187; "Send to Workshp Date&time"; DateTime)
        {
        }
        field(188; Delivered; Boolean)
        {
        }
        field(189; "Completion of Service Delivrd"; Integer)
        {
            /* CalcFormula = Count("VRI Table" WHERE (Arrived=CONST(Yes),
                                                   Problem Vehicle=CONST(Yes),
                                                   Pass to Sales/Marketing=CONST(No),
                                                   Send For Approval=CONST(Yes),
                                                   Send VRI Request=CONST(Yes),
                                                   Op./Log.  Approval=CONST(Yes),
                                                   Send to Workshop Aprroval=CONST(Yes),
                                                   Open COF=CONST(Yes),
                                                   Estimate Approved=CONST(Yes),
                                                   Delivered=CONST(Yes),
                                                   VRI Location=FIELD(Location Filter),
                                                   Model Name=FIELD(Model Filter)));
            Description = 'k';
            FieldClass = FlowField; */
        }
        field(190; "Pass To Sales JOB DONE"; Integer)
        {
            /* CalcFormula = Count("VRI Table" WHERE (Pass to Sales/Marketing=CONST(Yes),
                                                   VRI Location=FIELD(Location Filter),
                                                   Model Name=FIELD(Model Filter)));
            Description = 'k';
            FieldClass = FlowField; */
        }
        field(191; "VRI Form Arrived count"; Integer)
        {
            /*  CalcFormula = Count("VRI Table" WHERE (Arrived=CONST(Yes),
                                                    Send For Approval=CONST(No),
                                                    VRI Location=FIELD(Location Filter),
                                                    Model Name=FIELD(Model Filter),
                                                    Problem Vehicle=CONST(No),
                                                    Pass to Sales/Marketing=CONST(No),
                                                    Sold=CONST(No)));
             Description = 'k';
             FieldClass = FlowField; */
        }
        field(192; "Arrive Approve by"; Text[30])
        {
        }
        field(193; "OK Value"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(194; "Op/Log Approval Comment2"; Text[200])
        {
        }
        field(195; "Location Filter"; Code[100])
        {
            FieldClass = FlowFilter;
            TableRelation = Location.Code;
        }
        field(196; "Model Filter"; Text[50])
        {
            FieldClass = FlowFilter;
            TableRelation = Model."Model Name";
        }
        field(197; "Product Group"; Code[20])
        {

        }
        field(198; "Exterior Colour Name"; Text[30])
        {
        }
        field(199; "Approve for Sales&mkt By"; Text[30])
        {
        }
        field(200; "Approved Date&Time"; DateTime)
        {
        }
        field(201; "Claim Nos"; Code[20])
        {
        }
        field(202; "Job Estimate ValueII"; Decimal)
        {
        }
        field(203; "VRI Approved Ok"; Boolean)
        {

            /* trigger OnValidate()
            begin
                 "VRI Approved Ok By":=USERID;
                 "VRI Approved OK Date&Time":=CURRENTDATETIME;
                 "Job Estimate ValueII":="Job Estimate Value";
                 "Claim No.":="Claim Nos";

                Servicesetup.GET;
                  ToName  :=Servicesetup."Estimate Approved";
                  CCName := 'eot@toyotanigeria.com';
                  Subject := STRSUBSTNO(Text009,"VRI Code");
                  Body:=  STRSUBSTNO( Text010,"VRI Code","O/Log Comment");
                  UserSetup.GET(USERID);
                  SenderEmail := UserSetup."E-Mail";
                  SenderInitial := UserSetup2.Initials;
                  Initials := UserSetup.Initials;

                  WITH TempEmailItem DO BEGIN
                    "Send to" := ToName;
                    "Send CC" := SenderEmail + ';' + CCName;
                    "Send BCC" := '';
                    Subject := STRSUBSTNO(Text009,"VRI Code");

                    CRLF := '';
                    CRLF[1] := 13;
                    CRLF[2] := 10;

                    BodyBlob.Blob.CREATEOUTSTREAM(BodyStream);
                    BodyStream.WRITETEXT(Text016 + 'Sir,');
                    BodyStream.WRITETEXT(CRLF + CRLF);
                    BodyStream.WRITETEXT(STRSUBSTNO(Text010,"VRI Code","O/Log Comment") + CRLF + CRLF +
                    CRLF + CRLF +
                    'Kindly attend to this request with urgency.' + CRLF + CRLF +
                    Text017 + CRLF);
                    BodyStream.WRITETEXT(SenderInitial);
                    BodyStream.WRITETEXT(CRLF + CRLF);
                    BodyStream.WRITETEXT('This is a system generated mail. Please do not reply to this email ID.');
                    Body := BodyBlob.Blob;
                    Send(FALSE);
                  END;
            end; */
        }
        field(204; "VRI Approved Ok By"; Text[30])
        {
        }
        field(205; "VRI Approved OK Date&Time"; DateTime)
        {
        }
        field(206; "Claim No."; Code[20])
        {
        }
        field(207; "VRI Supervisor"; Code[10])
        {
            TableRelation = "VRI Inspector".Code WHERE(Status = CONST(Supervisor));

            trigger OnValidate()
            begin
                IF VRec.GET("VRI Supervisor") THEN BEGIN
                    "VRI Supervisor Name." := VRec.Name;
                    SETFILTER("Location Filter", VRec.Location);
                END;
            end;
        }
        field(208; "VRI Supervisor Name."; Text[30])
        {
        }
        field(209; "COF Origin"; Option)
        {
            OptionCaption = ' ,VRI,Work Order';
            OptionMembers = " ",VRI,"Work Order";
        }
        field(210; "Port Staff Comment"; Text[50])
        {
        }
        field(211; "Consignment No."; Code[20])
        {
        }
        field(212; "Window winding"; Option)
        {
            OptionMembers = OK,"Not OK","Not Applicable";

            /*    trigger OnValidate()
               begin
                   TESTFIELD("VRI Inspector Code");
                   TESTFIELD("VRI Supervisor No");
                   TESTFIELD("VRI Date");
                   IF "Window winding" = "Window winding"::"Not OK" THEN BEGIN
                     "Pass to Sales/Marketing" := FALSE;
                     "Problem Vehicle" := TRUE;
                     "OK Value" := "OK Value" + 1;
                   END ELSE BEGIN
                     "Problem Vehicle" := FALSE;
                     IF "OK Value" <> 0 THEN
                     "OK Value" := "OK Value" - 1;
                   END;

                   IF "OK Value" <> 0 THEN
                     IF Fixed = FALSE THEN
                     "Pass to Sales/Marketing" := FALSE;

                   IF "OK Value" = 0 THEN
                     "Pass to Sales/Marketing" := TRUE;
               end; */
        }
        field(213; "Side mirror oprtn"; Option)
        {
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Side mirror oprtn" = "Side mirror oprtn"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(214; "Inner lights"; Option)
        {
            OptionMembers = OK,"Not OK","Not Applicable";

            /* trigger OnValidate()
            begin
                TESTFIELD("VRI Inspector Code");
                TESTFIELD("VRI Supervisor No");
                TESTFIELD("VRI Date");
                IF "Inner lights" = "Inner lights"::"Not OK" THEN BEGIN
                  "Pass to Sales/Marketing" := FALSE;
                  "Problem Vehicle" := TRUE;
                  "OK Value" := "OK Value" + 1;
                END ELSE BEGIN
                  "Problem Vehicle" := FALSE;
                  IF "OK Value" <> 0 THEN
                  "OK Value" := "OK Value" - 1;
                END;

                IF "OK Value" <> 0 THEN
                  IF Fixed = FALSE THEN
                  "Pass to Sales/Marketing" := FALSE;

                IF "OK Value" = 0 THEN
                  "Pass to Sales/Marketing" := TRUE;
            end; */
        }
        field(215; "Windscreen Cotton"; Option)
        {
            OptionMembers = OK,"Not OK","Not Applicable";

            /*   trigger OnValidate()
              begin
                  TESTFIELD("VRI Inspector Code");
                  TESTFIELD("VRI Supervisor No");
                  TESTFIELD("VRI Date");
                  IF "Windscreen Cotton" = "Windscreen Cotton"::"Not OK" THEN BEGIN
                    "Pass to Sales/Marketing" := FALSE;
                    "Problem Vehicle" := TRUE;
                    "OK Value" := "OK Value" + 1;
                  END ELSE BEGIN
                    "Problem Vehicle" := FALSE;
                    IF "OK Value" <> 0 THEN
                    "OK Value" := "OK Value" - 1;
                  END;

                  IF "OK Value" <> 0 THEN
                    IF Fixed = FALSE THEN
                    "Pass to Sales/Marketing" := FALSE;

                  IF "OK Value" = 0 THEN
                    "Pass to Sales/Marketing" := TRUE;
              end; */
        }
        field(216; "Spare tyre inflation"; Option)
        {
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Spare tyre inflation" = "Spare tyre inflation"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(217; Jack; Option)
        {
            OptionMembers = OK,"Not OK","Not Applicable";

            /* trigger OnValidate()
            begin
                TESTFIELD("VRI Inspector Code");
                TESTFIELD("VRI Supervisor No");
                TESTFIELD("VRI Date");
                IF Jack = Jack::"Not OK" THEN BEGIN
                  "Pass to Sales/Marketing" := FALSE;
                  "Problem Vehicle" := TRUE;
                  "OK Value" := "OK Value" + 1;
                END ELSE BEGIN
                  "Problem Vehicle" := FALSE;
                  IF "OK Value" <> 0 THEN
                  "OK Value" := "OK Value" - 1;
                END;

                IF "OK Value" <> 0 THEN
                  IF Fixed = FALSE THEN
                  "Pass to Sales/Marketing" := FALSE;

                IF "OK Value" = 0 THEN
                  "Pass to Sales/Marketing" := TRUE;
            end; */
        }
        field(218; "Wheel covers boot"; Option)
        {
            OptionMembers = OK,"Not OK","Not Applicable";

            /*    trigger OnValidate()
               begin
                   TESTFIELD("VRI Inspector Code");
                   TESTFIELD("VRI Supervisor No");
                   TESTFIELD("VRI Date");
                   IF "Wheel covers boot" = "Wheel covers boot"::"Not OK" THEN BEGIN
                     "Pass to Sales/Marketing" := FALSE;
                     "Problem Vehicle" := TRUE;
                     "OK Value" := "OK Value" + 1;
                   END ELSE BEGIN
                     "Problem Vehicle" := FALSE;
                     IF "OK Value" <> 0 THEN
                     "OK Value" := "OK Value" - 1;
                   END;

                   IF "OK Value" <> 0 THEN
                     IF Fixed = FALSE THEN
                     "Pass to Sales/Marketing" := FALSE;

                   IF "OK Value" = 0 THEN
                     "Pass to Sales/Marketing" := TRUE;
               end; */
        }
        field(219; "Rear boot speakers"; Option)
        {
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Rear boot speakers" = "Rear boot speakers"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(220; "Fire Extinguisher"; Option)
        {
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Fire Extinguisher" = "Fire Extinguisher"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(221; "C caution"; Option)
        {
            OptionMembers = OK,"Not OK","Not Applicable";

            /*   trigger OnValidate()
              begin
                  TESTFIELD("VRI Inspector Code");
                  TESTFIELD("VRI Supervisor No");
                  TESTFIELD("VRI Date");
                  IF "C caution" = "C caution"::"Not OK" THEN BEGIN
                    "Pass to Sales/Marketing" := FALSE;
                    "Problem Vehicle" := TRUE;
                    "OK Value" := "OK Value" + 1;
                  END ELSE BEGIN
                    "Problem Vehicle" := FALSE;
                    IF "OK Value" <> 0 THEN
                    "OK Value" := "OK Value" - 1;
                  END;

                  IF "OK Value" <> 0 THEN
                    IF Fixed = FALSE THEN
                    "Pass to Sales/Marketing" := FALSE;

                  IF "OK Value" = 0 THEN
                    "Pass to Sales/Marketing" := TRUE;
              end; */
        }
        field(222; "Body plug"; Option)
        {
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Body plug" = "Body plug"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(223; "Mud Guards"; Option)
        {
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Mud Guards" = "Mud Guards"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(224; "Suspension mechanism"; Option)
        {
            OptionMembers = OK,"Not OK","Not Applicable";

            /* trigger OnValidate()
            begin
                TESTFIELD("VRI Inspector Code");
                TESTFIELD("VRI Supervisor No");
                TESTFIELD("VRI Date");
                IF "Suspension mechanism" = "Suspension mechanism"::"Not OK" THEN BEGIN
                  "Pass to Sales/Marketing" := FALSE;
                  "Problem Vehicle" := TRUE;
                  "OK Value" := "OK Value" + 1;
                END ELSE BEGIN
                  "Problem Vehicle" := FALSE;
                  IF "OK Value" <> 0 THEN
                  "OK Value" := "OK Value" - 1;
                END;

                IF "OK Value" <> 0 THEN
                  IF Fixed = FALSE THEN
                  "Pass to Sales/Marketing" := FALSE;

                IF "OK Value" = 0 THEN
                  "Pass to Sales/Marketing" := TRUE;
            end; */
        }
        field(225; "Brake pipes"; Option)
        {
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Brake pipes" = "Brake pipes"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(226; "Exhaust pipe"; Option)
        {
            OptionMembers = OK,"Not OK","Not Applicable";

            /*  trigger OnValidate()
             begin
                 TESTFIELD("VRI Inspector Code");
                 TESTFIELD("VRI Supervisor No");
                 TESTFIELD("VRI Date");
                 IF "Exhaust pipe" = "Exhaust pipe"::"Not OK" THEN BEGIN
                   "Pass to Sales/Marketing" := FALSE;
                   "Problem Vehicle" := TRUE;
                   "OK Value" := "OK Value" + 1;
                 END ELSE BEGIN
                   "Problem Vehicle" := FALSE;
                   IF "OK Value" <> 0 THEN
                   "OK Value" := "OK Value" - 1;
                 END;

                 IF "OK Value" <> 0 THEN
                   IF Fixed = FALSE THEN
                   "Pass to Sales/Marketing" := FALSE;

                 IF "OK Value" = 0 THEN
                   "Pass to Sales/Marketing" := TRUE;
             end; */
        }
        field(227; "Tyre damages"; Option)
        {
            OptionMembers = OK,"Not OK","Not Applicable";

            /*   trigger OnValidate()
              begin
                  TESTFIELD("VRI Inspector Code");
                  TESTFIELD("VRI Supervisor No");
                  TESTFIELD("VRI Date");
                  IF "Tyre damages" = "Tyre damages"::"Not OK" THEN BEGIN
                    "Pass to Sales/Marketing" := FALSE;
                    "Problem Vehicle" := TRUE;
                    "OK Value" := "OK Value" + 1;
                  END ELSE BEGIN
                    "Problem Vehicle" := FALSE;
                    IF "OK Value" <> 0 THEN
                    "OK Value" := "OK Value" - 1;
                  END;

                  IF "OK Value" <> 0 THEN
                    IF Fixed = FALSE THEN
                    "Pass to Sales/Marketing" := FALSE;

                  IF "OK Value" = 0 THEN
                    "Pass to Sales/Marketing" := TRUE;
              end; */
        }
        field(228; "Body Paint"; Option)
        {
            OptionMembers = OK,"Not OK","Not Applicable";
        }
        field(229; "Warehouse Stafff Comment"; Text[30])
        {
        }
        field(230; "Total VRI"; Integer)
        {
            /* CalcFormula = Count("VRI Table" WHERE (Arrived=CONST(Yes),
                                                   VRI Location=FIELD(Location Filter),
                                                   Model Name=FIELD(Model Filter)));
            FieldClass = FlowField; */
        }
        field(231; Odometer; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(232; "Fixed"; Boolean)
        {

            trigger OnValidate()
            begin
                IF Delivered = FALSE THEN
                    ERROR('You can not choose Fixed because the vehicle has not been delivered by workshop!');

                UserRec.GET(USERID);
                IF UserRec."User ID" <> 'TOYOTANIGERIA\EOT' THEN
                    ERROR('Unauthorised action. Contact your system administrator!');

                IF "Problem Vehicle" = FALSE THEN
                    ERROR('This must be a problem vehicle!');
            end;
        }
        field(233; "PV Sales & Marketing"; Integer)
        {
            /*  CalcFormula = Count("VRI Table" WHERE (Problem Vehicle=CONST(Yes),
                                                    Arrived=CONST(Yes),
                                                    Pass to Sales/Marketing=CONST(Yes),
                                                    VRI Location=FIELD(Location Filter),
                                                    Model Name=FIELD(Model Filter),
                                                    Sold=CONST(No),
                                                    Transferred=CONST(No)));
             FieldClass = FlowField; */
        }
        field(234; Transferred; Boolean)
        {

            trigger OnValidate()
            begin
                "Transferred Date/Time" := CURRENTDATETIME;
            end;
        }
        field(235; "Available for Transfer"; Integer)
        {
            /*  CalcFormula = Count("VRI Table" WHERE (Problem Vehicle=CONST(No),
                                                    Arrived=CONST(Yes),
                                                    Pass to Sales/Marketing=CONST(Yes),
                                                    VRI Location=FIELD(Location Filter),
                                                    Model Name=FIELD(Model Filter),
                                                    Transferred=CONST(No),
                                                    Sold=CONST(No)));
             FieldClass = FlowField; */
        }
        field(236; "Under Repairs"; Integer)
        {
            /* CalcFormula = Count("VRI Table" WHERE (Arrived=CONST(Yes),
                                                   Problem Vehicle=CONST(Yes),
                                                   Pass to Sales/Marketing=CONST(No),
                                                   Send For Approval=CONST(Yes),
                                                   Send VRI Request=CONST(Yes),
                                                   Op./Log.  Approval=CONST(Yes),
                                                   Send to Workshop Aprroval=CONST(Yes),
                                                   Open COF=CONST(Yes),
                                                   VRI Approved Ok=CONST(Yes),
                                                   Delivered=CONST(No),
                                                   VRI Location=FIELD(Location Filter),
                                                   Model Name=FIELD(Model Filter),
                                                   Estimate Approved=CONST(Yes),
                                                   Sold=CONST(No)));
            FieldClass = FlowField; */
        }
        field(237; "Not Fixed"; Boolean)
        {

            trigger OnValidate()
            begin
                IF Delivered = TRUE THEN
                    ERROR('You can not choose Not Fixed because the vehicle has been delivered by workshop!');

                UserRec.GET(USERID);
                IF UserRec."User ID" <> 'TOYOTANIGERIA\EOT' THEN
                    ERROR('Unauthorised action. Contact your system administrator!');

                IF "Problem Vehicle" = FALSE THEN
                    ERROR('This must be a problem vehicle!');
            end;
        }
        field(238; "Confirmed Physically"; Boolean)
        {

            trigger OnValidate()
            begin
                TESTFIELD("Problem Vehicle", FALSE);

                UserRec.GET(USERID);

                IF ((UserRec."User ID" <> 'TOYOTANIGERIA\ALAMU') AND (UserRec."User ID" <> 'TOYOTANIGERIA\EOT')) THEN
                    ERROR('You can not perform this operation!');

                "Physically By" := UserRec."User ID";
                "Physically Date Time" := CURRENTDATETIME;
            end;
        }
        field(239; "Physically By"; Code[20])
        {
        }
        field(240; "Physically Date Time"; DateTime)
        {
        }
        field(241; "Send for Est. Verification"; Boolean)
        {

            /*     trigger OnValidate()
                begin
                    ToName  := 'alamu@toyotanigeria.com';
                    CCName := 'eot@toyotanigeria.com';
                    Subject := STRSUBSTNO(Text014,"VRI Code");
                    Body:=  STRSUBSTNO(Text015);
                    UserSetup.GET(USERID);
                    SenderEmail := UserSetup."E-Mail";
                    SenderInitial := UserSetup2.Initials;
                    Initials := UserSetup.Initials;

                      WITH TempEmailItem DO BEGIN
                        "Send to" := ToName;
                        "Send CC" := SenderEmail + ';' + CCName;
                        "Send BCC" := '';
                        Subject := STRSUBSTNO(Text011,"VRI Code");

                        CRLF := '';
                        CRLF[1] := 13;
                        CRLF[2] := 10;

                        BodyBlob.Blob.CREATEOUTSTREAM(BodyStream);
                        BodyStream.WRITETEXT(Text016 + 'Sir,');
                        BodyStream.WRITETEXT(CRLF + CRLF);
                        BodyStream.WRITETEXT(STRSUBSTNO(Text011,"VRI Code","O/Log Comment") + CRLF + CRLF +
                        CRLF + CRLF +
                        'Kindly attend to this request with urgency.' + CRLF + CRLF +
                        Text017 + CRLF);
                        BodyStream.WRITETEXT(SenderInitial);
                        BodyStream.WRITETEXT(CRLF + CRLF);
                        BodyStream.WRITETEXT('This is a system generated mail. Please do not reply to this email ID.');
                        Body := BodyBlob.Blob;
                        Send(FALSE);
                      END;

                    //mailsent := approvalmessage.NewMessage(ToName,CCName,Bcc,Subject,Body,attachement,TRUE);
                    SMTPMail.CreateMessage (USERID,SenderEmail,ToName,Subject,Body,FALSE);
                    SMTPMail.Send;
                    MESSAGE('Mail sent successfully');
                end; */
        }
        field(242; "Open COF  Aprroval2"; Integer)
        {
            /*   CalcFormula = Count("VRI Table" WHERE (Arrived=CONST(Yes),
                                                     Problem Vehicle=CONST(Yes),
                                                     Pass to Sales/Marketing=CONST(No),
                                                     Send For Approval=CONST(Yes),
                                                     Send VRI Request=CONST(Yes),
                                                     Op./Log.  Approval=CONST(Yes),
                                                     Send to Workshop Aprroval=CONST(Yes),
                                                     Open COF=CONST(Yes),
                                                     VRI Approved Ok=CONST(No),
                                                     Delivered=CONST(No),
                                                     VRI Location=FIELD(Location Filter),
                                                     Model Name=FIELD(Model Filter),
                                                     Estimate Approved=CONST(No),
                                                     Send for Est. Verification=CONST(Yes),
                                                     Sold=CONST(No)));
              Description = 'k';
              FieldClass = FlowField; */
        }
        field(243; "In-Stock"; Boolean)
        {
        }
        field(244; "In-Stock Count"; Integer)
        {
            /* CalcFormula = Count("VRI Table" WHERE (In-Stock=CONST(Yes),
                                                   Pass to Sales/Marketing=CONST(No)));
            FieldClass = FlowField; */
        }
        field(245; "Vehicles Sold"; Integer)
        {
            /* CalcFormula = Count("VRI Table" WHERE (Arrived=CONST(Yes),
                                                   VRI Location=FIELD(Location Filter),
                                                   Model Name=FIELD(Model Filter),
                                                   Sold=CONST(Yes)));
            FieldClass = FlowField; */
        }
        field(246; Sold; Boolean)
        {
            Editable = false;
        }
        field(247; "Transferred Date/Time"; DateTime)
        {
        }
        field(248; Exist; Boolean)
        {
        }
        field(249; "Year of Production"; Code[10])
        {
        }
        field(250; "estimated Mileage"; Code[10])
        {
        }
        field(251; Color; Code[10])
        {
        }
        field(252; "Confirmed PhysicallyCOUNT"; Integer)
        {
            /*  CalcFormula = Count("VRI Table" WHERE (Arrived=CONST(Yes),
                                                    VRI Location=FIELD(Location Filter),
                                                    Model Name=FIELD(Model Filter),
                                                    Confirmed Physically=CONST(Yes)));
             FieldClass = FlowField; */
        }
        field(253; "Send To VRI"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";
        }
        field(254; Walk0011; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(255; Walk0012; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(256; Walk0013; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(257; Walk0021; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(258; Walk0022; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(259; Walk0023; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(260; Walk0031; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(261; Walk0032; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(262; Walk0033; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(263; Walk0041; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(264; Walk0042; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(265; Walk0043; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(266; Walk0051; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(267; Walk0052; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(268; Walk0053; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(269; LOAD0011; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(270; LOAD0012; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(271; LOAD0013; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(272; LOAD0021; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(273; LOAD0022; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(274; LOAD0023; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(275; LOAD0031; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(276; LOAD0032; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(277; LOAD0033; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(278; ENG0011; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(279; ENG0012; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(280; ENG0013; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(281; ENG0021; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(282; ENG0022; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(283; ENG0023; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(284; ENG0031; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(285; ENG0032; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(286; ENG0033; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(287; IV0011; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(288; IV0012; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(289; IV0013; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(290; IV0021; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(291; IV0022; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(292; IV0023; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(293; IV0031; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(294; IV0032; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(295; IV0033; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(296; IV0041; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(297; IV0042; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(298; IV0043; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(299; IV0051; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(300; IV0052; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(301; IV0053; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(302; IV0061; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(303; IV0062; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(304; IV0063; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(305; IV0071; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(306; IV0072; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(307; IV0073; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(308; IV0081; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(309; IV0082; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(310; IV0083; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(311; IV0091; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(312; IV0092; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(313; IV0093; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(314; IV00101; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(315; IV00102; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(316; IV00103; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(317; IV00201; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(318; IV00202; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(319; IV00203; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(320; IV00301; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(321; IV00302; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(322; IV00303; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(323; IV00401; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(324; IV00402; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(325; IV00403; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(326; BOOT0011; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(327; BOOT0012; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(328; BOOT0013; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(329; IV00501; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(330; IV00502; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(331; IV00503; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(332; BOOT0021; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(333; BOOT0022; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(334; BOOT0023; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(335; BOOT0031; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(336; BOOT0032; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(337; BOOT0033; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "VRI Code")
        {
            Clustered = true;
        }
        key(Key2; "Model Name", Location)
        {
        }
        key(Key3; "Model Name", "VRI Location", "Consignment No.")
        {
        }
        key(Key4; "VRI Location", Transferred, "Pass to Sales/Marketing", Arrived, "Problem Vehicle", Sold)
        {
        }
        key(Key5; "Pass to Sales/Marketing", Arrived, "Problem Vehicle", Transferred)
        {
        }
        key(Key6; "Confirmed Physically")
        {
        }
        key(Key7; "Item Serial No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //ERROR('You can not delete an entry in this form. Contact your system administrator!');
    end;

    trigger OnInsert()
    begin
        /*  IF "VRI Code" = '' THEN BEGIN
           Servicesetup.GET;
          Servicesetup.TESTFIELD("Vri Code Check List");
           NoseriesMgt.InitSeries(Servicesetup."Vri Code Check List",xRec."No. Series",0D,"VRI Code","No. Series");
         END; */
    end;

    trigger OnModify()
    begin
        IF "OK Value" <> 0 THEN
            IF Fixed = FALSE THEN
                "Pass to Sales/Marketing" := FALSE;

        IF Arrived = FALSE THEN
            ERROR('This vehicle has not arrived!');
    end;

    var
        COFrec: Record 50119;
        ServiceItem: Record 5940;
        Servicesetup: Record 5911;
        NoseriesMgt: Codeunit "No. Series";
        VRIREC: Record 50058;
        Itemrec: Record 32;
        ItemLedgerE: Record 32;
        UserRec: Record 91;
        VRIItem: Record 27;
        CustRec: Record 18;
        VRec: Record 50059;
        EmployeeRec: Record 5200;
        Colorec: Record 50067;
        approvalmessage: Codeunit 397;
        mailsent: Boolean;
        ToName: Text[200];
        CCName: Text[200];
        Bcc: Text;
        Subject: Text[100];
        Body: Text[1000];
        attachement: Text[260];
        Text001: Label 'From VRI Unit to O/L VRI %1';
        Text002: Label 'The VRI %1 is not suitable for Sales and Marketing. We hereby send it to you for Workshop Approval. Errors found :: %2 ';
        Text003: Label 'From O/L Unit to VRI Unit ';
        Text004: Label 'The VRI %1 is not suitable for Sales and Marketing. We hereby send it to you for Workshop Approval. Errors found :: %2 ';
        Text005: Label 'From VRI Unit to Workshop %1';
        Text006: Label 'The VRI %1 is not suitable for Sales and Marketing.';
        Text007: Label 'From O/L Unit Tto VRI & Workshop';
        Text008: Label 'The VRI %1 is not suitable for Sales and Marketing. We hereby send it to you for Workshop Approval. Errors found :: %2';
        Text009: Label 'From VRI Unit to O/L Unit';
        Text010: Label 'The VRI %1 is not suitable for Sales and Marketing. We hereby send it to you for Workshop Approval. Errors found :: %2';
        Text011: Label 'From O/L Unit to COF';
        Text012: Label 'The VRI %1 is not suitable for Sales and Marketing. We hereby send it to you for Approval. Errors found :: %2';
        LocationRec: Record 14;
        UserSetup: Record 91;
        UserSetup2: Record 91;
        NL: Char;
        LF: Char;
        ModelRec: Record 50014;
        Text013: Label 'The VRI %1 is a Warranty job. We hereby send it to you for processing.';
        Text014: Label 'From WORKSHOP to O/L';
        Text015: Label 'Kindly confirm the estimate and send to O/L for Approval';
        ItemLedgEntry: Record 32;
        //SMTPMail: Codeunit "400";
        SenderEmail: Text[50];
        SenderAddress: Text[50];
        //EmailBody: Record "99008535";
        BodyTxt: Text;
        //BodyBlob: Record "99008535";
        BodyStream: OutStream;
        SenderInitial: Text;
        TempEmailItem: Record 9500 temporary;
        Initials: Text[10];
        CRLF: Text[2];
        Text016: Label 'Dear ';
        Text017: Label 'Regards,';


    procedure AssistEdit(var OldVRI2REC: Record 50058; var OldVRIcl: Record 50160): Boolean
    var
        VRI: Record 50058;
        VRICL: Record 50160;
    begin
        /* WITH VRICL DO BEGIN
         VRICL :=Rec;
          Servicesetup.GET;
          IF NoseriesMgt.SelectSeries(Servicesetup."Vri Code Check List",OldVRIcl."No. Series","No. Series") THEN BEGIN
           Servicesetup.GET;
           NoseriesMgt.SetSeries("VRI Code");
           Rec:=VRICL;
           EXIT(TRUE);
          END;
         END; */
    end;
}

