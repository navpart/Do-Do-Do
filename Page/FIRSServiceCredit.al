namespace AL_TNL.AL_TNL;

using Microsoft.Service.History;

page 50199 "FIRS Service Credit"
{
    ApplicationArea = All;
    Caption = 'FIRS Service Credit';
    PageType = List;
    SourceTable = "Service Cr.Memo Line";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("IRN"; Rec."IRN")
                {
                    ToolTip = 'Specifies the IRN.';
                }

                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the invoice number.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ToolTip = 'Specifies the value of the Item Category Code field.', Comment = '%';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the number of units of the item specified on the line.';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ToolTip = 'Specifies the net amount, including VAT, for this line.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the name of the item or general ledger account, or some descriptive text.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the price of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.';
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    ToolTip = 'Specifies the amount of any line discount for the line.';
                }
                field("Tax Category"; Rec."Tax Category")
                {
                    ToolTip = 'Specifies the tax category for the line.';
                }
                field("VAT %"; Rec."VAT %")
                {
                    ToolTip = 'Specifies the VAT %.';
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ToolTip = 'Specifies the name of the customer to whom the invoice is sold.';
                }
                field(TIN; Rec.TIN)
                {
                    ToolTip = 'Specifies the TIN.';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the Email.';
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ToolTip = 'Specifies the Postal Address.';
                }
                field("Street Name"; Rec."Street Name")
                {
                    ToolTip = 'Specifies the Street Name.';
                }
                field("City Name"; Rec."City Name")
                {
                    ToolTip = 'Specifies the City Name.';
                }
                field("Postal Zone"; Rec."Postal Zone")
                {
                    ToolTip = 'Specifies the Postal Zone.';
                }
                field("Original IRN"; Rec."Original IRN")
                {
                    ToolTip = 'Specifies the Original IRN.';
                }
                field("Original Document No."; Rec."Original Document No.")
                {
                    ToolTip = 'Specifies the Original Document No.';
                }
                field("Original Posting Date"; Rec."Original Posting Date")
                {
                    ToolTip = 'Specifies the Original Posting Date.';
                }

            }
        }
    }
}
