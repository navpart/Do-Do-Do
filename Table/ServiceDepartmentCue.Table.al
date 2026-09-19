table 50544 "Service Department Cue"
{

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
        }
        field(2; "Total Vehicle Arrived"; Integer)
        {
            CalcFormula = Count("VRI Table" WHERE(Arrived = filter(true)));
            Description = 'VRI';
            FieldClass = FlowField;
        }
        field(3; "Awaiting VRI"; Integer)
        {
            /*  CalcFormula = Count("VRI Table" WHERE(Arrived = filter(true),
                                                    "Send For Approval" = filter(false),
                                                    "VRI Location" = FIELD("Location Filter"),
                                                    "Model Name" = FIELD(Model Filter),
                                                    "Problem Vehicle"=filter(false),
                                                    "Pass to Sales/Marketing"=filter(false),
                                                    Sold=filter(false)));
             Description = 'VRI';
             FieldClass = FlowField; */
        }
        field(4; "Problem Vehicle"; Integer)
        {
            CalcFormula = Count("VRI Table" WHERE(Arrived = filter(true),
                                                   "Problem Vehicle" = filter(true),
                                                   "Pass to Sales/Marketing" = filter(false),
                                                   "Send For Approval" = filter(false),
                                                   "Send VRI Request" = filter(false),
                                                   "Op./Log.  Approval" = filter(false),
                                                   "Send to Workshop Aprroval" = filter(false),
                                                   "Open COF" = filter(false),
                                                   "Estimate Approved" = filter(false),
                                                   Delivered = filter('No'),
                                                   "VRI Location" = FIELD("Location Filter"),
                                                   "Model Name" = FIELD("Model Filter"),
                                                   Sold = filter(false)));
            Description = 'VRI';
            FieldClass = FlowField;
        }
        field(5; "Pending VRI Request"; Integer)
        {
            CalcFormula = Count("VRI Table" WHERE(Arrived = filter(true),
                                                   "Problem Vehicle" = filter(true),
                                                   "Pass to Sales/Marketing" = filter('No'),
                                                   "Send For Approval" = filter(true),
                                                   "Send VRI Request" = filter(false),
                                                   "Op./Log.  Approval" = filter(false),
                                                   "Send to Workshop Aprroval" = filter(false),
                                                   "Open COF" = filter(False),
                                                   "Estimate Approved" = filter(false),
                                                   Delivered = filter(false),
                                                   "VRI Location" = FIELD("Location Filter"),
                                                   "Model Name" = FIELD("Model Filter")));
            Description = 'VRI';
            FieldClass = FlowField;
        }
        field(6; "Pending O/L Action to VRI"; Integer)
        {
            CalcFormula = Count("VRI Table" WHERE(Arrived = filter(true),
                                                   "Problem Vehicle" = filter(true),
                                                   "Pass to Sales/Marketing" = filter(false),
                                                   "Send For Approval" = filter(true),
                                                   "Send VRI Request" = filter(true),
                                                   "Op./Log.  Approval" = filter(false),
                                                   "Send to Workshop Aprroval" = filter(false),
                                                   "Open COF" = filter(false),
                                                   "Estimate Approved" = filter(false),
                                                   Delivered = filter(false),
                                                   "VRI Location" = FIELD("Location Filter"),
                                                   "Model Name" = FIELD("Model Filter"),
                                                   Sold = filter(false)));
            Description = 'VRI';
            FieldClass = FlowField;
        }
        field(7; "Pending VRI Action to W/Shop"; Integer)
        {
            CalcFormula = Count("VRI Table" WHERE(Arrived = filter(true),
                                                   "Problem Vehicle" = filter(true),
                                                   "Pass to Sales/Marketing" = filter(false),
                                                   "Send For Approval" = filter(true),
                                                   "Send VRI Request" = filter(true),
                                                   "Op./Log.  Approval" = filter(true),
                                                   "Send to Workshop Aprroval" = filter(false),
                                                   "Open COF" = filter(false),
                                                   "Estimate Approved" = filter(false),
                                                   Delivered = filter(false),
                                                   "VRI Location" = FIELD("Location Filter"),
                                                   "Model Name" = FIELD("Model Filter")));
            Description = 'VRI';
            FieldClass = FlowField;
        }
        field(8; Workshop; Integer)
        {
            CalcFormula = Count("VRI Table" WHERE(Arrived = filter(true),
                                                   "Problem Vehicle" = filter(true),
                                                   "Pass to Sales/Marketing" = filter(false),
                                                   "Send For Approval" = filter(true),
                                                   "Send VRI Request" = filter(true),
                                                   "Op./Log.  Approval" = filter(true),
                                                   "Send to Workshop Aprroval" = filter(true),
                                                   "Open COF" = filter(false),
                                                   "Estimate Approved" = filter(false),
                                                   Delivered = filter(false),
                                                   "VRI Location" = FIELD("Location Filter"),
                                                   "Model Name" = FIELD("Model Filter"),
                                                   Sold = filter(false)));
            Description = 'VRI';
            FieldClass = FlowField;
        }
        field(9; "Workshop Estimate Generation"; Integer)
        {
            CalcFormula = Count("VRI Table" WHERE(Arrived = filter(true),
                                                   "Problem Vehicle" = filter(true),
                                                   "Pass to Sales/Marketing" = filter(false),
                                                   "Send For Approval" = filter(true),
                                                   "Send VRI Request" = filter(true),
                                                   "Op./Log.  Approval" = filter(true),
                                                   "Send to Workshop Aprroval" = filter(true),
                                                   "Open COF" = filter(true),
                                                   "VRI Approved Ok" = filter(false),
                                                   Delivered = filter(false),
                                                   "VRI Location" = FIELD("Location Filter"),
                                                   "Model Name" = FIELD("Model Filter"),
                                                   "Estimate Approved" = filter(false),
                                                   "Send for Est. Verification" = filter(false),
                                                   Sold = filter(false)));
            Description = 'VRI';
            FieldClass = FlowField;
        }
        field(10; "VRI Estimate Generation"; Integer)
        {
            CalcFormula = Count("VRI Table" WHERE(Arrived = filter(true),
                                                   "Problem Vehicle" = filter(true),
                                                   "Pass to Sales/Marketing" = filter(false),
                                                   "Send For Approval" = filter(true),
                                                   "Send VRI Request" = filter(true),
                                                   "Op./Log.  Approval" = filter(true),
                                                   "Send to Workshop Aprroval" = filter(true),
                                                   "Open COF" = filter(true),
                                                   "VRI Approved Ok" = filter(false),
                                                   Delivered = filter(false),
                                                   "VRI Location" = FIELD("Location Filter"),
                                                   "Model Name" = FIELD("Model Filter"),
                                                   "Estimate Approved" = filter(false),
                                                   "Send for Est. Verification" = filter(true),
                                                   Sold = filter(false)));
            Description = 'VRI';
            FieldClass = FlowField;
        }
        field(11; "Pending O/L Estimate Approval"; Integer)
        {
            CalcFormula = Count("VRI Table" WHERE(Arrived = filter(true),
                                                   "Problem Vehicle" = filter(true),
                                                   "Pass to Sales/Marketing" = filter(false),
                                                   "Send For Approval" = filter(true),
                                                   "Send VRI Request" = filter(true),
                                                   "Op./Log.  Approval" = filter(true),
                                                   "Send to Workshop Aprroval" = filter(true),
                                                   "Open COF" = filter(true),
                                                   "VRI Approved Ok" = filter(true),
                                                   Delivered = filter(false),
                                                   "VRI Location" = FIELD("Location Filter"),
                                                   "Model Name" = FIELD("Model Filter"),
                                                   "Estimate Approved" = filter(false),
                                                   Sold = filter(false)));
            Description = 'VRI';
            FieldClass = FlowField;
        }
        field(12; "Under Repairs"; Integer)
        {
            /*   CalcFormula = Count("VRI Table" WHERE (Arrived=filter(true),
                                                     "Problem Vehicle"=filter(true),
                                                     "Pass to Sales/Marketing"=filter(false),
                                                     "Send For Approval"=filter(true),
                                                     "Send VRI Request"=filter(true),
                                                     "Op./Log.  Approval"=filter(true),
                                                     "Send to Workshop Aprroval"=filter(true),
                                                     "Open COF"=filter(true),
                                                     "VRI Approved Ok"=filter(true),
                                                     Delivered=filter(false),
                                                     "VRI Location"=FIELD("Location Filter"),
                                                     "Model Name"=FIELD("Model Filter"),
                                                     Estimate Approved=filter(true),
                                                     Sold=filter(false)));
              Description = 'VRI';
              FieldClass = FlowField; */
        }
        field(13; "Completed Repairs"; Integer)
        {
            CalcFormula = Count("VRI Table" WHERE(Arrived = filter(true),
                                                   "Problem Vehicle" = filter(true),
                                                   "Pass to Sales/Marketing" = filter('No'),
                                                   "Send For Approval" = filter(true),
                                                   "Send VRI Request" = filter(true),
                                                   "Op./Log.  Approval" = filter(true),
                                                   "Send to Workshop Aprroval" = filter(true),
                                                   "Open COF" = filter(true),
                                                   "Estimate Approved" = filter(true),
                                                   Delivered = filter(true),
                                                   "VRI Location" = FIELD("Location Filter"),
                                                   "Model Name" = FIELD("Model Filter")));
            Description = 'VRI';
            FieldClass = FlowField;
        }
        field(14; "Available For Transfer"; Integer)
        {
            CalcFormula = Count("VRI Table" WHERE("Problem Vehicle" = filter(false),
                                                   Arrived = filter(true),
                                                   "Pass to Sales/Marketing" = filter(true),
                                                   "VRI Location" = FIELD("Location Filter"),
                                                   "Model Name" = FIELD("Model Filter"),
                                                   Transferred = filter(false),
                                                   Sold = filter(false)));
            Description = 'VRI';
            FieldClass = FlowField;
        }
        field(15; "PV Available For Transfer"; Integer)
        {
            CalcFormula = Count("VRI Table" WHERE("Problem Vehicle" = filter(true),
                                                   Arrived = filter(true),
                                                   "Pass to Sales/Marketing" = filter(true),
                                                   "VRI Location" = FIELD("Location Filter"),
                                                   "Model Name" = FIELD("Model Filter"),
                                                   Sold = filter(false),
                                                   Transferred = filter(false)));
            Description = 'VRI';
            FieldClass = FlowField;
        }
        field(16; "Sales and Marketing"; Integer)
        {
            CalcFormula = Count("VRI Table" WHERE(Arrived = filter(true),
                                                   "Pass to Sales/Marketing" = filter(true),
                                                   "VRI Location" = FIELD("Location Filter"),
                                                   "Model Name" = FIELD("Model Filter"),
                                                   Transferred = filter(true),
                                                   Sold = filter(false)));
            Description = 'VRI';
            FieldClass = FlowField;
        }
        field(17; ISPV; Integer)
        {
            CalcFormula = Count("VRI Table" WHERE("In-Stock" = filter(true),
                                                   "Pass to Sales/Marketing" = filter(false)));
            Description = 'VRI';
            FieldClass = FlowField;
        }
        field(18; "Vehicle Sold"; Integer)
        {
            CalcFormula = Count("VRI Table" WHERE(Arrived = filter(true),
                                                   "VRI Location" = FIELD("Location Filter"),
                                                   "Model Name" = FIELD("Model Filter"),
                                                   Sold = filter(true)));
            Description = 'VRI';
            FieldClass = FlowField;
        }
        field(19; "New Service Appointment"; Integer)
        {
            Description = 'KDW';
        }
        field(20; "Today's Service Appointment"; Integer)
        {
            Description = 'KDW';
        }
        field(21; "Booked Service Appointment"; Integer)
        {
            Description = 'KDW';
        }
        field(22; "Appointment Preparation"; Integer)
        {
            Description = 'KDW';
        }
        field(23; "General Repairs/Estimate"; Integer)
        {
            Description = 'KDW';
        }
        field(24; "Job Entry Walk In"; Integer)
        {
            Description = 'KDW';
        }
        field(25; "Job Instruction"; Integer)
        {
            Description = 'KDW';
        }
        field(26; Delivery; Integer)
        {
            Description = 'KDW';
        }
        field(27; "Completed Job Instruction"; Integer)
        {
            Description = 'KDW';
        }
        field(28; "Location Filter"; Code[100])
        {
            FieldClass = FlowFilter;
            TableRelation = Location.Code;
        }
        field(29; "Model Filter"; Text[50])
        {
            FieldClass = FlowFilter;
            TableRelation = Model."Model Name";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        DateFilter: DateFormula;
}

