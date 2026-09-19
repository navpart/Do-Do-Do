page 70529 "Sales Shipment Audit"
{
    SourceTable = "Sales Shipment Header";
    ApplicationArea = All;
    PageType = Document;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the record.';
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer';
                    Editable = false;
                    ToolTip = 'Specifies the name of customer at the sell-to address.';
                }
                group("Sell-to")
                {
                    Caption = 'Sell-to';
                    field("Sell-to Address"; Rec."Sell-to Address")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Address';
                        Editable = false;
                        Importance = Additional;
                        ToolTip = 'Specifies the customer''s sell-to address.';
                    }
                    field("Sell-to Address 2"; Rec."Sell-to Address 2")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Address 2';
                        Editable = false;
                        Importance = Additional;
                        ToolTip = 'Specifies the customer''s extended sell-to address.';
                    }
                    field("Sell-to City"; Rec."Sell-to City")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'City';
                        Editable = false;
                        Importance = Additional;
                        ToolTip = 'Specifies the city of the customer on the sales document.';
                    }
                    group(Ctr1)
                    {
                        field("Sell-to County"; Rec."Sell-to County")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'County';
                            Editable = false;
                            Importance = Additional;
                            ToolTip = 'Specifies the state, province or county as a part of the address.';
                        }
                    }
                    field("Sell-to Post Code"; Rec."Sell-to Post Code")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Post Code';
                        Editable = false;
                        Importance = Additional;
                        ToolTip = 'Specifies the post code of the customer''s sell-to address.';
                    }
                    field("Sell-to Country/Region Code"; Rec."Sell-to Country/Region Code")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Country/Region';
                        Editable = false;
                        Importance = Additional;
                        ToolTip = 'Specifies the country/region of the customer on the sales document.';
                    }
                    field("Sell-to Contact No."; Rec."Sell-to Contact No.")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Contact No.';
                        Editable = false;
                        Importance = Additional;
                        ToolTip = 'Specifies the contact number.';
                    }
                }
                field("Sell-to Contact"; Rec."Sell-to Contact")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Contact';
                    Editable = false;
                    ToolTip = 'Specifies the name of the contact at the customer''s sell-to address.';
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies how many times the document has been printed.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the posting date for the entry.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies the posting date of the document.';
                }
                field("Requested Delivery Date"; Rec."Requested Delivery Date")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the date that the customer has asked for the order to be delivered.';
                }
                field("Promised Delivery Date"; Rec."Promised Delivery Date")
                {
                    ApplicationArea = OrderPromising;
                    Editable = false;
                    ToolTip = 'Specifies the date that you have promised to deliver the order, as a result of the Order Promising function.';
                }
                field("Quote No."; Rec."Quote No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the number of the sales quote document if a quote was used to start the sales process.';
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the sales order that this invoice was posted from.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies the number that the customer uses in their own system to refer to this sales document.';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = Suite;
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies a code for the salesperson who normally handles this customer''s account.';
                }
                field("Your Reference"; Rec."Your Reference")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Suite;
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies the code for the responsibility center that serves the customer on this sales document.';
                }
                group("Work Description")
                {
                    Caption = 'Work Description';
                    field(GetWorkDescription; Rec.GetWorkDescription)
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = false;
                        Importance = Additional;
                        MultiLine = true;
                        ShowCaption = false;
                        ToolTip = 'Specifies the products or services being offered.';
                    }
                }
            }
            part(SalesShipmLines; 131)
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "Document No." = FIELD("No.");
            }
            part("Custom Documents"; 70523)
            {
                Caption = 'Custom Documents';
                Editable = false;
                SubPageLink = "Sales Order" = FIELD("Order No.");
            }
            group("Doc Link")
            {
                field("Acknowledged Doc Link"; Rec."Acknowledged Doc Link")
                {
                    Editable = true;
                }
            }
            group("Auditors Record")
            {
                field("Audit Summary"; Rec."Audit Summary")
                {
                    Editable = true;
                }
                field("Audit Confirmation by"; Rec."Audit Confirmation by")
                {
                    Editable = false;
                }
                field("Audit Confirmation Date"; Rec."Audit Confirmation Date")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(UpdateDocument)
            {
                ApplicationArea = Suite;
                Caption = 'Update Document';
                Image = Edit;
                Promoted = true;
                ToolTip = 'Add new information that is relevant to the document, such as information from the shipping agent. You can only edit a few fields because the document has already been posted.';

                trigger OnAction()
                var
                    PostedSalesShipmentUpdate: Page "Posted Sales Shipment - Update";
                begin
                    PostedSalesShipmentUpdate.LookupMode := true;
                    PostedSalesShipmentUpdate.SetRec(Rec);
                    PostedSalesShipmentUpdate.RunModal();
                end;
            }


        }
    }
}

