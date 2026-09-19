page 70091 "Labour and Operation Card"
{
    Caption = 'Service Order';
    PageType = Document;
    PromotedActionCategories = 'New,Process,Report,Warehouse';
    RefreshOnActivate = true;
    SourceTable = "Service Header";
    SourceTableView = WHERE("Document Type" = FILTER(Order));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    Importance = Promoted;

                    trigger OnAssistEdit()
                    begin
                        IF Rec.AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field(Description; Rec.Description)
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        CustomerNoOnAfterValidate;
                    end;
                }
                field("Contact No."; Rec."Contact No.")
                {

                    trigger OnValidate()
                    begin
                        IF Rec.GETFILTER("Contact No.") = xRec."Contact No." THEN
                            IF Rec."Contact No." <> xRec."Contact No." THEN
                                Rec.SETRANGE("Contact No.");
                    end;
                }
                field(Name; Rec.Name)
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Address 2"; Rec."Address 2")
                {
                    Importance = Additional;
                }
                field("Post Code"; Rec."Post Code")
                {
                }
                field("Contact Name"; Rec."Contact Name")
                {
                }
                field("Phone No."; Rec."Phone No.")
                {
                }
                field("E-Mail"; Rec."E-Mail")
                {
                }
                field("Posting Description"; Rec."Posting Description")
                {
                }
                field("Workshop Store Rq. No"; Rec."Workshop Store Rq. No")
                {
                }
                field("Prices Including VAT"; Rec."Prices Including VAT")
                {
                }
                field(City; Rec.City)
                {
                }
                field("Phone No. 2"; Rec."Phone No. 2")
                {
                    Importance = Additional;
                }
                field("Notify Customer"; Rec."Notify Customer")
                {
                    Importance = Additional;
                }
                field("Service Order Type"; Rec."Service Order Type")
                {
                }
                field("Contract No."; Rec."Contract No.")
                {
                }
                field("Response Date"; Rec."Response Date")
                {
                    Importance = Promoted;
                }
                field("Response Time"; Rec."Response Time")
                {
                }
                field(Priority; Rec.Priority)
                {
                    Importance = Promoted;
                }
                field(Status; Rec.Status)
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Importance = Additional;
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    Importance = Additional;
                }
                field("Release Status"; Rec."Release Status")
                {
                    Importance = Promoted;
                }
            }
            part(ServItemLines; 5902)
            {
                SubPageLink = "Document No." = FIELD("No.");
            }
            part(ServiceLine; 70092)
            {
                SubPageLink = "Document Type" = FIELD("Document Type"),
                              "Document No." = FIELD("No.");
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        BilltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Bill-to Contact No."; Rec."Bill-to Contact No.")
                {
                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                }
                field("Bill-to Address"; Rec."Bill-to Address")
                {
                }
                field("Bill-to Address 2"; Rec."Bill-to Address 2")
                {
                    Importance = Additional;
                }
                field("Bill-to Post Code"; Rec."Bill-to Post Code")
                {
                }
                field("Bill-to City"; Rec."Bill-to City")
                {
                }
                field("Bill-to Contact"; Rec."Bill-to Contact")
                {
                }
                field("Your Reference"; Rec."Your Reference")
                {
                    Importance = Additional;
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                }
                field("Max. Labor Unit Price"; Rec."Max. Labor Unit Price")
                {
                    Importance = Additional;

                    trigger OnValidate()
                    begin
                        MaxLaborUnitPriceOnAfterValida;
                    end;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    Importance = Promoted;
                }
                field("Due Date"; Rec."Due Date")
                {
                    Importance = Promoted;
                }
                field("Payment Discount %"; Rec."Payment Discount %")
                {
                }
                field("Pmt. Discount Date"; Rec."Pmt. Discount Date")
                {
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                }
            }
            group(Shipping)
            {
                Caption = 'Shipping';
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        ShiptoCodeOnAfterValidate;
                    end;
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    Importance = Additional;
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    Importance = Promoted;
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    Importance = Promoted;
                }
                field("Ship-to Phone"; Rec."Ship-to Phone")
                {
                    Caption = 'Ship-to Phone';
                }
                field("Ship-to Phone 2"; Rec."Ship-to Phone 2")
                {
                    Importance = Additional;
                }
                field("Ship-to E-Mail"; Rec."Ship-to E-Mail")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Shipping Advice"; Rec."Shipping Advice")
                {
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                }
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                }
                field("Shipping Agent Service Code"; Rec."Shipping Agent Service Code")
                {
                }
                field("Shipping Time"; Rec."Shipping Time")
                {
                }
            }
            group(Details)
            {
                Caption = 'Details';
                field("Warning Status"; Rec."Warning Status")
                {
                    Importance = Promoted;
                }
                field("Link Service to Service Item"; Rec."Link Service to Service Item")
                {
                }
                field("Allocated Hours"; Rec."Allocated Hours")
                {
                }
                field("No. of Allocations"; Rec."No. of Allocations")
                {
                }
                field("No. of Unallocated Items"; Rec."No. of Unallocated Items")
                {
                }
                field("Service Zone Code"; Rec."Service Zone Code")
                {
                }
                field("Order Date"; Rec."Order Date")
                {

                    trigger OnValidate()
                    begin
                        OrderDateOnAfterValidate;
                    end;
                }
                field("Order Time"; Rec."Order Time")
                {

                    trigger OnValidate()
                    begin
                        OrderTimeOnAfterValidate;
                    end;
                }
                field("Expected Finishing Date"; Rec."Expected Finishing Date")
                {
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    Importance = Promoted;
                }
                field("Starting Time"; Rec."Starting Time")
                {
                }
                field("Actual Response Time (Hours)"; Rec."Actual Response Time (Hours)")
                {
                }
                field("Finishing Date"; Rec."Finishing Date")
                {
                }
                field("Finishing Time"; Rec."Finishing Time")
                {

                    trigger OnValidate()
                    begin
                        FinishingTimeOnAfterValidate;
                    end;
                }
                field("Service Time (Hours)"; Rec."Service Time (Hours)")
                {
                }
            }
            group("Foreign Trade")
            {
                Caption = 'Foreign Trade';
                field("Currency Code"; Rec."Currency Code")
                {
                    Importance = Promoted;

                    trigger OnAssistEdit()
                    begin
                        CLEAR(ChangeExchangeRate);
                        ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Rec."Posting Date");
                        IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
                            Rec.VALIDATE("Currency Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.UPDATE;
                        END;
                        CLEAR(ChangeExchangeRate);
                    end;
                }
                field("EU 3-Party Trade"; Rec."EU 3-Party Trade")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Transaction Specification"; Rec."Transaction Specification")
                {
                }
                field("Transport Method"; Rec."Transport Method")
                {
                }
                field("Exit Point"; Rec."Exit Point")
                {
                }

            }
            group("Vehicle Details")
            {
                Caption = 'Vehicle Details';
                field("User ID"; Rec."User ID")
                {
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                }
                field(Model; Rec.Model)
                {
                }
                field(Chassis; Rec.Chassis)
                {
                }
                field("Engine No."; Rec."Engine No.")
                {
                }
                field("Odometer Reading Reception"; Rec."Odometer Reading Reception")
                {
                }
                field("Reception Date"; Rec."Reception Date")
                {
                }
                field("Reception Time"; Rec."Reception Time")
                {
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                }
                field("Delivery Time"; Rec."Delivery Time")
                {
                }
                field("Customer's Requests"; Rec."Customer's Requests")
                {
                }
                field(PM; Rec.PM)
                {
                }
                field(GR; Rec.GR)
                {
                }
                field(Others; Rec.Others)
                {
                }
                field(Warranty; Rec.Warranty)
                {
                }
                field(Internal; Rec.Internal)
                {
                }
                field("D/Estimate"; Rec."D/Estimate")
                {
                }
                field("B&P"; Rec."B&P")
                {
                }
                field("B&P Estimate"; Rec."B&P Estimate")
                {
                }
                field(Painting; Rec.Painting)
                {
                }
            }
        }
        area(factboxes)
        {
            part(Factbox1; 9082)
            {
                SubPageLink = "No." = FIELD("Bill-to Customer No.");
                Visible = false;
            }
            part(Factbox2; 9084)
            {
                SubPageLink = "No." = FIELD("Customer No.");
                Visible = false;
            }
            part(Factbox3; 9085)
            {
                SubPageLink = "No." = FIELD("Customer No.");
                Visible = true;
            }
            part(Factbox4; 9086)
            {
                SubPageLink = "No." = FIELD("Bill-to Customer No.");
                Visible = false;
            }
            part(Factbox5; 9088)
            {
                Provider = ServItemLines;
                SubPageLink = "Document Type" = FIELD("Document Type"),
                              "Document No." = FIELD("Document No."),
                              "Line No." = FIELD("Line No.");
                Visible = true;
            }
            systempart(Links; Links)
            {
                Visible = false;
            }
            systempart(Notes; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";

                action("Demand Overview")
                {
                    Caption = 'Demand Overview';
                    Image = Forecast;

                    trigger OnAction()
                    var
                        DemandOverview: Page 5830;
                    begin
                        DemandOverview.SetCalculationParameter(TRUE);
                        //DemandOverview.SetParameters(0D, 4, Rec."No.", '', '');
                        DemandOverview.RUNMODAL;
                    end;
                }


                action("&Customer Card")
                {
                    Caption = '&Customer Card';
                    Image = Customer;
                    RunObject = Page 21;
                    RunPageLink = "No." = FIELD("Customer No.");
                    ShortCutKey = 'Shift+F7';
                }
                action("&Dimensions")
                {
                    AccessByPermission = TableData 348 = R;
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                    end;
                }

                action("Service Document Lo&g")
                {
                    Caption = 'Service Document Lo&g';
                    Image = Log;

                    trigger OnAction()
                    var
                        ServDocLog: Record 5912;
                    begin
                        ServDocLog.ShowServDocLog(Rec);
                    end;
                }


            }
            group("<Action36>")
            {
                Caption = 'Statistics';
                Image = Statistics;

                action(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F7';

                    trigger OnAction()
                    var
                        SalesSetup: Record 311;
                        ServLine: Record 5902;
                        ServLines: Page 5905;
                    begin
                        SalesSetup.GET;
                        IF SalesSetup."Calc. Inv. Discount" THEN BEGIN
                            ServLine.RESET;
                            ServLine.SETRANGE("Document Type", Rec."Document Type");
                            ServLine.SETRANGE("Document No.", Rec."No.");
                            IF ServLine.FINDFIRST THEN BEGIN
                                ServLines.SETTABLEVIEW(ServLine);
                                ServLines.CalcInvDisc(ServLine);
                                COMMIT
                            END;
                        END;
                        PAGE.RUNMODAL(PAGE::"Service Order Statistics", Rec);
                    end;
                }

            }
            group(Documents)
            {
                Caption = 'Documents';
                Image = Documents;
                action("S&hipments")
                {
                    Caption = 'S&hipments';
                    Image = Shipment;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 5974;
                    RunPageLink = "Order No." = FIELD("No.");
                    RunPageView = SORTING("Order No.");
                }
                action(Invoices)
                {
                    Caption = 'Invoices';
                    Image = Invoice;
                    RunObject = Page 5977;
                    RunPageLink = "Order No." = FIELD("No.");
                    RunPageView = SORTING("Order No.");
                }
            }

            /* group(History)
            {
                Caption = 'History';
                Image = History;
                action("Service Ledger E&ntries")
                {
                    Caption = 'Service Ledger E&ntries';
                    Image = ServiceLedger;
                    RunObject = Page 5912;
                                    RunPageLink = Service Order No.=FIELD(No.);
                    RunPageView = SORTING(Service Order No.,Service Item No. (Serviced),Entry Type,Moved from Prepaid Acc.,Posting Date,Open,Type);
                    ShortCutKey = 'Ctrl+F7';
                }
                action("&Warranty Ledger Entries")
                {
                    Caption = '&Warranty Ledger Entries';
                    Image = WarrantyLedger;
                    RunObject = Page 5913;
                                    RunPageLink = Service Order No.=FIELD(No.);
                    RunPageView = SORTING(Service Order No.,Posting Date,Document No.);
                }
                action("&Job Ledger Entries")
                {
                    Caption = '&Job Ledger Entries';
                    Image = JobLedger;
                    RunObject = Page 92;
                                    RunPageLink = Service Order No.=FIELD(No.);
                    RunPageView = SORTING(Service Order No.,Posting Date)
                                  WHERE(Entry Type=CONST(Usage));
                }
            } */
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Create Customer")
                {
                    Caption = '&Create Customer';
                    Image = NewCustomer;

                    trigger OnAction()
                    begin
                        CLEAR(ServOrderMgt);
                        ServOrderMgt.CreateNewCustomer(Rec);
                        CurrPage.UPDATE(TRUE);
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(TestReport)
                {
                    Caption = 'Test Report';
                    Ellipsis = true;
                    Image = TestReport;

                    trigger OnAction()
                    var
                        //ReportPrint: Codeunit 228;
                        ServTestReportPrint: Codeunit "Serv. Test Report Print";

                    begin
                        ServTestReportPrint.PrintServiceHeader(Rec);
                    end;
                }
                /* action(Post)
                {
                    Caption = 'P&ost';
                    Ellipsis = true;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction()
                    var
                        ServPostYesNo: Codeunit 5981;
                    begin
                        ServHeader.GET("Document Type",Rec."No.");
                        ServPostYesNo.PostDocument(ServHeader);
                    end;
                } */
                /* action("Post and &Print")
                {
                    Caption = 'Post and &Print';
                    Ellipsis = true;
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction()
                    var
                        ServPostPrint: Codeunit 5982;
                    begin
                        ServHeader.GET("Document Type",Rec."No.");
                        ServPostPrint.PostDocument(ServHeader);
                    end;
                } */
                action("Post &Batch")
                {
                    Caption = 'Post &Batch';
                    Ellipsis = true;
                    Image = PostBatch;

                    trigger OnAction()
                    begin
                        CLEAR(ServHeader);
                        ServHeader.SETRANGE(Status, ServHeader.Status::Finished);
                        REPORT.RUNMODAL(REPORT::"Batch Post Service Orders", TRUE, TRUE, ServHeader);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                /*  action("Parts Picking List")
                 {
                     Caption = 'Parts Picking List';
                     Image = "Report";

                     trigger OnAction()
                     var
                         ServiceHeader: Record 5900;
                         PickingList: Report 50097;
                     begin
                         ServHeader.SETRANGE(ServHeader."No.","No.");
                         ServHeader.FINDFIRST;
                         PickingList.SETTABLEVIEW(ServiceHeader);
                         PickingList.RUN;
                     end;
                 } */
            }
            action("&Print")
            {
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    DocPrint: Codeunit "Document-Print";
                    
                begin
                    CurrPage.UPDATE(TRUE);
#pragma warning disable AL0432
                    //DocPrint.PrintServiceHeader(Rec);
#pragma warning restore AL0432
                end;
            }
        }
    }

    /* trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SAVERECORD;
        CLEAR(ServLogMgt);
        ServLogMgt.ServHeaderManualDelete(Rec);
        EXIT(ConfirmDeletion);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "Document Type"::Order;
        "Responsibility Center" := UserMgt.GetServiceFilter;
    end;

    trigger OnOpenPage()
    begin
        IF UserMgt.GetServiceFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetServiceFilter);
          FILTERGROUP(0);
        END;
    end; */

    var
        ServHeader: Record 5900;
        ChangeExchangeRate: Page 511;
        ServOrderMgt: Codeunit 5900;
        ServLogMgt: Codeunit 5906;
        UserMgt: Codeunit 5700;

    local procedure CustomerNoOnAfterValidate()
    begin
        IF Rec.GETFILTER("Customer No.") = xRec."Customer No." THEN
            IF Rec."Customer No." <> xRec."Customer No." THEN
                Rec.SETRANGE("Customer No.");
        CurrPage.UPDATE;
    end;

    local procedure BilltoCustomerNoOnAfterValidat()
    begin
        CurrPage.UPDATE;
    end;

    local procedure MaxLaborUnitPriceOnAfterValida()
    begin
        CurrPage.SAVERECORD;
    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        CurrPage.UPDATE;
    end;

    local procedure ShiptoCodeOnAfterValidate()
    begin
        CurrPage.UPDATE;
    end;

    local procedure OrderTimeOnAfterValidate()
    begin
        Rec.UpdateResponseDateTime;
        CurrPage.UPDATE;
    end;

    local procedure OrderDateOnAfterValidate()
    begin
        Rec.UpdateResponseDateTime;
        CurrPage.UPDATE;
    end;

    local procedure FinishingTimeOnAfterValidate()
    begin
        CurrPage.UPDATE(TRUE);
    end;
}

