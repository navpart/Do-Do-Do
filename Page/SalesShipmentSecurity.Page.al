page 70528 "Sales Shipment Security"
{
    SourceTable = "Sales Shipment Header";
    ApplicationArea = All;
    PageType = Document;
    Editable = true;

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

                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the record.';
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {

                    Caption = 'Customer';
                    Editable = false;
                    ToolTip = 'Specifies the name of customer at the sell-to address.';
                }
                group("Sell-to")
                {
                    Caption = 'Sell-to';
                    field("Sell-to Address"; Rec."Sell-to Address")
                    {

                        Caption = 'Address';
                        Editable = false;
                        Importance = Additional;
                        ToolTip = 'Specifies the customer''s sell-to address.';
                    }
                    field("Sell-to Address 2"; Rec."Sell-to Address 2")
                    {

                        Caption = 'Address 2';
                        Editable = false;
                        Importance = Additional;
                        ToolTip = 'Specifies the customer''s extended sell-to address.';
                    }
                    field("Sell-to City"; Rec."Sell-to City")
                    {

                        Caption = 'City';
                        Editable = false;
                        Importance = Additional;
                        ToolTip = 'Specifies the city of the customer on the sales document.';
                    }
                    group(Ctr1)
                    {
                        field("Sell-to County"; Rec."Sell-to County")
                        {

                            Caption = 'County';
                            Editable = false;
                            Importance = Additional;
                            ToolTip = 'Specifies the state, province or county as a part of the address.';
                        }
                    }
                    field("Sell-to Post Code"; Rec."Sell-to Post Code")
                    {

                        Caption = 'Post Code';
                        Editable = false;
                        Importance = Additional;
                        ToolTip = 'Specifies the post code of the customer''s sell-to address.';
                    }
                    field("Sell-to Country/Region Code"; Rec."Sell-to Country/Region Code")
                    {

                        Caption = 'Country/Region';
                        Editable = false;
                        Importance = Additional;
                        ToolTip = 'Specifies the country/region of the customer on the sales document.';
                    }
                    field("Sell-to Contact No."; Rec."Sell-to Contact No.")
                    {

                        Caption = 'Contact No.';
                        Editable = false;
                        Importance = Additional;
                        ToolTip = 'Specifies the contact number.';
                    }
                }
                field("Sell-to Contact"; Rec."Sell-to Contact")
                {

                    Caption = 'Contact';
                    Editable = false;
                    ToolTip = 'Specifies the name of the contact at the customer''s sell-to address.';
                }
                field("No. Printed"; Rec."No. Printed")
                {

                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies how many times the document has been printed.';
                }
                field("Posting Date"; Rec."Posting Date")
                {

                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the posting date for the entry.';
                }
                field("Document Date"; Rec."Document Date")
                {

                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies the posting date of the document.';
                }
                field("Requested Delivery Date"; Rec."Requested Delivery Date")
                {

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

                    Editable = false;
                    ToolTip = 'Specifies the number of the sales quote document if a quote was used to start the sales process.';
                }
                field("Order No."; Rec."Order No.")
                {

                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the sales order that this invoice was posted from.';
                }
                field("External Document No."; Rec."External Document No.")
                {

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
                        Editable = false;
                        Importance = Additional;
                        MultiLine = true;
                        ShowCaption = false;
                        ToolTip = 'Specifies the products or services being offered.';
                    }
                }
            }
            part(SalesShipmLines; 50068)
            {

                SubPageLink = "Document No." = FIELD("No.");
            }
            part("Custom Documents"; 70523)
            {
                Caption = 'Custom Documents';
                Editable = true;
                SubPageLink = "Sales Order" = FIELD("Order No.");
            }
            group("Doc Link")
            {
                Caption = 'Document Link';
                Editable = true;

                field("Acknowledged Doc Link"; AcknowledgedDocLink)
                {
                    ApplicationArea = All;
                    Editable = true;
                    ShowMandatory = false;
                    Caption = 'Acknowledged Doc Link';
                    ToolTip = 'Specifies the document link for acknowledgment.';

                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print Confirmation")
            {
                Caption = 'Print Confirmation';
                Ellipsis = true;
                Image = Print;

                trigger OnAction()
                begin
                    //DocPrint.PrintSalesOrder(Rec,Usage::"Order Confirmation");
                end;
            }
        }

    }

    trigger OnOpenPage()
    begin
        xSalesShipmentHeader := Rec;
    end;

    trigger OnAfterGetRecord()
    begin
        // Allow modification of the record
        CurrPage.Editable := true;
        // Initialize the variable with current field value
        AcknowledgedDocLink := Rec."Acknowledged Doc Link";
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction in [ACTION::OK, ACTION::LookupOK] then
            if NewRecordChanged() then begin
                // Set the field value in the record before calling the edit codeunit
                Rec."Acknowledged Doc Link" := AcknowledgedDocLink;
                CODEUNIT.Run(CODEUNIT::"Shipment Header - Edit", Rec);
            end;
    end;

    var
        DocPrint: Codeunit 229;
        xSalesShipmentHeader: Record "Sales Shipment Header";
        AcknowledgedDocLink: Text[250];

    local procedure NewRecordChanged() IsChanged: Boolean
    begin
        IsChanged := (AcknowledgedDocLink <> xSalesShipmentHeader."Acknowledged Doc Link");
    end;

}

