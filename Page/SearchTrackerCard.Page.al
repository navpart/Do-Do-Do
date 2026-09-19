page 50117 "Search Tracker Card"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Parts Enquiry";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Search Code"; Rec."Search Code")
                {
                    Editable = false;
                }
                field("Request by"; Rec."Request by")
                {
                    Caption = 'Requesting  Customer';
                    TableRelation = Customer."No.";

                    trigger OnValidate()
                    begin
                        IF CustRec.GET(ReqBy) THEN BEGIN
                            ReqName := CustRec.Name;
                            ReqAdd := CustRec.Address;
                            ReqTel := CustRec."Phone No.";
                        END;
                    end;
                }
                field("Request Customer Name"; Rec."Request Customer Name")
                {
                    Caption = 'Customer Name';
                }
                field("Request Customer Address"; Rec."Request Customer Address")
                {
                    Caption = 'Customer Address';
                }
                field("Request phone"; Rec."Request phone")
                {
                    Caption = 'Contact Phone';
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Quantity Supplied"; Rec."Quantity Supplied")
                {
                    Caption = 'Qty Supplied';
                    DecimalPlaces = 0 : 0;

                    trigger OnValidate()
                    begin
                        IF ReqQty > (AvaQty + PurQTy - SaleQty) THEN
                            MESSAGE('You Dont Have Enough Quantity in stock');
                    end;
                }
                field("Record Locked"; Rec."Record Locked")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Non Specification"; Rec."Non Specification")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Order Type"; Rec."Order Type")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                    Editable = false;
                }
            }
            part("Search Tracker Entries"; "Search Tracker Lines")
            {
                SubPageLink = "Search Code" = FIELD("Search Code");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            /*  group(List)
             {
                 Caption = 'List';
                 action("List Order Detail")
                 {
                     Caption = 'List Order Detail';
                     RunObject = Page 50110;
                     RunPageLink = Field30 = FIELD("Search Code");
                     RunPageOnRec = true;
                     ShortCutKey = 'Shift+Ctrl+L';
                 }
             } */
        }
        area(processing)
        {
            action("Update Page")
            {
                Caption = 'Update Page';
                Image = UpdateDescription;

                trigger OnAction()
                begin
                    CustRec.SETRANGE("No.", Rec."Request by");
                    IF CustRec.FINDFIRST THEN BEGIN
                        REPEAT
                            Rec.VALIDATE("Request by");
                        UNTIL CustRec.NEXT = 0;
                    END;
                end;
            }
            action("Generate Sales Order")
            {
                Caption = 'Generate Sales Order';
                Image = CreateJobSalesInvoice;

                trigger OnAction()
                begin
                    //Rec.CreateInvoice(1);
                    Rec.CreateInvoice("Sales Document Type"::Order);

                    MESSAGE('Sales order has been generated!');
                end;
            }
            action("Generate Quote")
            {
                Caption = 'Generate Quote';
                Image = CreateCreditMemo;
                RunPageOnRec = true;

                trigger OnAction()
                begin
                    //Rec.CreateInvoice(0);
                    Rec.CreateInvoice("Sales Document Type"::Quote);
                    /*
                    RecPart.SETRANGE(RecPart."Search Code","Search Code");
                    IF RecPart.FIND('-') THEN
                    IF RecPart."Document No." <> '' THEN
                       ERROR('Invoice has been Raised on this Search Code,You Can Not Raise a Quotation on It again')
                    ELSE
                      REPORT.RUNMODAL(50175,TRUE,FALSE,RecPart);
                      RecPart.RESET;
                     */

                end;
            }
            action("Generate Invoice")
            {
                Caption = 'Generate Invoice';
                Image = "Action";
                Visible = false;

                trigger OnAction()
                begin
                    //Rec.CreateInvoice(2);
                    Rec.CreateInvoice("Sales Document Type"::Invoice);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Update Page_Promoted"; "Update Page")
                {
                }
                actionref("Generate Sales Order_Promoted"; "Generate Sales Order")
                {
                }
                actionref("Generate Quote_Promoted"; "Generate Quote")
                {
                }
                actionref("Generate Invoice_Promoted"; "Generate Invoice")
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        IF xRec."Search Code" <> '' THEN BEGIN
            xRec.TESTFIELD(xRec."Part No");
            xRec.TESTFIELD(xRec."Request by");
            xRec.TESTFIELD(xRec."Quantity Demanded");
            xRec.TESTFIELD(xRec."Request Date");
            xRec.TESTFIELD(xRec."Model No.");
            //xRec."Record Locked" := TRUE;
            xRec.MODIFY;
        END;
        Rec."Request Date" := TODAY;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Request Date" := TODAY;
    end;

    trigger OnOpenPage()
    begin
        //VALIDATE("Part No");
        //CurrPage.UPDATE;
    end;

    var
        SearchingCode: Code[20];
        Noseries: Record 309;
        ItemRec: Record 27;
        "PartNo.": Code[20];
        Description: Text[50];
        AvaQty: Decimal;
        UnPrice: Decimal;
        Model: Record 50014;
        ReqQty: Decimal;
        EnqRec: Record 50095;
        Tdate: Date;
        Location: Code[20];
        ReqName: Text[50];
        InvPosGrp: Code[20];
        GenPrdGrp: Code[20];
        ReqBy: Code[20];
        ReqAdd: Text[50];
        ReqTel: Code[30];
        ModelNAme: Text[50];
        ReqCont: Text[50];
        Ordered: Boolean;
        Urgent: Boolean;
        Commited: Boolean;
        ComValue: Decimal;
        Vart: Code[20];
        PurQTy: Decimal;
        SaleQty: Decimal;
        CustRec: Record 18;
        RecPart: Record 50095;
        JPMList: Record 50065;
        onstock: Boolean;
        ReadytoBuy: Boolean;
        InvoiceNo: Code[10];
        SupQty: Decimal;
        VarCode: Code[20];
        SalesHeader: Record 36;
        SalesLine: Record 37;
        UserSetup: Record 91;
        StockRec: Record 5700;
        VarRec: Record 5401;
        InvSetup: Record 313;
        Text19005884: Label 'Customer Detail';
}

