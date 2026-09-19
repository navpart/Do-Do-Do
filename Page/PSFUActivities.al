namespace AL_TNL.AL_TNL;

page 50104 "PSFU Activities"
{
    ApplicationArea = All;
    PageType = CardPart;
    SourceTable = "Service Adviser Cue";
    Caption = 'Activities';
    layout
    {
        area(Content)
        {
            cuegroup("Post-Service Follow-up")
            {
                field(Open; Rec."PSFU-Open")
                {
                    Caption = 'PSFU-Open';
                    DrillDownPageID = "PSFU List";
                }
                field("PSFU-List Today"; Rec."PSFU-Open Today")
                {
                    Caption = 'PSFU-List Today';
                    DrillDownPageID = "PSFU List Today";
                }
                field(Treated; Rec."PSFU-Treated")
                {
                    Caption = 'PSFU-Treated';
                    DrillDownPageID = "Service Index List-Treated";
                }
                field("Repeat Repair"; Rec."Repeat Repair")
                {
                    DrillDownPageID = "Repeat Repair";
                }
                field("Customer Complaint List"; Rec."Customer Complaint List")
                {
                }
            }
        }
    }
}
