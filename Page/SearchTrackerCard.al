page 50051 "Search Tracker Card New"
{
    ApplicationArea = All;
    Caption = 'Search Tracker Card New';
    PageType = Card;
    SourceTable = "Search Tracker Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ToolTip = 'Specifies the value of the Request Date field.', Comment = '%';
                }
                field("Request by"; Rec."Request by")
                {
                    ToolTip = 'Specifies the value of the Request by field.', Comment = '%';
                }
                field("Request Customer Name"; Rec."Request Customer Name")
                {
                    ToolTip = 'Specifies the value of the Request Customer Name field.', Comment = '%';
                }
                field("Request Customer Address"; Rec."Request Customer Address")
                {
                    ToolTip = 'Specifies the value of the Request Customer Address field.', Comment = '%';
                }
                field("Order Type"; Rec."Order Type")
                {
                    ToolTip = 'Specifies the value of the Order Type field.', Comment = '%';
                }
                field("Online Order"; Rec."Online Order")
                {
                    ToolTip = 'Specifies the value of the Online Order field.', Comment = '%';
                }
                field("Document No."; Rec."Document No.")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
            }
            part(Lines; "Search Tracker Subform")
            {
                Caption = 'Lines';
                SubPageLink = "Document No." = field("No.");
            }
        }

    }

    actions
    {
        area(Navigation)
        {
            group(Documents)
            {
                Caption = '&Create Documents';
                Image = NewDocument;
                action(CreateQuote)
                {
                    Caption = 'Create Quote';
                    Image = CreateDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    Begin
                        Rec.CreateInvoice("Sales Document Type"::Quote);
                        MESSAGE(MsgQuote, Rec."Document No.");
                    End;
                }
                action(CreateOrder)
                {
                    Caption = 'Create Order';
                    Image = CreateFinanceChargememo;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    Begin
                        Rec.CreateInvoice("Sales Document Type"::Order);
                        MESSAGE(MsgOrder, Rec."Document No.");
                    End;
                }
                action(CreateInvoice)
                {
                    Caption = 'Create Invoice';
                    Image = DocumentEdit;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    Begin
                        Rec.CreateInvoice("Sales Document Type"::Invoice);
                        MESSAGE(MsgInvoice, Rec."Document No.");
                    End;
                }

            }

        }
    }
    var
        MsgQuote: Label 'Sales Quote %1 has been created.';
        MsgOrder: Label 'Sales Order %1 has been created.';
        MsgInvoice: Label 'Sales Invoice %1 has been created.';

}
