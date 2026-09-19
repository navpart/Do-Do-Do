page 50472 "Logistics/VRI Card"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Logistics Order";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Order No."; Rec."Order No.")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Chassis No."; Rec."Chassis No.")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Model; Rec.Model)
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Colour Name"; Rec."Colour Name")
                {
                }
                field("KM Reading"; Rec."KM Reading")
                {
                }
                field("Fuel Level"; Rec."Fuel Level")
                {
                }
                field("No. of Keys"; Rec."No. of Keys")
                {
                }
                field("Job Description"; Rec."Job Description")
                {
                }
                field("VRI Code"; Rec."VRI Code")
                {
                }
                field(Location; Rec.Location)
                {
                }
                field("Arrival Date"; Rec."Arrival Date")
                {
                }
                field("Date of Problem Report"; Rec."Date of Problem Report")
                {
                }
                field("Notify VRI"; Rec."Notify VRI")
                {
                }
                field("Sent By"; Rec."Sent By")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Action Taken")
            {
                Caption = 'Action Taken';
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                    IF Rec."VRI Code" = '' THEN
                        IF NOT CONFIRM('The Vehicle is an old stock, do you want to create a VRI Code?', FALSE) THEN
                            EXIT
                        ELSE BEGIN
                            VRIRec.SETCURRENTKEY("VRI Code");
                            IF VRIRec.FINDLAST THEN
                                NewVRICode := INCSTR(VRIRec."VRI Code");
                            VRIRec2.INIT;
                            VRIRec2."VRI Code" := NewVRICode;
                            VRIRec2.VALIDATE("Item Serial No.", Rec."Chassis No.");
                            VRIRec2.Arrived := TRUE;
                            VRIRec2."Arrive Approve by" := 'SYSTEM';
                            VRIRec2."Date Of Arrival" := TODAY;
                            VRIRec2.INSERT;

                            Rec."VRI Code" := NewVRICode;
                            Rec."Arrival Date" := VRIRec2."Date Of Arrival";
                            Rec.MODIFY;
                        END;

                    VRIRec3.GET(Rec."VRI Code");
                    IF VRIRec3."Pass to Sales/Marketing" THEN BEGIN
                        VRIRec3."Pass to Sales/Marketing" := FALSE;
                        VRIRec3."In-Stock" := TRUE;
                        VRIRec3.MODIFY;

                        IF InStock2.FINDLAST THEN
                            EntryNo := InStock2."Entry No." + 1 ELSE
                            EntryNo := 1;

                        InStock.INIT;
                        InStock."Entry No." := EntryNo;
                        InStock."VRI Code" := Rec."VRI Code";
                        InStock.Date := TODAY;
                        InStock.INSERT;
                        MESSAGE('In-stock Maintenance ''%1'' has been created!', Rec."VRI Code");
                    END;
                end;
            }
        }
    }

    var
        ItemLegEntry: Record 32;
        VRIRec: Record 50058;
        VRIRec2: Record 50058;
        VRIRec3: Record 50058;
        NewVRICode: Code[10];
        InStock: Record 50163;
        InStock2: Record 50163;
        EntryNo: Integer;
}

