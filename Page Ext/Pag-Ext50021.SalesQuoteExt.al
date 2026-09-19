pageextension 50021 "Sales Quote Ext" extends "Sales Quote"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Customer Preferred Name"; Rec."Customer Preferred Name")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(Print)
        {
            action(PrintTNLSalesQuote)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Quote - Toyota';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';
                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                    TNLSalesQuote: Report "TNL Sales Quotation";

                begin
                    SalesHeader.SetRange("No.", Rec."No.");
                    if SalesHeader.FindFirst() then begin
                        TNLSalesQuote.SetTableView(SalesHeader);
                        TNLSalesQuote.UseRequestPage();
                        TNLSalesQuote.RunModal();
                    end

                end;
            }

            action(PrintJetourSalesQuote)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Quote - Jetour';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';
                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                    JetSalesQuote: Report "Jetour Sales Quote";

                begin
                    SalesHeader.SetRange("No.", Rec."No.");
                    if SalesHeader.FindFirst() then begin
                        JetSalesQuote.SetTableView(SalesHeader);
                        JetSalesQuote.UseRequestPage();
                        JetSalesQuote.RunModal();
                    end

                end;
            }
            action(PrintTCSC)
            {
                ApplicationArea = Basic, Suite;
                Caption = '&TCSC Sales Quote';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';
                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                    TCSCQuote: Report "TCSC Sales - Quote";

                begin
                    SalesHeader.SetRange("No.", Rec."No.");
                    if SalesHeader.FindFirst() then begin
                        TCSCQuote.SetTableView(SalesHeader);
                        TCSCQuote.UseRequestPage();
                        TCSCQuote.RunModal();
                    end

                end;
            }
        }
    }
}
