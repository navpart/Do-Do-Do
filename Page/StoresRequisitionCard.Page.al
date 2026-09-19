page 50205 "Stores Requisition Card"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Stores Requisition Header.";
    SourceTableView = SORTING("No.", Type)
                      WHERE(Type = FILTER(Issue));

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
            part("Requisition Lines"; "Stores Req. Subform")
            {
                Caption = 'Lines';
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
        area(navigation)
        {
            action("New Requistion")
            {
                Caption = 'New Requistion';
                Image = NewDocument;
                Promoted = true;

                trigger OnAction()
                begin
                    storeReqHead.INIT;
                    Rec := storeReqHead;
                    NEWREQ;
                    Rec.Type := Doctype;
                    Rec.INSERT(TRUE);
                    /*IF UserRec.GET("User ID") THEN
                    BEGIN
                    VALIDATE("Global Dimension 1 Code",UserRec."Department Code");
                    MODIFY;
                    END;*/

                end;
            }
            action("Alloy New Requisition")
            {
                Caption = 'Alloy New Requisition';
                Image = NewDocument;
                Promoted = true;

                trigger OnAction()
                begin
                    storeReqHead.INIT;
                    Rec := storeReqHead;
                    ALLOYNEWREQ;
                    Rec.Type := Doctype;
                    Rec.INSERT(TRUE);
                    /*IF UserRec.GET("User ID") THEN
                    BEGIN
                    VALIDATE("Global Dimension 1 Code",UserRec."Department Code");
                    MODIFY;
                    END;*/

                end;
            }
            action(CreateIssue)
            {
                Caption = 'Notify &Store';
                Image = Allocate;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                Visible = CreateIssueVisible;

                trigger OnAction()
                begin
                    IF NOT CONFIRM('Are you sure that you want to notify stores?') THEN
                        EXIT;

                    Rec.CreateIssueAlloy;

                    StoreReqHeader := Rec;
                    IF Rec.Type = Rec.Type::Issue THEN
                        StoreReqHeader.Type := StoreReqHeader.Type::"Posted Issue";
                    IF Rec.Type = Rec.Type::Return THEN
                        StoreReqHeader.Type := StoreReqHeader.Type::"Posted Return";

                    StoreReqHeader."Date Issued" := TODAY;
                    StoreReqHeader.INSERT;

                    // copy lines to posted entry
                    StoreReqLine.SETRANGE(StoreReqLine."Document Type", Rec.Type);
                    StoreReqLine.SETRANGE(StoreReqLine."Document No.", Rec."No.");
                    StoreReqLine.FINDFIRST;
                    REPEAT
                        StoreReqLine2 := StoreReqLine;
                        StoreReqLine2."Document Type" := StoreReqHeader.Type;
                        StoreReqLine2.INSERT;
                    UNTIL StoreReqLine.NEXT = 0;

                    // delete req.
                    StoreReqLine.DELETEALL;
                    Rec.DELETE;
                end;
            }
            action("Print Alloy Rims")
            {
                Caption = 'Print Alloy Rims';
                Image = Print;
                Promoted = true;

                trigger OnAction()
                begin
                    StoreReqHeader.SETRANGE(StoreReqHeader."No.", Rec."No.");
                    IF StoreReqHeader.FINDFIRST THEN
                        REPORT.RUNMODAL(50385, TRUE, TRUE, StoreReqHeader);
                end;
            }
        }
    }

    trigger OnInit()
    begin
        CreateIssueVisible := TRUE;
        PrintVisible := TRUE;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        NEWREQ;
    end;

    trigger OnOpenPage()
    begin
        Rec.FILTERGROUP(3);

        "Doc. Type" := Rec.GETFILTER(Rec.Type);
        CASE "Doc. Type" OF
            'Issue':
                Doctype := 0;
            'Return':
                Doctype := 1;
        END;
        Rec.SETRANGE(Type, Doctype);
        Rec.FILTERGROUP(2);

        IF Rec.Type > 1 THEN BEGIN
            CurrPage.EDITABLE := FALSE;
            PrintVisible := TRUE;
            CreateIssueVisible := FALSE;
        END
        ELSE BEGIN
            CurrPage.EDITABLE := TRUE;
            PrintVisible := TRUE;
            CreateIssueVisible := TRUE;
        END;


        InvtSetup.GET;
        IF UserRec.GET(USERID) THEN BEGIN
            IF InvtSetup."Material Requisition Nos" <> '' THEN
                Noseriesrec.GET(InvtSetup."Material Requisition Nos") ELSE
                ERROR('Please specify requistion no. series!');
            NoseriesLinerec.SETRANGE(NoseriesLinerec."Series Code", Noseriesrec.Code);
            IF NOT NoseriesLinerec.FIND('-') THEN ERROR('No Series is not specified!');
        END;
    end;

    var
        StoreReqHeader: Record "Stores Requisition Header.";
        StoreReqLine: Record "Stores Req. Line.";
        StoreReqLine2: Record "Stores Req. Line.";
        UserRec: Record "User Setup";
        InvtSetup: Record "Inventory Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Noseriesrec: Record "No. Series";
        NoseriesLinerec: Record "No. Series Line";
        storeReqHead: Record "Stores Requisition Header.";
        DepartmentRec: Record "Dimension Value";
        operationType: Integer;
        Doctype: Option;
        "Doc. Type": Text[30];

        PrintVisible: Boolean;

        CreateIssueVisible: Boolean;


    procedure NEWREQ()
    begin
        InvtSetup.GET;
        IF Rec."No." = '' THEN BEGIN
            InvtSetup.TESTFIELD(InvtSetup."Material Requisition Nos");
            NoSeriesMgt.GetNextNo(InvtSetup."Material Requisition Nos");
            Rec."Workshop Document" := TRUE;
        END;
    end;

    procedure ALLOYNEWREQ()
    begin
        InvtSetup.GET;
        IF Rec."No." = '' THEN BEGIN
            InvtSetup.TESTFIELD(InvtSetup."Alloy Rim Requisition Nos");
            NoSeriesMgt.GetNextNo(InvtSetup."Alloy Rim Requisition Nos");
            Rec."Workshop Document" := TRUE;
        END;
    end;
}

