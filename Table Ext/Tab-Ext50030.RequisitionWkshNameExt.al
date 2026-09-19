tableextension 50030 "Requisition Wksh. Name Ext" extends "Requisition Wksh. Name"
{
    fields
    {
        field(50000; "SIV Ref. No."; Code[10])
        {
        }
        field(50001; "SRV Ref. No."; Code[10])
        {
        }
        field(50002; "Printed Copies"; Integer)
        {
            Editable = false;
        }
        field(50003; "Store Req. Date"; Date)
        {
        }
        field(50004; Department; Text[30])
        {
            NotBlank = true;
        }
        /* field(50005; "No. Of Lines"; Integer)
        {
            CalcFormula = Count("Requisition Line" WHERE("Worksheet Template Name" = FIELD("Worksheet Template Name"),
                                                          "Journal Batch Name" = FIELD(Name)));
            Editable = false;
            FieldClass = FlowField;
        } */
        field(50006; "COF No."; Code[20])
        {
        }
        field(50007; "Veh. Reg. No."; Code[20])
        {
        }
        field(50008; "Customer No."; Code[20])
        {
        }
        field(50009; "Customer Name"; Text[50])
        {
        }
        field(50010; "Request Type"; Option)
        {
            OptionCaption = ' ,Parts,Estimate,Other';
            OptionMembers = " ",Parts,Estimate,Other;
        }
    }
}
