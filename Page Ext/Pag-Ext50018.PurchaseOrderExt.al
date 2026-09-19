pageextension 50018 "Purchase Order Ext" extends "Purchase Order"
{

    layout
    {
        addafter("Vendor Invoice No.")
        {
            field("External Document No."; Rec."External Document No.")
            {
                ApplicationArea = All;
            }
        }


        addafter(Status)
        {
            field("Total Quantity"; Rec."Total Quantity")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }

    }

    actions
    {
        /* modify("Request Approval")
        {
            Visible = false;
        } */

        addafter(Approve)
        {
            action(NotifyUser)
            {
                ApplicationArea = All;
                Caption = 'Notify a User';
                Image = Email;
                ToolTip = 'This function sends an email notification to a user.';
                promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    NotifierCU: Codeunit "Notifier";
                begin
                    NotifierCU.NotifyUserForReviewWithLink('Purchase Order', Rec."No.", Rec."Posting Description", Rec.UrlText);
                end;
            }
        }

        addafter(MoveNegativeLines)
        {

            action(ImportBOL)
            {
                ApplicationArea = All;
                Caption = 'Import BOL';
                Image = ImportExcel;
                ToolTip = 'This function imports vehicles from bill of materials.';

                trigger OnAction()
                begin
                    XMLPORT.RUN(50068, FALSE, TRUE);
                end;
            }
            action(BreakLine)
            {
                ApplicationArea = All;
                Caption = 'Break Line';
                Image = BreakpointsList;
                ToolTip = 'This function breaks the first line on the purchase order into lines.';

                trigger OnAction()
                begin
                    Rec.BreaktoLines();
                end;
            }
            action(GenerateVRICodes)
            {
                ApplicationArea = All;
                Caption = 'Generate VRI Codes';
                Image = CreateBinContent;
                ToolTip = 'This function generates VRI Codes for the vehicles on the purchase order lines.';

                trigger OnAction()
                begin
                    Rec.GenerateVRI();
                end;
            }
        }
    }
}
