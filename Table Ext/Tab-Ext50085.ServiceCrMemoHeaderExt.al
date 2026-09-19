tableextension 50085 "Service Cr.Memo Header Ext" extends "Service Cr.Memo Header"
{
    fields
    {
        field(50011; Model; Code[20])
        {
        }
        field(50012; Chassis; Code[20])
        {
        }
        field(50013; "Engine No."; Code[20])
        {
        }
        field(50014; "Odometer Reading @ Reception"; Decimal)
        {
        }
        field(50015; "Workshop Store Rq. No"; Code[20])
        {
        }
        field(50016; "Job Details"; Text[250])
        {
        }
        field(50017; Make; Text[30])
        {
        }
        field(50018; "Service Advisor"; Code[20])
        {
        }
        field(50019; "Service Advisor's Name"; Text[50])
        {
        }
        field(50020; "External Document No"; Code[20])
        {
        }
        field(50021; "Job No."; Code[20])
        {
            TableRelation = Job;
        }
        field(50025; "Model Year"; Integer)
        {
        }
        field(50030; "Job Type"; Option)
        {
            OptionCaption = ' ,PM,GR,Others,Warranty,Internal,D/Estimate,B&P,B&P Estimate,Painting';
            OptionMembers = " ",PM,GR,Others,Warranty,Internal,"D/Estimate","B&P","B&P Estimate",Painting;
        }
        field(50152; Department; Code[20])
        {
        }
        field(50153; Released; Boolean)
        {
        }
        field(50154; Confirmed; Boolean)
        {
        }
        field(50155; "Reception Date"; Date)
        {
        }
        field(50156; "Reception Time"; Time)
        {
        }
        field(50157; "Delivery Date"; Date)
        {
        }
        field(50158; "Delivery Time"; Time)
        {
        }
        field(50159; "Customer's Requests"; Option)
        {
            OptionCaption = 'Appointment,Walk-In,Others';
            OptionMembers = Appointment,"Walk-In",Others;
        }
        field(50164; "Labour (Hrs)"; Decimal)
        {
            CalcFormula = Sum("Service Cr.Memo Line".Quantity WHERE("Document No." = FIELD("No."),
                                                                     Type = CONST(Resource)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50165; Parts; Decimal)
        {
            CalcFormula = Sum("Service Cr.Memo Line".Amount WHERE("Document No." = FIELD("No."),
                                                                   Type = CONST(Item)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50166; "Labour Cost"; Decimal)
        {
            CalcFormula = Sum("Service Cr.Memo Line".Amount WHERE("Document No." = FIELD("No."),
                                                                   Type = CONST(Cost)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50168; "Total Amount"; Decimal)
        {
            CalcFormula = Sum("Service Cr.Memo Line".Amount WHERE("Document No." = FIELD("No."),
                                                                   Type = FILTER(Item | Cost)));
            FieldClass = FlowField;
        }
        field(50200; PM; Boolean)
        {
            Editable = false;
        }
        field(50201; GR; Boolean)
        {
            Editable = false;
        }
        field(50202; Others; Boolean)
        {
            Editable = false;
        }
        field(50203; Warranty; Boolean)
        {
            Editable = false;
        }
        field(50204; Internal; Boolean)
        {
            Editable = false;
        }
        field(50205; "D/Estimate"; Boolean)
        {
            Editable = false;
        }
        field(50206; "B&P"; Boolean)
        {
            Editable = false;
        }
        field(50207; "B&P Estimate"; Boolean)
        {
            Editable = false;
        }
        field(50208; Painting; Boolean)
        {
            Editable = false;
        }
        field(50255; "Additional Job Details"; Text[70])
        {
        }
        field(50258; "COF No."; Code[20])
        {
            //TableRelation = "Customer Order Table."."Customer Order Form No.";
        }
        field(90000; "IRN"; Text[150])
        {
            Caption = 'IRN';
        }
    }
}
