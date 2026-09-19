page 50615 "MD Cue"
{
    PageType = CardPart;
    SourceTable = "Procument Cue";
    ApplicationArea = All;
    Caption = 'Approvals';
    Editable = true;
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            cuegroup(OpexApprv)
            {
                Caption = 'Opex';
                //ShowCaption = false;
                field("Opex Approval- MD"; Rec."Opex Approval- MD")
                {
                    ApplicationArea = All;
                    DrillDownPageID = "Managing Dir. Appr.";
                    Caption = 'Opex Approval';
                    Editable = true;

                }
                field("Opex Balance/Full Payment-MD"; Rec."Opex Balance/Full Payment-MD")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Balance/Full Payment Opex-MD";
                    Caption = 'Opex Balance/Full Payment';
                }

            }
            cuegroup(CapexApprv)
            {
                Caption = 'Capex';
                field("Capex Approval- MD"; Rec."Capex Approval- MD")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Managing Dir. Appr.-Capex";
                    Caption = 'Capex Approval';
                }
                field("Capex Balance/Full Payment-MD"; Rec."Capex Balance/Full Payment-MD")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Bal/Full Payment Capex-MD";
                    Caption = 'Capex Balance/Full Payment';
                }

            }
            cuegroup(Others)
            {
                field("MD Approval Leave"; Rec."MD Approval Leave")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "MD Approval List";
                    Caption = 'Leave Approvals';
                }
                field("Local Part Purch. MD"; Rec."Local Part Purch. MD")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "MD Procurement Approval";
                    Caption = 'Local Part Purchase';
                }
                field("Local Part Purch. Isolo"; Rec."Local Part Purch. Isolo")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "MD Proc Apprv Isolo";
                    Caption = 'Local Part Purch. Isolo';
                }
                field("Air Online Order MD"; Rec."Air Online Order MD")
                {
                    DrillDownPageID = "MD Approval FM";
                    LookupPageID = "MD Approval FM";
                }
            }
        }

    }

    trigger OnOpenPage();
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}

