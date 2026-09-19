page 50480 "Posted Stores Requsition Card"
{
    ApplicationArea = All;
    Editable = false;
    PageType = Card;
    SourceTable = "Stores Requisition Header.";

    layout
    {
        area(content)
        {
            group(General)
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
            part(SalesReqLines; 50206)
            {
                SubPageLink = "Document No." = FIELD("No."),
                              "Document Type" = FIELD(Type);
            }
            group("Alloy Wheel")
            {
                Caption = 'Alloy Wheel';
                field("Invoice No."; Rec."Invoice No.")
                {
                }
                field("Waybill No."; Rec."Waybill No.")
                {
                    Editable = false;
                }
                field("Waybill Date"; Rec."Waybill Date")
                {
                    Editable = false;
                }
                field("Dealer Name"; Rec."Dealer Name")
                {
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                }
                field(Description2; Rec.Description2)
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
                separator(Control2)
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

