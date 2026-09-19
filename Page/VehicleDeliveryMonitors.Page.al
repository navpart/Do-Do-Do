page 50378 "Vehicle Delivery Monitors"
{
    ApplicationArea = All;
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Vehicle Delivery Monitor";
    SourceTableView = SORTING("Serial No.")
                      WHERE(Open = CONST(false),
                            Delivered = CONST(false));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    Editable = false;
                }
                field(Overdue; Rec.Overdue)
                {
                    Editable = false;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    Editable = false;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    Editable = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    Editable = false;
                }
                field("Item No."; Rec."Item No.")
                {
                    Editable = false;
                }
                field("Invoice No"; Rec."Invoice No")
                {
                    Editable = false;
                }
                field("Customer Code"; Rec."Customer Code")
                {
                    Editable = false;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                }
                field("Inventory Group"; Rec."Inventory Group")
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                    Editable = false;
                }
                field("Exterior Colour Name"; Rec."Exterior Colour Name")
                {
                    Editable = false;
                }
                field("Exterior Colour Code"; Rec."Exterior Colour Code")
                {
                    Editable = false;
                }
                field("Key No."; Rec."Key No.")
                {
                    Editable = false;
                }
                field(Open; Rec.Open)
                {
                }
                field(Delivered; Rec.Delivered)
                {
                }
            }
            field(COUNT; Rec.COUNT)
            {
                Caption = 'Line Count';
            }
            label(Monitor)
            {
                CaptionClass = Text19042010;
                Style = Standard;
                StyleExpr = TRUE;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Function")
            {
                Caption = '&Function';
                action("Refresh List")
                {
                    Caption = 'Refresh List';

                    trigger OnAction()
                    var
                        SerialNo: Code[20];
                    begin
                        VehMonitor2.SETCURRENTKEY(Delivered);
                        VehMonitor2.SETRANGE(Delivered, FALSE);
                        IF VehMonitor2.FINDFIRST THEN BEGIN
                            REPEAT
                                VehMonitor2.DELETE;
                            UNTIL VehMonitor2.NEXT = 0;
                        END;


                        SerialNo := '';
                        ItemLedgEntry.SETCURRENTKEY("Entry Type", "Serial No.", Open, Positive, "Posting Date");
                        ItemLedgEntry.SETRANGE("Entry Type", 1);
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Serial No.");
                        ItemLedgEntry.SETFILTER("Serial No.", '<>%1', '');
                        ItemLedgEntry.SETRANGE(Positive, FALSE);
                        ItemLedgEntry.SETRANGE(Open, FALSE);
                        IF ItemLedgEntry.FINDSET THEN
                            REPEAT
                                IF SerialNo <> ItemLedgEntry."Serial No." THEN BEGIN
                                    SerialNo := ItemLedgEntry."Serial No.";
                                    ItemLedgEntry2.SETCURRENTKEY("Entry Type", "Serial No.", Open, Positive, "Posting Date");
                                    ItemLedgEntry2.SETRANGE(ItemLedgEntry2."Serial No.", SerialNo);
                                    ItemLedgEntry2.SETRANGE("Entry Type", 1);
                                    ItemLedgEntry2.SETRANGE(Positive, FALSE);
                                    ItemLedgEntry2.SETRANGE(Open, FALSE);
                                    IF ItemLedgEntry2.FINDLAST THEN BEGIN
                                        Rec."Serial No." := ItemLedgEntry2."Serial No.";
                                        Rec."Customer Code" := ItemLedgEntry2."Source No.";
                                        IF CustRec.GET(Rec."Customer Code") THEN
                                            Rec."Customer Name" := CustRec.Name;
                                        Rec."Entry No." := ItemLedgEntry2."Entry No.";
                                        Rec."Invoice No" := ItemLedgEntry2."Document No.";
                                        Rec."Item No." := ItemLedgEntry2."Item No.";
                                        Rec.Description := ItemLedgEntry2.Description;
                                        Rec."Location Code" := ItemLedgEntry2."Location Code";
                                        Rec."Engine No." := ItemLedgEntry2."Engine No.";
                                        Rec."Exterior Colour Name" := ItemLedgEntry2."Exterior Colour Name";
                                        Rec."Exterior Colour Code" := ItemLedgEntry2."Exterior Colour Code";
                                        Rec."Key No." := ItemLedgEntry2."Key No.";
                                        Rec."Posting Date" := ItemLedgEntry2."Posting Date";
                                        VehMonitor.SETRANGE(VehMonitor."Serial No.", SerialNo);
                                        IF NOT VehMonitor.FINDFIRST THEN
                                            Rec.INSERT ELSE
                                            ;
                                    END;
                                END;
                            UNTIL ItemLedgEntry.NEXT = 0;
                        MESSAGE('Sold vehicles have been retrieved!');
                    end;
                }

                action("Overdue Vehicles")
                {
                    Caption = 'Overdue Vehicles';
                    //RunObject = Report 50397;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        PostingDateOnFormat;
        SerialNoOnFormat;
    end;

    var
        ItemLedgEntry: Record 32;
        ItemLedgEntry2: Record 32;
        CustRec: Record 18;
        VehMonitor: Record 50056;
        VehMonitor2: Record 50056;

        "Posting DateEmphasize": Boolean;

        "Serial No.Emphasize": Boolean;
        Text19042010: Label 'Vehicle Delivery Monitoring System';

    local procedure PostingDateOnFormat()
    begin
        IF Rec."Posting Date" < TODAY - 5 THEN
            "Posting DateEmphasize" := TRUE;
    end;

    local procedure SerialNoOnFormat()
    begin
        IF Rec."Posting Date" < TODAY - 5 THEN
            "Serial No.Emphasize" := TRUE;
    end;
}

