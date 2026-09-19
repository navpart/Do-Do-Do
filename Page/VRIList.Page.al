page 50262 "VRI List"
{
    ApplicationArea = All;
    CardPageID = "VRI Form";
    PageType = List;
    SourceTable = "VRI Table";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("VRI Code"; Rec."VRI Code")
                {
                    Editable = false;
                }
                field("VRI Location"; Rec."VRI Location")
                {
                    Editable = false;
                }
                field("VRI Date"; Rec."VRI Date")
                {
                    Editable = false;
                }
                field("VRI Inspector Code"; Rec."VRI Inspector Code")
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
                field("Item No."; Rec."Item No.")
                {
                    Editable = false;
                }
                field(Description; Rec.Description)
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
                field("Item Serial No."; Rec."Item Serial No.")
                {
                    Caption = 'Chassis No.';
                    Editable = false;
                }
                field("Exterior Colour Name"; Rec."Exterior Colour Name")
                {
                    Editable = false;
                }
                field("Exterior Colour"; Rec."Exterior Colour")
                {
                    Editable = false;
                }
                field("Problem Vehicle"; Rec."Problem Vehicle")
                {
                    Editable = false;
                }
                field("Pass to Sales/Marketing"; Rec."Pass to Sales/Marketing")
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
                field("Physically Date Time"; Rec."Physically Date Time")
                {
                    Editable = false;
                }
                field(Arrived; Rec.Arrived)
                {
                }
                field("Current Date"; Rec."Current Date")
                {

                    trigger OnValidate()
                    begin
                        Rec."No. of Days in Stock" := Rec."Current Date" - Rec."Date Of Arrival";
                    end;
                }
                field("Arrive Approve by"; Rec."Arrive Approve by")
                {
                    Editable = false;
                }
                field("Date Of Arrival"; Rec."Date Of Arrival")
                {
                    Editable = false;
                }
                field("Time of Arrival"; Rec."Time of Arrival")
                {
                    Editable = false;
                }
                field(Fixed; Rec.Fixed)
                {
                    Editable = false;
                }
                field(Transferred; Rec.Transferred)
                {
                    Editable = false;
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
                action("Open VRI Form")
                {
                    Caption = 'Open VRI Form';
                    RunObject = Page 50261;
                    RunPageOnRec = true;
                    Image = ListPage;
                }
                separator(Control1)
                {
                }
                /* action("Open VRI Approval Form")
                {
                    Caption = 'Open VRI Approval Form';
                    RunObject = Page 50429;
                    RunPageOnRec = true;
                } */
                separator(Control2)
                {
                }
                action("Move To Transfer")
                {
                    Caption = 'Move To Transfer';
                    Image = ListPage;

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
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        IF Rec."Current Date" <> 0D THEN
            Rec.VALIDATE("Current Date", WORKDATE);
    end;

    var
        VRIRec: Record 50058;
}

