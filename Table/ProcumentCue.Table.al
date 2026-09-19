table 70015 "Procument Cue"
{

    fields
    {
        field(1; "User id"; Code[50])
        {
        }
        field(2; "Opex Approval- HOD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE(Send = CONST(true),
                                                             "Head of Department" = FILTER(<> Approved),
                                                             Reject = CONST(false),
                                                             "Document Type" = CONST(Opex)));
            FieldClass = FlowField;
        }
        field(3; "Opex Approval-  Audit"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Head of Department" = CONST(Approved),
                                                            "Head of Audit" = FILTER(<> Approved),
                                                            Reject = CONST(false),
                                                            "Document Type" = CONST(Opex)));
            FieldClass = FlowField;
        }
        field(4; "Opex Approval- GM"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE(ListGM = FILTER(true),
                                                            "Head of Audit" = CONST(Approved),
                                                            "General Manager" = FILTER(" " | "On-hold"),
                                                            "Managing Director" = CONST(" "),
                                                            Reject = CONST(false),
                                                            "Document Type" = CONST(Opex)));
            FieldClass = FlowField;
        }
        field(5; "Opex Approval- MD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE(ListMD = FILTER(true),
                                                            "Head of Audit" = CONST(Approved),
                                                            "General Manager" = CONST(" "),
                                                            "Managing Director" = FILTER(" " | "On-hold"),
                                                            Reject = CONST(false),
                                                            "Document Type" = CONST(Opex)));
            FieldClass = FlowField;
        }
        field(6; "Opex Adv. Apprv."; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Adv. Pymt. Required" = CONST(true),
                                                             "Adv. Paymt. Audit" = FILTER(" " | "On-hold"),
                                                             "Document Type" = CONST(Opex),
                                                             Reject = CONST(false),
                                                             "Adv. Paymt. HOD" = FILTER(Approved)));
            FieldClass = FlowField;
        }
        field(7; "Opex Compliance Check"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE(Compliance = CONST(true),
                                                             "Balance Paymt. Appr." = CONST(false),
                                                             "Document Type" = CONST(Opex),
                                                             Reject = CONST(false)));
            FieldClass = FlowField;
        }
        field(8; "Opex Balance/Full Payment-MD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Bal. Paymt. Audit" = FILTER(Approved),
                                                            ListMD = FILTER(true),
                                                            Compliance = CONST(true),
                                                            "Balance Paymt. Appr." = CONST(true),
                                                            "Balance Paymt." = CONST(false),
                                                            Closed = CONST(false),
                                                            "Document Type" = CONST(Opex),
                                                            "Bal. Paymt. MD" = FILTER('' | "On-hold"),
                                                            Reject = CONST(false)));
            FieldClass = FlowField;
        }
        field(9; "OpexBalance/Full Payment-Audit"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Bal. Paymt. HOD" = FILTER(Approved),
                                                            "Bal. Paymt. Audit" = FILTER(" " | "On-hold"),
                                                            Compliance = CONST(true),
                                                            "Balance Paymt. Appr." = CONST(true),
                                                            "Balance Paymt." = CONST(false),
                                                            Closed = CONST(false),
                                                            "Document Type" = CONST(Opex),
                                                            Reject = CONST(false)));
            FieldClass = FlowField;
        }
        field(10; "Opex Balance/Full Payment-GM"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Bal. Paymt. Audit" = FILTER(Approved),
                                                             ListGM = CONST(true),
                                                             Compliance = CONST(true),
                                                             "Balance Paymt. Appr." = CONST(true),
                                                             "Balance Paymt." = CONST(false),
                                                             Closed = CONST(false),
                                                             "Document Type" = CONST(Opex),
                                                             Reject = CONST(false)));
            FieldClass = FlowField;
        }
        field(11; "Opex Balance/Full Payment-HOD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Bal. Paymt. HOD" = FILTER(" " | "On-hold"),
                                                            Compliance = CONST(true),
                                                            "Balance Paymt. Appr." = CONST(true),
                                                            "Balance Paymt." = CONST(false),
                                                            Closed = CONST(false),
                                                            "Document Type" = CONST(Opex),
                                                            Reject = CONST(false)));
            FieldClass = FlowField;
        }
        field(12; "Approved Opex"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Move to LPO" = CONST(true),
                                                            "Voucher Raised" = CONST(false),
                                                            Compliance = CONST(false),
                                                            "Adv. Pymt. Required" = CONST(false),
                                                            "Document Type" = CONST(Opex),
                                                            Reject = CONST(false)));
            FieldClass = FlowField;
        }
        field(13; "Capex Approval- HOD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE(Send = CONST(true),
                                                            "Head of Department" = FILTER(<> Approved),
                                                            Reject = CONST(false),
                                                            "Document Type" = CONST(Capex),
                                                            Closed = CONST(false)));
            FieldClass = FlowField;
        }
        field(14; "Capex Approval-  Audit"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Head of Department" = CONST(Approved),
                                                            "Head of Audit" = FILTER(<> Approved),
                                                            Reject = CONST(false),
                                                            "Document Type" = CONST(Capex)));
            FieldClass = FlowField;
        }
        field(15; "Capex Approval- GM"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Capex Type" = FILTER('Sundry Asset'),
                                                               "Head of Audit" = CONST(Approved),
                                                               "General Manager" = FILTER(" " | "On-hold"),
                                                               "Managing Director" = CONST(" "),
                                                               Reject = CONST(false),
                                                               "Document Type" = CONST(Capex)));
            FieldClass = FlowField;
        }
        field(16; "Capex Approval- MD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Document Type" = const(Capex),
                                                            "Head of Audit" = CONST(Approved),
                                                            "General Manager" = CONST(" "),
                                                            "Managing Director" = FILTER(<> Approved),
                                                            Reject = CONST(false),
                                                            "Document Type" = CONST(Capex),
                                                            "Proposed Purchase Amount" = FILTER(> 100000)));
            FieldClass = FlowField;
        }
        field(17; "Capex Adv. Apprv."; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Adv. Pymt. Required" = CONST(true), "Adv. Paymt. Audit" = FILTER(<> Approved),
            "Document Type" = CONST(Capex), Reject = CONST(false), "Adv. Paymt. HOD" = FILTER(Approved)));

            FieldClass = FlowField;
        }
        field(18; "Capex Compliance Check"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE(Compliance = CONST(true),
                                                            "Balance Paymt. Appr." = CONST(false),
                                                            "Document Type" = CONST(Capex),
                                                            Reject = CONST(false)));
            FieldClass = FlowField;
        }
        field(19; "Capex Balance/Full Payment-MD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Bal. Paymt. Audit" = FILTER(Approved),
                                                            Compliance = CONST(true),
                                                            "Balance Paymt. Appr." = CONST(true),
                                                            "Balance Paymt." = CONST(false),
                                                            Closed = CONST(false),
                                                            "Document Type" = CONST(Capex),
                                                            Reject = CONST(false),
                                                            "Proposed Purchase Amount" = FILTER(>= 100000),
                                                            "Bal. Paymt. MD" = FILTER(' ')));
            FieldClass = FlowField;
        }
        field(20; "Capex Bal./Full Payment-Audit"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Bal. Paymt. HOD" = FILTER(Approved),
                                                            "Bal. Paymt. Audit" = FILTER(<> Approved | Rejected),
                                                            Compliance = CONST(true),
                                                            "Balance Paymt. Appr." = CONST(true),
                                                            "Balance Paymt." = CONST(false),
                                                            Closed = CONST(false),
                                                            "Document Type" = CONST(Capex),
                                                            Reject = CONST(false)));
            FieldClass = FlowField;
        }
        field(21; "Capex Balance/Full Payment-GM"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Bal. Paymt. Audit" = FILTER(Approved),
                                                            ListGM = CONST(true),
                                                            Compliance = CONST(true),
                                                            "Balance Paymt. Appr." = CONST(true),
                                                            "Balance Paymt." = CONST(false),
                                                            Closed = CONST(false),
                                                            "Document Type" = CONST(Opex),
                                                            Reject = CONST(false)));
            FieldClass = FlowField;
        }
        field(22; "Capex Balance/Full Payment-HOD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Bal. Paymt. HOD" = FILTER(<> Approved | Rejected),
                                                            Compliance = CONST(true),
                                                            "Balance Paymt. Appr." = CONST(true),
                                                            "Balance Paymt." = CONST(false),
                                                            Closed = CONST(false),
                                                            "Document Type" = CONST(Capex),
                                                            Reject = CONST(false)));
            FieldClass = FlowField;
        }
        field(23; "Approved Capex"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Move to LPO" = CONST(true),
                                                            "Voucher Raised" = CONST(false),
                                                            Compliance = CONST(false),
                                                            "Adv. Pymt. Required" = CONST(false),
                                                            "Document Type" = CONST(Capex),
                                                            Reject = CONST(false)));
            FieldClass = FlowField;
        }
        field(24; "MD Approval Leave"; Integer)
        {
            CalcFormula = Count("Leave Request3" WHERE("MD Leave Approval" = CONST(true),
                                                        Approved2 = CONST(false),
                                                        Treated = CONST(false),
                                                        Reject = CONST(false)));
            FieldClass = FlowField;
        }

        field(25; "LPP List"; Integer)
        {

            CalcFormula = Count("Local Part Purchase Register" WHERE(Send = CONST(false)));
            FieldClass = FlowField;

        }
        field(26; "Compliance Check LPP"; Integer)
        {
            CalcFormula = Count("Local Part Purchase Register" WHERE(HoDPartApproval = CONST(true),
                                                                      ComplianceCheck = CONST(true),
                                                                      HoDAuditApproval = CONST(false),
                                                                      "Procurement Approval" = CONST(false),
                                                                      "MD Approval" = CONST(false),
                                                                      "GM Approval" = CONST(false),
                                                                      Rejected = CONST(false)));
            FieldClass = FlowField;

        }
        field(27; "HOD Audit Approval LPP"; Integer)
        {
            CalcFormula = Count("Local Part Purchase Register" WHERE(ComplianceCheck = CONST(true),
                                                                       HoDAuditApproval = CONST(true),
                                                                       "Procurement Approval" = CONST(false),
                                                                       "MD Approval" = CONST(false),
                                                                       "GM Approval" = CONST(false),
                                                                       //"Order Type" = FILTER(<> "Isolo Store"),
                                                                       Rejected = CONST(false)));
            FieldClass = FlowField;

        }
        field(28; "Local Part Purch. MD"; Integer)
        {
            CalcFormula = Count("Local Part Purchase Register" WHERE("Procurement Approval" = CONST(false),
                                                                      "MD Approval" = CONST(true),
                                                                      "GM Approval" = CONST(false),
                                                                      "Genarate LPO" = CONST(false),
                                                                      Rejected = CONST(false),
                                                                      "Compliance check" = CONST(Satisfactory),
                                                                      "Head of Audit" = CONST(Approved),
                                                                      "Total Purchase Value" = FILTER(> 499999),
                                                                      "Order Type" = FILTER(<> "Isolo Store")));
            FieldClass = FlowField;
        }
        field(29; "Local Part Purch. Isolo"; Integer)
        {
            CalcFormula = Count("Local Part Purchase Register" WHERE("Procurement Approval" = CONST(false),
                                                                      "MD Approval" = CONST(true),
                                                                      "GM Approval" = CONST(false),
                                                                      "Genarate LPO" = CONST(false),
                                                                      Rejected = CONST(false),
                                                                      "Compliance check" = CONST(Satisfactory),
                                                                      "Total Purchase Value" = FILTER(> 499999),
                                                                      "Order Type" = FILTER("Isolo Store")));
            FieldClass = FlowField;
        }
        field(30; "Leave Req. Approval"; Integer)
        {
            CalcFormula = Count("Leave Request3" WHERE("Global Dimension 1 code" = filter('08AUDSYS'),
                                                        "Send for Approval" = CONST(true),
                                                        "1st Approval Status" = FILTER(" " | "On hold")));
            FieldClass = FlowField;
        }
        field(31; "IOU Audit Approval"; Integer)
        {
            CalcFormula = Count("IOU Register" WHERE("2nd Approval to" = FILTER('ADEWUMI'),
                                                      "1st Apprv. Status" = FILTER(Approved),
                                                      "2nd Apprv. Status" = FILTER(" " | "on Hold"),
                                                      Reject = CONST(false)));
            FieldClass = FlowField;
        }
        field(32; "Leave Req. FINACC Appr."; Integer)
        {
            CalcFormula = Count("Leave Request3" WHERE("Global Dimension 1 code" = CONST('07FINACC'),
                                                        "Send for Approval" = CONST(true),
                                                        "1st Approval Status" = FILTER(" " | "on Hold"),
                                                        "1st Approver" = filter('PAA')));
            FieldClass = FlowField;

        }
        field(33; "Opex HOD Adv. Apprv."; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Adv. Pymt. Required" = CONST(true),
                                                            "Document Type" = CONST(Opex),
                                                            "Adv. Paymt. HOD" = FILTER("On-hold" | " "),
                                                            Reject = FILTER(false)));
            FieldClass = FlowField;

        }
        field(34; "Capex HOD Adv. Apprv."; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Adv. Pymt. Required" = CONST(true),
                                                            "Document Type" = CONST(Capex),
                                                            "Adv. Paymt. HOD" = FILTER("On-hold" | " "),
                                                            Reject = FILTER(false)));


            Description = 'Capex HOD Adv. Apprv.';
            FieldClass = FlowField;

        }
        field(36; "Capex Approval- PAA"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Capex Type" = FILTER('Sundry Asset'),
                                                            "Head of Audit" = CONST(Approved),
                                                            "General Manager" = FILTER(" " | "On-hold"),
                                                            "Managing Director" = CONST(" "),
                                                            Reject = CONST(false),
                                                            "Document Type" = CONST(Capex)));
            FieldClass = FlowField;

        }
        field(37; "IOU PAA Approval"; Integer)
        {
            CalcFormula = Count("IOU Register" WHERE("3rd Approval to" = FILTER('PAA'),
                                                      "3rd Apprv.Status" = FILTER(" " | "on Hold"),
                                                      Reject = CONST(false)));
            FieldClass = FlowField;

        }
        field(38; "Opex Compliance Check PAA"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE(Compliance = CONST(true),
                                                            "Bal. Paymt. by HOD" = filter('Mrs. Patricia Abanum'),
                                                            "Document Type" = CONST(Opex),
                                                            Reject = CONST(false),
                                                            "Bal. Paymt. HOD" = FILTER(" " | "On-hold")));
            FieldClass = FlowField;

        }
        field(39; "Opex Approval- PAA"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE(Send = CONST(true),
                                                            "Document Type" = CONST(Opex),
                                                            "Send To" = filter('PAA')));
            FieldClass = FlowField;

        }
        field(40; "AOO HOD Part"; Integer)
        {
            CalcFormula = Count("Air Online Header" WHERE(Send = CONST(true),
                                                           HoDPartApproval = CONST(true),
                                                           ComplianceCheck = CONST(false)));
            FieldClass = FlowField;

        }
        field(41; "AOO Compliance Check"; Integer)
        {
            CalcFormula = Count("Air Online Header" WHERE(Send = CONST(true),
                                                           HoDPartApproval = CONST(true),
                                                           ComplianceCheck = CONST(true),
                                                           HoDAuditApproval = CONST(false)));
            FieldClass = FlowField;

        }
        field(42; "AOO HOD Audit"; Integer)
        {
            CalcFormula = Count("Air Online Header" WHERE(Send = CONST(true),
                                                           HoDPartApproval = CONST(true),
                                                           ComplianceCheck = CONST(true),
                                                           HoDAuditApproval = CONST(true),
                                                           GMapproval = CONST(false),
                                                           MDapproval = CONST(false)));
            FieldClass = FlowField;
        }
        field(43; "Air Online Order MD"; Integer)
        {
            /*  CalcFormula = Count("Air Online Header" WHERE(Send = CONST(true),
                                                            HoDPartApproval = CONST(true),
                                                            ComplianceCheck = CONST(true),
                                                            HoDAuditApproval = CONST(true),
                                                            GMapproval = CONST(false),
                                                            MDapproval = CONST(true))); */

            CalcFormula = Count("Air Online Header" WHERE(Send = CONST(true),
            "Head of Department" = CONST(Approved), "Compliance check" = CONST(Satisfactory), "Head of Audit" = CONST(Approved), "Managing Director" = FILTER(' ' | 'On-hold')));
            FieldClass = FlowField;
        }

        field(44; "Pool Car Approval"; Integer)
        {
            CalcFormula = Count("Pool Car Register" WHERE("Global Dimension 1 code" = CONST('08AUDSYS'),
                                                           "1st Approval Status" = FILTER(' '),
                                                           "Send for Approval" = FILTER(true)));
            FieldClass = FlowField;
        }
        field(45; "Opex ApprovalDD- HOD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE(Send = CONST(true),
                                                            "Head of Department" = FILTER(<> Approved),
                                                            Reject = CONST(false),
                                                            "Document Type" = CONST(Opex),
                                                            "Department Code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(46; "Opex ApprovalDD-  Audit"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Head of Department" = CONST(Approved),
                                                            "Head of Audit" = FILTER(<> Approved),
                                                            Reject = CONST(false),
                                                            "Document Type" = CONST(Opex),
                                                            "Department Code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(47; "Opex ApprovalDD- GM"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE(ListGM = FILTER(true),
                                                            "Head of Audit" = CONST(Approved),
                                                            "General Manager" = FILTER(<> Approved | Rejected),
                                                            "Managing Director" = CONST(" "),
                                                            Reject = CONST(false),
                                                            "Document Type" = CONST(Opex),
                                                            "Department Code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(48; "Opex ApprovalDD- MD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE(ListMD = FILTER(true),
                                                            "Head of Audit" = CONST(Approved),
                                                            "General Manager" = CONST(" "),
                                                            "Managing Director" = FILTER(<> Approved | Rejected),
                                                            Reject = CONST(false),
                                                            "Document Type" = CONST(Opex),
                                                            "Department Code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(49; "Opex Adv. Apprv.DD"; Integer)
        {

            FieldClass = FlowField;
            CalcFormula = Count("Procurement Header" WHERE("Adv. Pymt. Required" = CONST(true),
                                                            "Adv. Paymt. Audit" = FILTER('On-hold' | " "),
                                                            "Document Type" = CONST(Opex),
                                                            Reject = CONST(false),
                                                            "Adv. Paymt. HOD" = FILTER('Approved'),
                                                            "Department Code" = CONST('04DDEV')));
        }
        field(50; "Opex Compliance CheckDD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE(Compliance = CONST(true),
                                                            "Balance Paymt. Appr." = CONST(false),
                                                            "Document Type" = CONST(Opex),
                                                            Reject = CONST(false),
                                                            "Department Code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(51; "Opex Balance/Full PaymentDD-MD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Bal. Paymt. Audit" = FILTER(Approved),
                                                            ListMD = FILTER(true),
                                                            Compliance = CONST(true),
                                                            "Balance Paymt. Appr." = CONST(true),
                                                            "Balance Paymt." = CONST(false),
                                                            Closed = CONST(false),
                                                            "Document Type" = CONST(Opex),
                                                            Reject = CONST(false),
                                                            "Department Code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(52; "OpexBalance/Full PaymtDD-Audit"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Bal. Paymt. HOD" = FILTER(Approved),
                                                            "Bal. Paymt. Audit" = FILTER(<> Approved | Rejected),
                                                            Compliance = CONST(true),
                                                            "Balance Paymt. Appr." = CONST(true),
                                                            "Balance Paymt." = CONST(false),
                                                            Closed = CONST(false),
                                                            "Document Type" = CONST(Opex),
                                                            Reject = CONST(false),
                                                            "Department Code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(53; "Opex Balance/Full PaymtDD-GM"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Bal. Paymt. Audit" = FILTER(Approved),
                                                            ListGM = CONST(true),
                                                            Compliance = CONST(true),
                                                            "Balance Paymt. Appr." = CONST(true),
                                                            "Balance Paymt." = CONST(false),
                                                            Closed = CONST(false),
                                                            "Document Type" = CONST(Opex),
                                                            Reject = CONST(false),
                                                            "Department Code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(54; "Opex Balance/Full PaymtDD-HOD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Bal. Paymt. HOD" = FILTER(<> Approved | Rejected),
                                                            Compliance = CONST(true),
                                                            "Balance Paymt. Appr." = CONST(true),
                                                            "Balance Paymt." = CONST(false),
                                                            Closed = CONST(false),
                                                            "Document Type" = CONST(Opex),
                                                            Reject = CONST(false),
                                                            "Department Code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(55; "Approved OpexDD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Move to LPO" = CONST(true),
                                                            "Voucher Raised" = CONST(false),
                                                            Compliance = CONST(false),
                                                            "Adv. Pymt. Required" = CONST(false),
                                                            "Document Type" = CONST(Opex),
                                                            Reject = CONST(false),
                                                            "Department Code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(56; "Capex ApprovalDD- HOD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE(Send = CONST(true),
                                                            "Head of Department" = FILTER(<> Approved),
                                                            Reject = CONST(false),
                                                            "Document Type" = CONST(Capex),
                                                            Closed = CONST(false),
                                                            "Department Code" = CONST('04DDEV')));
            Enabled = false;
            FieldClass = FlowField;
        }
        field(57; "Capex ApprovalDD-  Audit"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Head of Department" = CONST(Approved),
                                                            "Head of Audit" = FILTER(<> Approved),
                                                            Reject = CONST(false),
                                                            "Document Type" = CONST(Capex),
                                                            "Department Code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(58; "Capex ApprovalDD- GM"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Capex Type" = FILTER("Sundry Asset"),
                                                            "Head of Audit" = CONST(Approved),
                                                            "General Manager" = FILTER(<> Approved | Rejected),
                                                            "Managing Director" = CONST(" "),
                                                            Reject = CONST(false),
                                                            "Document Type" = CONST(Capex),
                                                            "Department Code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(59; "Capex ApprovaDDl- MD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Capex Type" = FILTER("Fixed Asset"),
                                                            "Head of Audit" = CONST(Approved),
                                                            "General Manager" = CONST(" "),
                                                            "Managing Director" = FILTER(<> Approved | Rejected),
                                                            Reject = CONST(false),
                                                            "Document Type" = CONST(Capex),
                                                            "Proposed Purchase Amount" = FILTER(> 100000),
                                                            "Department Code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(60; "Capex Adv. Apprv.DD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Adv. Pymt. Required" = CONST(true),
                                                            "Adv. Paymt. Audit" = FILTER(<> Approved),
                                                            "Document Type" = CONST(Capex),
                                                            Reject = CONST(false),
                                                            "Department Code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(61; "Capex Compliance CheckDD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE(Compliance = CONST(true),
                                                            "Balance Paymt. Appr." = CONST(false),
                                                            "Document Type" = CONST(Capex),
                                                            Reject = CONST(false),
                                                            "Department Code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(62; "Capex Balance/Full PaymtDD-MD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Bal. Paymt. Audit" = FILTER(Approved),
                                                            Compliance = CONST(true),
                                                            "Balance Paymt. Appr." = CONST(true),
                                                            "Balance Paymt." = CONST(false),
                                                            Closed = CONST(false),
                                                            "Document Type" = CONST(Capex),
                                                            Reject = CONST(false),
                                                            "Proposed Purchase Amount" = FILTER(>= 100000),
                                                            "Bal. Paymt. MD" = FILTER(' ' | 'On-hold'),
                                                            "Department Code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(63; "Capex Bal./Full PaymtDD-Audit"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Bal. Paymt. HOD" = FILTER(Approved),
                                                            "Bal. Paymt. Audit" = FILTER(<> Approved | Rejected),
                                                            Compliance = CONST(true),
                                                            "Balance Paymt. Appr." = CONST(true),
                                                            "Balance Paymt." = CONST(false),
                                                            Closed = CONST(false),
                                                            "Document Type" = CONST(Capex),
                                                            Reject = CONST(false),
                                                            "Department Code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(64; "Capex Balance/Full PaymtDD-GM"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Bal. Paymt. Audit" = FILTER(Approved),
                                                            ListGM = CONST(true),
                                                            Compliance = CONST(true),
                                                            "Balance Paymt. Appr." = CONST(true),
                                                            "Balance Paymt." = CONST(false),
                                                            Closed = CONST(false),
                                                            "Document Type" = CONST(Opex),
                                                            Reject = CONST(false),
                                                            "Department Code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(65; "Capex Balance/Full PaymtDD-HOD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Bal. Paymt. HOD" = FILTER(<> Approved | Rejected),
                                                            Compliance = CONST(true),
                                                            "Balance Paymt. Appr." = CONST(true),
                                                            "Balance Paymt." = CONST(false),
                                                            Closed = CONST(false),
                                                            "Document Type" = CONST(Capex),
                                                            Reject = CONST(false),
                                                            "Department Code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(66; "Approved CapexDD"; Integer)
        {
            CalcFormula = Count("Procurement Header" WHERE("Move to LPO" = CONST(true),
                                                            "Voucher Raised" = CONST(false),
                                                            Compliance = CONST(false),
                                                            "Adv. Pymt. Required" = CONST(false),
                                                            "Document Type" = CONST(Capex),
                                                            Reject = CONST(false),
                                                            "Department Code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(67; "MD Approval LeaveDD"; Integer)
        {
            CalcFormula = Count("Leave Request3" WHERE("MD Leave Approval" = CONST(true),
                                                        Approved2 = CONST(false),
                                                        Treated = CONST(false),
                                                        Reject = CONST(false),
                                                        "Global Dimension 1 code" = CONST('04DDEV')));
            FieldClass = FlowField;
        }
        field(68; "Leave Req. ApprovalDD"; Integer)
        {
            CalcFormula = Count("Leave Request3" WHERE("Global Dimension 1 code" = CONST('04DDEV'),
                                                        "Send for Approval" = CONST(true),
                                                        "1st Approval Status" = FILTER(' ' | 'On hold')));
            FieldClass = FlowField;
        }
        field(69; "Leave Req. ApprovalDD/HR"; Integer)
        {
            CalcFormula = Count("Leave Request3" WHERE("Global Dimension 1 code" = CONST('04DDEV'),
                                                        "Send for Approval" = CONST(true),
                                                        "1st Approval Status" = FILTER(Approved),
                                                        "2nd Approval Status" = FILTER(' ' | 'On hold')));
            FieldClass = FlowField;
        }
        field(70; "IOU Retirement Audit"; Integer)
        {
            CalcFormula = Count("IOU Retirement Header" WHERE("2nd Approval to" = CONST('ADEWUMI'),
                                                               "1st Apprv. Status" = FILTER(Approved),
                                                               "3rd Approval to" = FILTER(''),
                                                               "Send for Approval" = CONST(true)));
            FieldClass = FlowField;
        }
        field(71; "IOU HOD Audit Approval"; Integer)
        {
            CalcFormula = Count("IOU Register" WHERE("1st Approval to" = FILTER('BRANO'),
                                                      "1st Apprv. Status" = FILTER(' ' | 'on Hold'),
                                                      "Send for Approval" = FILTER(true),
                                                      Reject = CONST(false)));
            FieldClass = FlowField;
        }
        field(72; "Audit Sales order"; Integer)
        {
            CalcFormula = Count("Sales Shipment Header" WHERE("Online Order" = CONST(true),
                                                               "Audit Summary" = FILTER(' ' | 'Non-Satisfactory'),
                                                               "Order No." = FILTER('TSOV*'),
                                                               "Sell-to Customer No." = FILTER('TDV01020|TDV05020')));
            FieldClass = FlowField;
        }



    }

    keys
    {
        key(Key1; "User id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

