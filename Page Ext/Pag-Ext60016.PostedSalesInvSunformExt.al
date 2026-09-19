namespace AL_TNL.AL_TNL;

using Microsoft.Sales.History;

pageextension 60016 "Posted Sales Inv. Sunform Ext" extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter("Shortcut Dimension 2 Code")
        {
            field("Posting Date"; Rec."Posting Date")
            {
                ApplicationArea = All;
                Visible = true;
            }
        }
    }

    actions
    {
        addlast(processing)
        {
            action(UpdateLineFromCustomer)
            {
                ApplicationArea = All;
                Caption = 'Update Line from Customer';
                ToolTip = 'Update this line with customer information (TIN, Email, Address, etc.)';
                Image = UpdateDescription;

                trigger OnAction()
                var
                    UpdateCust: Codeunit "Update Invoice Line Customer";
                    SalesInvLine: Record "Sales Invoice Line";
                begin
                    SalesInvLine := Rec;
                    UpdateCust.UpdateSalesInvoiceLineFromCustomer(SalesInvLine);
                    CurrPage.Update(false);
                end;
            }
        }
    }
}
