page 50237 "Fault Material Setup Line"
{
    Caption = 'Lines';
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Fault Setup Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Operation code"; Rec."Operation code")
                {
                    Visible = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                }
                field(Type; Rec.Type)
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field("Total Price"; Rec."Total Price")
                {
                }
                field("VAT%"; Rec."VAT%")
                {
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                }
                field("Price Incl VAT"; Rec."Price Incl VAT")
                {
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                }
                field("Posting Group"; Rec."Posting Group")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Availability)
            {
                /*  Caption = 'Availability';
                 Image = Warehouse;
                 Promoted = true;
                 PromotedCategory = Process;

                 trigger OnAction()
                 begin
                     ItemAvailFormsMgt.ShowItemAvailFromFaultSetup(Rec, ItemAvailFormsMgt.ByLocation)
                 end; */
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //SetUpNewLine;
        //Rec.Newline;
    end;

    var
        ServHeader: Record 5900;
        ServItem: Record 5940;
        ServItem2: Record 5940;
        ItemTrackingEntry: Record 6502;
        ServLoanerMgt: Codeunit 5901;
        ItemAvailFormsMgt: Codeunit 353;


    procedure FaultComments()
    var
        ServCommentLine: Record 5906;
    begin
        /*ServHeader.GET("Order No.");
        ServHeader.TESTFIELD("Customer No.");
        TESTFIELD("Line No.");
        
        ServCommentLine.RESET;
        ServCommentLine.SETRANGE(Type,ServCommentLine.Type::Fault);
        ServCommentLine.SETRANGE("No.","Order No.");
        ServCommentLine.SETRANGE("Table Line No.","Line No.");
        FORM.RUNMODAL(FORM::"Service Comment Sheet",ServCommentLine);
         */

    end;


    procedure ResolutionComments()
    var
        ServCommentLine: Record 5906;
    begin
        /*ServHeader.GET("Order No.");
        ServHeader.TESTFIELD("Customer No.");
        TESTFIELD("Line No.");
        
        ServCommentLine.RESET;
        ServCommentLine.SETRANGE(Type,ServCommentLine.Type::Resolution);
        ServCommentLine.SETRANGE("No.","Order No.");
        ServCommentLine.SETRANGE("Table Line No.","Line No.");
        FORM.RUNMODAL(FORM::"Service Comment Sheet",ServCommentLine);
         */

    end;


    procedure InternalComments()
    var
        ServCommentLine: Record 5906;
    begin
        /*ServHeader.GET("Order No.");
        ServHeader.TESTFIELD("Customer No.");
        TESTFIELD("Line No.");
        
        ServCommentLine.RESET;
        ServCommentLine.SETRANGE(Type,ServCommentLine.Type::Internal);
        ServCommentLine.SETRANGE("No.","Order No.");
        ServCommentLine.SETRANGE("Table Line No.","Line No.");
        FORM.RUNMODAL(FORM::"Service Comment Sheet",ServCommentLine);
         */

    end;


    procedure AccessoryComments()
    var
        ServCommentLine: Record 5906;
    begin
        /*ServHeader.GET("Order No.");
        ServHeader.TESTFIELD("Customer No.");
        TESTFIELD("Line No.");
        
        ServCommentLine.RESET;
        ServCommentLine.SETRANGE(Type,ServCommentLine.Type::Accessory);
        ServCommentLine.SETRANGE("No.","Order No.");
        ServCommentLine.SETRANGE("Table Line No.","Line No.");
        FORM.RUNMODAL(FORM::"Service Comment Sheet",ServCommentLine);
         */

    end;


    procedure LoanerComments()
    var
        ServCommentLine: Record 5906;
    begin
        /*ServHeader.GET("Order No.");
        ServHeader.TESTFIELD("Customer No.");
        
        ServCommentLine.RESET;
        ServCommentLine.SETRANGE(Type,ServCommentLine.Type::"Service Item Loaner");
        ServCommentLine.SETRANGE("No.","Order No.");
        ServCommentLine.SETRANGE("Table Line No.","Line No.");
        FORM.RUNMODAL(FORM::"Service Comment Sheet",ServCommentLine);
         */

    end;


    procedure RegisterServInvLines()
    var
        ServInvLine: Record 5902;
    begin
        /*TESTFIELD("Order No.");
        TESTFIELD("Line No.");
        CLEAR(ServInvLine);
        ServInvLine.SETRANGE("Order No.","Order No.");
        ServInvLine.FILTERGROUP(2);
        CLEAR(ServInvLines);
        ServInvLines.Initialize("Line No.");
        ServInvLines.SETTABLEVIEW(ServInvLine);
        ServInvLines.RUNMODAL;
        ServInvLine.FILTERGROUP(0);
         */

    end;


    procedure ShowServOrderWorksheet()
    var
        ServItemLine: Record 5901;
    begin
        /*TESTFIELD("Order No.");
        TESTFIELD("Line No.");
        
        CLEAR(ServItemLine);
        ServItemLine.SETRANGE("Order No.","Order No.");
        ServItemLine.FILTERGROUP(2);
        ServItemLine.SETRANGE("Line No.","Line No.");
        FORM.RUNMODAL(FORM::"Service Item Worksheet",ServItemLine);
        ServItemLine.FILTERGROUP(0);
         */

    end;


    procedure AllocateResource()
    var
        ServOrderAlloc: Record 5950;
    begin
        /*TESTFIELD("Order No.");
        TESTFIELD("Line No.");
        ServOrderAlloc.RESET;
        ServOrderAlloc.FILTERGROUP(2);
        ServOrderAlloc.SETFILTER(Status,'<>%1',ServOrderAlloc.Status::Canceled);
        ServOrderAlloc.SETRANGE("Service Order No.","Order No.");
        ServOrderAlloc.FILTERGROUP(0);
        ServOrderAlloc.SETRANGE("Service Item Line No.","Line No.");
        IF ServOrderAlloc.FIND('-') THEN;
        ServOrderAlloc.SETRANGE("Service Item Line No.");
        CLEAR(ResAlloc);
        ResAlloc.SETRECORD(ServOrderAlloc);
        ResAlloc.SETTABLEVIEW(ServOrderAlloc);
        ResAlloc.SETRECORD(ServOrderAlloc);
        ResAlloc.RUN;
         */

    end;


    procedure ReceiveLoaner()
    begin
        //ServLoanerMgt.ReceiveLoaner(Rec);
    end;


    procedure ShowServItemEventLog()
    var
        ServItemLog: Record 5942;
    begin
        /*TESTFIELD("Service Item No.");
        CLEAR(ServItemLog);
        ServItemLog.SETRANGE("Service Item No.","Service Item No.");
        FORM.RUNMODAL(FORM::"Service Item Log",ServItemLog);
         */

    end;


    procedure ShowChecklist()
    var
        TblshtgHeader: Record 5943;
    begin
        // TblshtgHeader.ShowForServItemLine(Rec);
    end;
}

