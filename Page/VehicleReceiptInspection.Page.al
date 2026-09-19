page 50410 "Vehicle Receipt Inspection"
{
    CardPageID = "Vehicle Receipt Approval";
    PageType = List;
    SourceTable = "VRI Table";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("VRI Code"; Rec."VRI Code")
                {
                    Editable = false;
                }
                field("VRI Location"; Rec."VRI Location")
                {
                }
                field("VRI Date"; Rec."VRI Date")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                    Editable = false;
                }
                field("Model No."; Rec."Model No.")
                {
                    Editable = false;
                }
                field("Model Name"; Rec."Model Name")
                {
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                }
                field("Item Serial No."; Rec."Item Serial No.")
                {
                    Editable = false;
                }
                field("Engine No."; Rec."Engine No.")
                {
                    Editable = false;
                }
                field("Key No."; Rec."Key No.")
                {
                    Editable = false;
                }
                field("Confirmed Physically"; Rec."Confirmed Physically")
                {
                }
                field("Physically By"; Rec."Physically By")
                {
                    Editable = false;
                }
                field("Not Fixed"; Rec."Not Fixed")
                {
                }
                field("Approved for Sales&Mkt"; Rec."Approved for Sales&Mkt")
                {
                }
                field("Approve for Sales&mkt By"; Rec."Approve for Sales&mkt By")
                {
                }
                field("Pass to Sales/Marketing"; Rec."Pass to Sales/Marketing")
                {
                }
                field(Arrived; Rec.Arrived)
                {
                }
                field("Problem Vehicle"; Rec."Problem Vehicle")
                {
                }
                field(Sold; Rec.Sold)
                {
                }
                field("COF No"; Rec."COF No")
                {
                }
                field("Send For Approval"; Rec."Send For Approval")
                {
                }
                field("Send VRI Request"; Rec."Send VRI Request")
                {
                }
                field("Op./Log.  Approval"; Rec."Op./Log.  Approval")
                {
                }
                field("Send to Workshop"; Rec."Send to Workshop")
                {
                }
                field("Estimate Approved"; Rec."Estimate Approved")
                {
                }
                field("Open COF"; Rec."Open COF")
                {
                }
                field("Send for Est. Verification"; Rec."Send for Est. Verification")
                {
                }
                field("VRI Approved Ok"; Rec."VRI Approved Ok")
                {
                }
                field(Delivered; Rec.Delivered)
                {
                }
                field(Transferred; Rec.Transferred)
                {
                }
                field("In-Stock"; Rec."In-Stock")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Open)
            {
                Caption = 'Open';
                action("Open VRI Page")
                {
                    Caption = 'Open VRI Page';
                    Image = Card;
                    RunObject = Page 50261;
                    RunPageLink = "VRI Code" = FIELD("VRI Code");
                }
                separator(Separator2)
                {
                }
                action("Move to Transfer Folder")
                {
                    Caption = 'Move to Transfer Folder';
                    Image = TransferOrder;

                    trigger OnAction()
                    begin
                        VRIRec.SETCURRENTKEY("Confirmed Physically");
                        VRIRec.SETRANGE("Confirmed Physically", TRUE);
                        IF VRIRec.FINDFIRST THEN BEGIN
                            REPEAT
                                VRIRec."Pass to Sales/Marketing" := TRUE;
                                VRIRec.MODIFY;
                            UNTIL VRIRec.NEXT = 0;
                        END;
                        MESSAGE('Physically checked OK vehicles are now available for transfer!');
                    end;
                }
                separator(Separator1)
                {
                }
                action("Transfer to Sale/Marketing")
                {
                    Caption = 'Transfer to Sale/Marketing';
                    Image = "Action";
                    //RunObject = Report 50398;
                }
                action("Update Sales")
                {
                    Caption = 'Update Sales';
                    Image = "Report";
                    // RunObject = Report 50407;
                }
            }
        }
    }

    var
        VRIRec: Record 50058;
}

