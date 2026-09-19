tableextension 50082 "Service Item Ext" extends "Service Item"
{
    fields
    {
        field(50000; Make; Text[50])
        {
        }
        field(50001; "Model No."; Code[20])
        {
        }
        field(50002; "Chasis No."; Code[20])
        {

            trigger OnValidate()
            begin
                IF "Chasis No." <> '' THEN BEGIN
                    VMI := COPYSTR("Chasis No.", 1, 3);
                    VDS := COPYSTR("Chasis No.", 4, 6);
                    VIS := COPYSTR("Chasis No.", 10, 8);
                END;

                "SSC/SC".SETRANGE("SSC/SC".VDS, VDS);
                "SSC/SC".SETRANGE("SSC/SC".VMI, VMI);
                "SSC/SC".SETFILTER("SSC/SC"."Range From", '<=%1', VIS);
                "SSC/SC".SETFILTER("SSC/SC"."Range To", '>=%1', VIS);
                "SSC/SC".SETFILTER("SSC/SC"."SSC/SC Date From", '<=%1', TODAY);
                "SSC/SC".SETFILTER("SSC/SC"."SSC/SC Date To", '>=%1', TODAY);
                "SSC/SC".SETRANGE("SSC/SC"."SCSC Status", "SSC/SC"."SCSC Status"::Active);
                "SSC/SC".SETRANGE("SSC/SC".Applied, FALSE);
                IF "SSC/SC".FINDFIRST THEN
                    REPEAT
                        "AppSSC/SC2".SETRANGE("AppSSC/SC2"."SSC/SC Code", "SSC/SC"."SSC/SC Code");
                        "AppSSC/SC2".SETRANGE("AppSSC/SC2"."Line No.", "SSC/SC"."Line No.");
                        "AppSSC/SC2".SETRANGE("AppSSC/SC2"."Service Item Code", "No.");
                        //"AppSSC/SC2".SETRANGE("AppSSC/SC2"."Fault Code","Job Type");
                        IF "AppSSC/SC2".FINDLAST THEN
                            EXIT
                        ELSE
                            "AppSSC/SC".INIT;
                        "AppSSC/SC"."SSC/SC Code" := "SSC/SC"."SSC/SC Code";
                        "AppSSC/SC"."Line No." := "SSC/SC"."Line No.";
                        "AppSSC/SC"."Service Item Code" := "No.";
                        //"AppSSC/SC"."Fault Code" := "Job Type";
                        "AppSSC/SC"."SSC/SC Date From" := "SSC/SC"."SSC/SC Date From";
                        "AppSSC/SC"."SSC/SC Date To" := "SSC/SC"."SSC/SC Date To";
                        "AppSSC/SC"."Issue Date" := "SSC/SC"."Issue Date";
                        "AppSSC/SC"."SCSC Status" := "SSC/SC"."SCSC Status";
                        "AppSSC/SC"."SSC/SC Description" := "SSC/SC"."SSC/SC Description";
                        "AppSSC/SC".Applied := "SSC/SC".Applied;
                        "AppSSC/SC"."Model No." := "SSC/SC"."Model No.";
                        "AppSSC/SC"."C/I No" := "SSC/SC"."C/I No";
                        "AppSSC/SC".VDS := "SSC/SC".VDS;
                        "AppSSC/SC".VIS := VIS;
                        "AppSSC/SC".VMI := "SSC/SC".VMI;
                        "AppSSC/SC"."Range From" := "SSC/SC"."Range From";
                        "AppSSC/SC"."Range To" := "SSC/SC"."Range To";
                        "AppSSC/SC".INSERT;
                    UNTIL "SSC/SC".NEXT = 0;
            end;
        }
        field(50003; "Engine No."; Code[20])
        {
        }
        field(50004; "Customer Email"; Text[80])
        {
            CalcFormula = Lookup(Customer."E-Mail" WHERE("No." = FIELD("Customer No.")));
            FieldClass = FlowField;
        }
        field(50005; "User ID"; Code[20])
        {
        }
        field(50006; "Model Year"; Integer)
        {
        }
        field(50007; "User No."; Code[10])
        {
            TableRelation = Contact."No." WHERE("Company Name" = FIELD(Name));

            trigger OnValidate()
            begin
                IF ContactRec.GET("User No.") THEN BEGIN
                    "User Person" := ContactRec.Name;
                    Business := ContactRec."Phone No.";
                    Mobile := ContactRec."Mobile Phone No.";
                    "User Email" := ContactRec."E-Mail";
                END;
            end;
        }
        field(50008; "User Person"; Text[50])
        {
        }
        field(50009; Business; Text[30])
        {
        }
        field(50010; Mobile; Text[30])
        {
        }
        field(50011; "User Email"; Text[80])
        {
        }
        field(50012; VMI; Code[10])
        {
        }
        field(50013; VDS; Code[10])
        {
        }
        field(50014; VIS; Code[10])
        {
        }
        field(50015; "Service Item Status"; Option)
        {
            OptionCaption = 'Active,Inactive';
            OptionMembers = Active,Inactive;

            trigger OnValidate()
            begin
                IF "Service Item Status" = "Service Item Status"::Inactive THEN
                    "Service Item Inactive Date" := TODAY
                ELSE
                    "Service Item Inactive Date" := 0D;
            end;
        }
        field(50016; "Service Item Inactive Date"; Date)
        {
            Editable = false;
        }
        field(50017; "New Reg. No"; Code[20])
        {
        }
        field(50018; "Vehicle Classification"; Option)
        {
            OptionCaption = ' ,Gray,TNL Sold';
            OptionMembers = " ",Gray,"TNL Sold";
        }
        field(50019; "Vehicle Brand"; Code[20])
        {
            TableRelation = "Vehicle Brand";
        }

        field(50040; "Assigned User Name"; text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50041; "Assigned User Email"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50042; "Assigned User No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50043; "Contact Designation"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50044; "Customer Phone No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        /* field(50045; "Customer Email"; Text[30])
        {
            DataClassification = ToBeClassified;
        } */
        field(50046; Colour; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50047; NickName; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50048; "Customer Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;

        }


        modify("Location of Service Item")
        {
            TableRelation = Location.Code;
        }
    }
    var

        ContactRec: Record Contact;
        "SSC/SC": Record "SSC/SC";
        "AppSSC/SC": Record "Appointment SSC/SC";
        "AppSSC/SC2": Record "Appointment SSC/SC";
        Customer: Record Customer;
}