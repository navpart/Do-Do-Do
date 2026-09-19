page 70179 "Audit Cue"
{
    PageType = CardPart;
    SourceTable = "Procument Cue";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            cuegroup("Opex Approval")
            {
                Caption = 'Opex Approval';
                field("Opex Approval- HOD"; Rec."Opex Approval- HOD")
                {
                    DrillDownPageID = "Head of Dept. Appr.";
                }
                field("Opex Approval-  Audit"; Rec."Opex Approval-  Audit")
                {
                    DrillDownPageID = "Head of Audit Appr.";
                }
                field("Opex HOD Adv. Apprv."; Rec."Opex HOD Adv. Apprv.")
                {
                    Caption = 'Adv. Opex HOD Approval';
                    DrillDownPageID = "Opex Advance HOD Paymt Appr.";
                }
                field("Opex Adv. Apprv."; Rec."Opex Adv. Apprv.")
                {
                    Caption = 'Opex Adv. Apprv.-Audit';
                    DrillDownPageID = "Advance Paymt Appr.";
                }
                field("Approved Opex"; Rec."Approved Opex")
                {
                    DrillDownPageID = "Move to LPO Opex";
                }
                field("Opex Compliance Check"; Rec."Opex Compliance Check")
                {
                    DrillDownPageID = "Compliance Check";
                }
                field("Opex Balance/Full Payment-HOD"; Rec."Opex Balance/Full Payment-HOD")
                {
                    DrillDownPageID = "Full  Payment Appr.";
                }
                field("OpexBalance/Full Payment-Audit"; Rec."OpexBalance/Full Payment-Audit")
                {
                    DrillDownPageID = "Full  Payment Appr.";
                }
            }
            cuegroup("Capex Approval")
            {
                Caption = 'Capex Approval';
                field("Capex Approval- HOD"; Rec."Capex Approval- HOD")
                {
                }
                field("Capex Approval-  Audit"; Rec."Capex Approval-  Audit")
                {
                    DrillDownPageID = "Head of Audit Appr.-Capex";
                }
                field("Approved Capex"; Rec."Approved Capex")
                {
                    DrillDownPageID = "Move to LPO -Capex";
                }
                field("Capex Adv. Apprv."; Rec."Capex Adv. Apprv.")
                {
                    Caption = 'Head of Audit Adv. Capex Apprv.';
                    DrillDownPageID = "Advance Paymt Appr.-Capex";
                }
                field("Capex Compliance Check"; Rec."Capex Compliance Check")
                {
                    DrillDownPageID = "Compliance Check-Capex";
                }
                field("<Capex HOD Adv. Apprv.>"; Rec."Capex HOD Adv. Apprv.")
                {
                    Caption = 'Adv. Capex HOD Approval';
                    DrillDownPageID = "Capex Advance HOD Paymt Appr.";
                }
                field("Capex Balance/Full Payment-HOD"; Rec."Capex Balance/Full Payment-HOD")
                {
                    DrillDownPageID = "Full  Payment Appr.-Capex";
                }
                field("Capex Bal./Full Payment-Audit"; Rec."Capex Bal./Full Payment-Audit")
                {
                    DrillDownPageID = "Full  Payment Appr.-Capex";
                }
            }
            cuegroup("Online Sales")
            {
                field("Audit Sales order"; Rec."Audit Sales order")
                {
                    DrillDownPageID = "Sales Shipment Audit List";
                    LookupPageID = "Sales Shipment Audit List";
                }
            }
            cuegroup("Local Part Purchase")
            {
                Caption = 'Local Part Purchase';
                field("LPP List"; Rec."LPP List")
                {
                    DrillDownPageID = "LPP List";
                }
                field("Compliance Check LPP"; Rec."Compliance Check LPP")
                {
                    DrillDownPageID = "Compliance Check LPP";
                }
                field("HOD Audit Approval LPP"; Rec."HOD Audit Approval LPP")
                {
                    DrillDownPageID = "HOD Audit Approval LPP";
                }
            }
            cuegroup("Leave ReqApproval")
            {
                Caption = 'Leave Req. Approval';
                field("Leave Req. Approval"; Rec."Leave Req. Approval")
                {
                    DrillDownPageID = "Leave Req. Approval";
                }
            }
            cuegroup("IOU Approval")
            {
                Caption = 'IOU Approval';
                field("IOU HOD Audit Approval"; Rec."IOU HOD Audit Approval")
                {
                    DrillDownPageID = "IOU HOD Appr. Audit";
                }
                field("IOU Audit Approval"; Rec."IOU Audit Approval")
                {
                    DrillDownPageID = "IOU Appr. Audit";
                }
            }
            cuegroup("IOU Settlements")
            {
                Caption = 'IOU Settlements';
                field("IOU Retirement Audit"; Rec."IOU Retirement Audit")
                {
                    Caption = 'IOU Settlements Audit';
                    DrillDownPageID = "IOU Retire. Appr. Audit";
                }
            }
            cuegroup("Air Online Order")
            {
                Caption = 'Air Online Order';
                field("Head of Dept. Part"; Rec."AOO HOD Part")
                {
                    DrillDownPageID = "HOD Part Approval FM";
                    LookupPageID = "HOD Part Approval FM";
                }
                field("AOO Compliance Check"; Rec."AOO Compliance Check")
                {
                    DrillDownPageID = "Compliance Check FM";
                    LookupPageID = "Compliance Check FM";
                }
                field("AOO HOD Audit"; Rec."AOO HOD Audit")
                {
                    DrillDownPageID = "Head of Audit Approval FM";
                    LookupPageID = "Head of Audit Approval FM";
                }
            }
            cuegroup("PoolCar Approval")
            {
                Caption = 'Pool Car Approval';
                field("Pool Car Approval"; Rec."Pool Car Approval")
                {
                    Caption = 'Pool Car Approval';
                    DrillDownPageID = "Pool Car Appr. Audit";
                    LookupPageID = "Pool Car Appr. Audit";
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        IF NOT Rec.GET(USERID) THEN BEGIN
            Rec.INIT;
            Rec."User id" := USERID;
            Rec.INSERT;
        END;
    end;

    var
        UserSetup: Record 91;
}

