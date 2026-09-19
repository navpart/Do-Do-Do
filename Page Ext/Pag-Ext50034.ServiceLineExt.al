namespace AL_TNL.AL_TNL;

using Microsoft.Service.Document;

pageextension 50034 "Service Line Ext" extends "Service Lines"
{
    layout
    {
        addafter("Service Item No.")
        {
            field("Job Type"; Rec."Job Type")
            {
                ApplicationArea = All;
            }
        }

        addafter("Line Discount Amount")
        {
            field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
            {
                ApplicationArea = All;
            }
            field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
            {
                ApplicationArea = All;
            }
        }

    }

    actions
    {
        addafter(Reserve)
        {
            action(PrintBP)
            {
                ApplicationArea = All;
                Caption = 'Print BP Materials';
                ToolTip = 'Print body and paint materials.';
                Image = PrintChecklistReport;
                PromotedCategory = Process;
                Promoted = true;

                trigger OnAction()
                begin
                    ServiceLine.SetRange("Document No.", Rec."Document No.");
                    if ServiceLine.FindFirst() then
                        Report.RunModal(50632, true, true, ServiceLine);
                end;

            }
        }
    }

    var
        ServiceLine: Record "Service Line";

}
