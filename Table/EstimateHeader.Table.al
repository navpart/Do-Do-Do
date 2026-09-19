table 50121 "Estimate Header"
{

    fields
    {
        field(1; "Estimate No"; Code[10])
        {

            trigger OnValidate()
            begin
                IF "Estimate No" <> xRec."Estimate No" THEN BEGIN
                    serviceSetup.GET;
                    NoSeriesMgt.TestManual(serviceSetup."Complaint No.");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "Customer No."; Code[20])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                IF Custrec.GET("Customer No.") THEN BEGIN
                    "Customer Name" := Custrec.Name;
                    "Address 1" := Custrec.Address;
                    "Address 2" := Custrec."Address 2";
                    "Tel. No" := Custrec."Phone No.";
                END;
            end;
        }
        field(3; "Customer Name"; Text[30])
        {
        }
        field(4; "Address 1"; Text[50])
        {
        }
        field(5; "Address 2"; Text[50])
        {
        }
        field(6; "Tel. No"; Code[20])
        {
        }
        field(7; "Model No."; Code[20])
        {
        }
        field(8; "Model Name"; Code[20])
        {
        }
        field(9; "Veh. Registration No."; Code[20])
        {
            TableRelation = "Service Item"."No." WHERE("Customer No." = FIELD("Customer No."));
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                IF ServiceItemrec.GET("Veh. Registration No.") THEN BEGIN
                    "Model No." := ServiceItemrec."Model No.";
                    "Model Name" := ServiceItemrec.Make;
                END;
            end;
        }
        field(10; "Veh. Registration date"; Date)
        {
        }
        field(11; "Transaction Date"; Date)
        {
        }
        field(12; "Customer Order Form No"; Code[20])
        {
        }
        field(13; "Service Adviser"; Text[30])
        {
        }
        field(14; "Cost Changed"; Decimal)
        {
            CalcFormula = Sum("Customer Order Table."."Cost Changed" WHERE("Customer Order Form No." = FIELD("Estimate No"),
                                                                            "Cost Changed" = filter(true)));
            FieldClass = FlowField;
        }
        field(15; "Total Estimation"; Decimal)
        {
            CalcFormula = Sum("Customer Order Table."."Cost Changed" WHERE("Customer Order Form No." = FIELD("Estimate No"),
                                                                             "Cost Changed" = filter(false)));
            FieldClass = FlowField;
        }
        field(16; Advice; Text[100])
        {
        }
        field(17; "Delivery Date"; Date)
        {
        }
        field(18; Time; Time)
        {
        }
        field(19; "Delivery Type"; Option)
        {
            OptionMembers = " ","Customer Come-in","Place of Work",Home,Other;
        }
        field(20; "Payment Method"; Option)
        {
            OptionCaption = ' ,Credit Card,Cash,Cheque,Warranty,Other';
            OptionMembers = " ","Credit Card",Cash,Cheque,Warranty,Other;
        }
        field(21; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(22; "Other Delivery Type"; Text[30])
        {
        }
        field(23; "Other Payment Method"; Text[30])
        {
        }
        field(24; "Estimate Factor"; Decimal)
        {
        }
        field(25; "Operation Code"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Estimate No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF "Estimate No" = '' THEN BEGIN
            serviceSetup.GET;
            serviceSetup.TESTFIELD("Complaint No.");
            "No. Series" := serviceSetup."Complaint No.";
            if NoSeriesMgt.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Estimate No" := NoSeriesMgt.GetNextNo("No. Series");

        END;
    end;

    var
        Custrec: Record Customer;
        ServiceItemrec: Record "Service Item";
        serviceSetup: Record "Service Mgt. Setup";
        NoSeriesMgt: Codeunit "No. Series";
        comprec: Record "Estimate Header";

    procedure AssistEdit(OldComp: Record "Estimate Header"): Boolean
    begin
        /*      WITH comprec DO BEGIN
                 comprec := Rec;
                 serviceSetup.GET;
                 serviceSetup.TESTFIELD("Complaint No.");
                 IF NoSeriesMgt.SelectSeries(serviceSetup."Complaint No.", OldComp."No. Series", "No. Series") THEN BEGIN
                     serviceSetup.GET;
                     serviceSetup.TESTFIELD("Complaint No.");
                     NoSeriesMgt.SetSeries("Estimate No");
                     Rec := comprec;
                     EXIT(TRUE);
                 END;
             END; */
    end;
}

