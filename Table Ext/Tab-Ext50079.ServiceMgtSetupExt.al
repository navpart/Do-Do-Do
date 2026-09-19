tableextension 50079 "Service Mgt. Setup Ext" extends "Service Mgt. Setup"
{
    fields
    {
        field(50000; "Complaint No."; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50001; "Service Call Due Interval"; DateFormula)
        {
        }
        field(50002; "Service Call 1 Due Interval"; DateFormula)
        {
        }
        field(50003; "Service Call 2 Due Interval"; DateFormula)
        {
        }
        field(50004; "Service Call 3 Due Interval"; DateFormula)
        {
        }
        field(50005; "Appointment Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50006; "Service Index Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50007; "Service Reception Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50008; "Break Begin Time"; Time)
        {

            trigger OnValidate()
            begin
                "Break End Time" := "Break Begin Time" + ("Break Duration Hour" * 3600000);
            end;
        }
        field(50009; "Break End Time"; Time)
        {
        }
        field(50010; "Walk In Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50011; "Break Duration Hour"; Decimal)
        {
        }
        field(50012; "CSI No."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50013; "Daily Working Hours"; Decimal)
        {

            trigger OnValidate()
            begin
                IF "Daily Resuming Time" <> 0T THEN
                    VALIDATE("Daily Resuming Time");
            end;
        }
        field(50014; "Daily Resuming Time"; Time)
        {
            //InitValue = 080000;
            NotBlank = true;

            trigger OnValidate()
            begin
                "Daily Closing Time" := "Daily Resuming Time" + ("Daily Working Hours" * 3600 * 1000);
            end;
        }
        field(50015; "Daily Closing Time"; Time)
        {
            Editable = false;
        }
        field(50016; "Fault Code No.s"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50017; "First Service Default Interval"; DateFormula)
        {
        }
        field(50018; "Estimate Factor"; Decimal)
        {
        }
        field(50019; "Diagnosic Questionnaire"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50020; "Complain Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50026; "Appointment %"; Decimal)
        {
        }
        field(50027; "Walk-In %"; Decimal)
        {
        }
        field(50028; "Carry Over"; Decimal)
        {
        }
        field(50029; "Dealer Hourly Rate"; Decimal)
        {
            Description = '% that determines what dealer hourly rate.  DHR := Dealer Factor * Flat Rate.   Flat Rate := Default. DHR will be in setup.';
        }
        field(50030; "Default Warranty Customer"; Code[20])
        {
            TableRelation = Customer;
        }
        field(50031; "Default Internal Customer"; Code[20])
        {
            TableRelation = Customer;
        }
        field(50032; "Sublet Code"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50033; "Service Req. No."; Code[10])
        {
        }
        field(50034; "VRI Code"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50035; VCOF; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50036; "Send VRI Request"; Text[50])
        {
        }
        field(50037; "Operation/Log Approval"; Text[50])
        {
        }
        field(50038; "Send To Workshop Approval"; Text[50])
        {
        }
        field(50039; "Estimate Approved"; Text[50])
        {
        }
        field(50040; "Approve For Sales/Mkt"; Text[50])
        {
        }
        field(50041; "VRI Approved OK"; Text[50])
        {
        }
        field(50042; "Logistic Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50043; "Work Order No."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50044; "VRI Code Check List"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }

        field(60000; "Parts Order Isolo"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(60001; "Parts Order Isolo CC"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(60002; "Parts Arrival Isolo"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(60003; "Parts Arrival Isolo CC"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(60004; "Parts Order Lekki"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(60005; "Parts Order Lekki CC"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(60006; "Parts Arrival Lekki"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(60007; "Parts Arrival Lekki CC"; Text[150])
        {
            DataClassification = ToBeClassified;
        }

    }
}
