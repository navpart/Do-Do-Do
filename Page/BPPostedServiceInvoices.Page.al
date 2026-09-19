page 80066 "B&P Posted Service Invoices"
{
    Caption = 'Posted Service Invoices';
    CardPageID = "Posted Service Invoice";
    Editable = false;
    PageType = List;
    SourceTable = "Service Invoice Header";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
                field("Post Code"; Rec."Post Code")
                {
                    Visible = false;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    Visible = false;
                }
                field("Contact Name"; Rec."Contact Name")
                {
                    Visible = false;
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    Visible = false;
                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                    Visible = false;
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    Visible = false;
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    Visible = false;
                }
                field("Ship-to Country/Region Code"; Rec."Ship-to Country/Region Code")
                {
                    Visible = false;
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    Visible = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Visible = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    Visible = true;
                }
                field("Document Date"; Rec."Document Date")
                {
                    Visible = false;
                }
                field("Due Date"; Rec."Due Date")
                {
                    Visible = false;
                }
                field("Order No."; Rec."Order No.")
                {
                }
                field("Customer Order No."; Rec."Customer Order No.")
                {
                }
                field("Registration No."; Rec."Registration No.")
                {
                }
                field("Total Line Amount"; Rec."Total Line Amount")
                {
                }
                field("Total Line Amount Incl. (VAT)"; Rec."Total Line Amount Incl. (VAT)")
                {
                }
                field("Total Discount Amount"; Rec."Total Discount Amount")
                {
                }
                field("Total B&P"; Rec."Total B&P")
                {
                    Caption = '<Total Labour>';
                }

                field("Received Date"; Rec."Received Date")
                {
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Vehicle Classification"; Rec."Vehicle Classification")
                {
                }
                field(Brand; Rec.Brand)
                {
                }
                field("Customer Type"; Rec."Customer Type")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Invoice")
            {
                Caption = '&Invoice';
                Image = Invoice;
                action(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Service Invoice Statistics";
                    RunPageLink = "No." = FIELD("No.");
                    ShortCutKey = 'F7';
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Service Comment Sheet";
                    RunPageLink = "Table Name" = CONST("Service Invoice Header"),
                                  "No." = FIELD("No."),
                                  Type = CONST(General);
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData 348 = R;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDimensions;
                        CurrPage.SAVERECORD;
                    end;
                }
            }
        }
        area(processing)
        {
            action("&Print")
            {
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    CurrPage.SETSELECTIONFILTER(ServiceInvHeader);
                    ServiceInvHeader.PrintRecords(TRUE);
                end;
            }
            action("&Navigate")
            {
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.Navigate;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetSecurityFilterOnRespCenter;
    end;

    var
        ServiceInvHeader: Record 5992;
}

