page 50478 "Posted Stores Requisition"
{
    ApplicationArea = All;
    CardPageID = "Posted Stores Requsition Card";
    Editable = false;
    PageType = List;
    SourceTable = "Stores Requisition Header.";
    SourceTableView = SORTING("No.", Type)
                      WHERE(Type = CONST("Posted Issue"));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Fixed Assets No."; Rec."Fixed Assets No.")
                {
                }
                field("FA Description"; Rec."FA Description")
                {
                }
                field("Maintenance Code"; Rec."Maintenance Code")
                {
                }
                field("User/ Drivers Name"; Rec."User/ Drivers Name")
                {
                }
                field("Registration No."; Rec."Registration No.")
                {
                }
                field("Total Amount"; Rec."Total Amount")
                {
                }
                field("COF No"; Rec."COF No")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Print)
            {
                Caption = 'Print';
                action("Store Requisition")
                {
                    Caption = 'Store Requisition';

                    trigger OnAction()
                    begin
                        /*IF "Printed Copies" <> 0 THEN BEGIN
                          IF NOT MemberOf.FIND('-') THEN
                            ERROR('Store Requisition already printed!');
                          IF NOT CONFIRM('Store Requisition already printed!\Print anyway?') THEN
                            ERROR('Store Requisition not re-printed!');
                        END; Rec.       */
                        Rec.TestForValidity;


                        StoreReqHeader.SETRANGE(StoreReqHeader."No.", Rec."No.");
                        IF StoreReqHeader.FINDFIRST THEN
                            REPORT.RUNMODAL(50335, TRUE, TRUE, StoreReqHeader);

                        /*
                        SETRANGE("No.","No.");
                        REPORT.RUNMODAL(REPORT::"Stores Requisition Voucher",TRUE,FALSE,Rec);
                        SETRANGE("No.");
                        */

                    end;
                }
                separator(Control1)
                {
                }
                action("Alloy Rim")
                {
                    Caption = 'Alloy Rim';

                    trigger OnAction()
                    begin
                        StoreReqHeader.SETRANGE(StoreReqHeader."No.", Rec."No.");
                        IF StoreReqHeader.FINDFIRST THEN
                            REPORT.RUNMODAL(50385, TRUE, TRUE, StoreReqHeader);
                    end;
                }
            }
        }
    }

    var
        StoreReqHeader: Record 50101;
        StoreReqLine: Record 50102;
        StoreReqLine2: Record 50102;
        UserRec: Record 91;
        InvtSetup: Record 313;
        NoSeriesMgt: Codeunit "No. Series";
        Noseriesrec: Record 308;
        NoseriesLinerec: Record 309;
        storeReqHead: Record 50101;
        DepartmentRec: Record 349;
        operationType: Integer;
        Doctype: Option;
        "Doc. Type": Text[30];


    procedure NEWREQ()
    begin
    end;


    procedure ALLOYNEWREQ()
    begin
    end;
}

