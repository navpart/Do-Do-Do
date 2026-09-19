page 51615 "xMD Cue"
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
                field("Opex Approval- MD"; Rec."Opex Approval- MD")
                {
                    DrillDownPageID = "Managing Dir. Appr.";
                }
                field("Opex Balance/Full Payment-MD"; Rec."Opex Balance/Full Payment-MD")
                {
                    DrillDownPageID = "Balance/Full Payment Opex-MD";
                }
                field("Capex Approval- MD"; Rec."Capex Approval- MD")
                {
                    DrillDownPageID = "Managing Dir. Appr.-Capex";
                }
                field("Capex Balance/Full Payment-MD"; Rec."Capex Balance/Full Payment-MD")
                {
                    DrillDownPageID = "Bal/Full Payment Capex-MD";
                }
                field("MD Approval Leave"; Rec."MD Approval Leave")
                {
                    DrillDownPageID = "MD Approval List";
                }
                field("Local Part Purch. MD"; Rec."Local Part Purch. MD")
                {
                    DrillDownPageID = "MD Procurement Approval";
                }
                field("Local Part Purch. Isolo"; Rec."Local Part Purch. Isolo")
                {
                    DrillDownPageID = "MD Proc Apprv Isolo";
                }
                field("Air Online Order MD"; Rec."Air Online Order MD")
                {
                    DrillDownPageID = "MD Approval FM";
                    LookupPageID = "MD Approval FM";
                }
            }
        }
    }

    actions
    {
    }
}

