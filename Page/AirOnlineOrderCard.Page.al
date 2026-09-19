page 70209 "Air Online Order Card"
{
    SourceTable = "Air Online Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Supplier Details")
            {
                Editable = SendEdit;
                field("Suppliers No."; Rec."Suppliers No.")
                {
                }
                field("Supplier's Name"; Rec."Supplier's Name")
                {
                }
                field("Supplier's Address"; Rec."Supplier's Address")
                {
                }
                field("Profoma Invoice No:"; Rec."Profoma Invoice No:")
                {
                }
                field("Total Invoice Value"; Rec."Total Invoice Value")
                {
                    Editable = false;
                }
                field("Port of Loading"; Rec."Port of Loading")
                {
                }
                field("Port Of Discharge/Dest."; Rec."Port Of Discharge/Dest.")
                {
                }
                field("Agreed Payment Term"; Rec."Agreed Payment Term")
                {
                }
                field("Air Order Type"; Rec."Air Order Type")
                {
                }
                field("Purchase Order Issued"; Rec."Purchase Order Issued")
                {
                    Editable = false;
                }
            }
            group(Requester)
            {
                Editable = SendEdit;
                field(Name; Rec."Requester Name")
                {
                }
                field(Department; Rec."Requester Department")
                {
                }
                field(Date; Rec.DateTime)
                {
                }
                field("Send To"; Rec."Send To")
                {
                }
                field(Send; Rec.Send)
                {
                }
            }
            part(Lines; 71208)
            {
                Caption = 'Lines';
                SubPageLink = "Document No." = FIELD("No.");
            }
            group(Authorization)
            {
                grid(Control6)
                {
                    group(Control7)
                    {
                        ShowCaption = false;
                        field("Head of Department"; Rec."Head of Department")
                        {
                        }
                        field("Name HOD"; Rec."Name HOD")
                        {
                        }
                        field(TimeDate2; Rec.TimeDate2)
                        {
                            Caption = 'Date/Time';
                        }
                    }
                    group(Control1)
                    {
                        ShowCaption = false;
                        field("Compliance check"; Rec."Compliance check")
                        {
                        }
                        field("Confirmed By"; Rec."Confirmed By")
                        {
                        }
                        field(TimeDate3; Rec.TimeDate3)
                        {
                            Caption = 'Date/Time';
                        }
                    }
                    group(Control2)
                    {
                        ShowCaption = false;
                        field("Head of Audit"; Rec."Head of Audit")
                        {
                        }
                        field("Name Head of Audit"; Rec."Name Head of Audit")
                        {
                        }
                        field(TimeDate4; Rec.TimeDate4)
                        {
                            Caption = 'Date/Time';
                        }
                    }
                }
            }
            group(Approval)
            {
                group(Control3)
                {
                    Visible = GMVisible;
                    field("General Manager"; Rec."General Manager")
                    {
                    }
                    field("Name GM"; Rec."Name GM")
                    {
                    }
                    field(TimeDate6; Rec.TimeDate6)
                    {
                        Caption = 'Date/Time';
                    }
                }
                group(Control4)
                {
                    Visible = MDVisible;
                    field("Managing Director"; Rec."Managing Director")
                    {
                    }
                    field("Name MD"; Rec."Name MD")
                    {
                    }
                    field(TimeDate5; Rec.TimeDate5)
                    {
                        Caption = 'Date/Time';
                    }
                }
            }
        }
        area(factboxes)
        {
            systempart(Links; Links)
            {
                Visible = true;
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
            action("Generate Form M")
            {
                Caption = 'Generate Form M';
                Image = Form;

                trigger OnAction()
                begin

                    Rec."Generated FM" := TRUE;
                    MESSAGE('Form M has been processed!');
                end;
            }
            action("Create Purch. Order")
            {
                Caption = 'Create Purch. Order';
                Image = CreateDocument;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    //TESTFIELD(HoDAuditApproval,TRUE);
                    AirOnlineHeader.GET(Rec."No.");
                    IF Rec."Purchase Order Issued" THEN
                        ERROR('Purchase Order has been created already');

                    PurchaseHeader.INIT;
                    PurchaseHeader.VALIDATE("Document Type", PurchaseHeader."Document Type"::Order);
                    PurchaseHeader.VALIDATE("Buy-from Vendor No.", Rec."Suppliers No.");
                    PurchaseHeader.VALIDATE("External Document No.", AirOnlineHeader."No.");


                    PurchaseHeader.INSERT;

                    PurchaseHeader.MODIFY;


                    AirOnlineOrderLine.SETRANGE("Document No.", AirOnlineHeader."No.");
                    PurchaseLine2.SETRANGE("Document No.", PurchaseHeader."No.");                //This alone returned all line items on the Air online order
                    IF AirOnlineOrderLine.FINDFIRST THEN BEGIN
                        REPEAT
                            PurchaseLine2.INIT;
                            PurchaseLine2."Document Type" := PurchaseLine."Document Type"::Order;
                            PurchaseLine2."Document No." := PurchaseHeader."No.";
                            PurchaseLine2.Type := PurchaseLine.Type::Item;
                            PurchaseLine2."Line No." += 1000;
                            PurchaseLine2."No." := AirOnlineOrderLine."Item No";
                            PurchaseLine2.Description := AirOnlineOrderLine."Item Name";
                            PurchaseLine2.Quantity := AirOnlineOrderLine.Quantity;
                            PurchaseLine2.INSERT;
                        //      PurchaseLine.MODIFY;
                        UNTIL AirOnlineOrderLine.NEXT = 0;
                    END;

                    IF CONFIRM('Purchase order has been created, do you want to view?', TRUE) THEN BEGIN
                        Rec."Purchase Order Issued" := TRUE;
                        PurchaseHeader.SETRANGE("No.", PurchaseLine."Document No.");
                        PAGE.RUN(PAGE::"Purchase Order", PurchaseHeader, PurchaseHeader."No.");
                        Rec.MODIFY;
                    END;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        IF Rec."No." <> '' THEN BEGIN
            Rec.CALCFIELDS("Total Invoice Value");
            VendAmt := Rec."Total Invoice Value";

            IF (VendAmt <= 1500) THEN
                GMVisible := TRUE
            ELSE
                GMVisible := FALSE;
            Rec.MODIFY;

            IF (VendAmt > 1500) THEN
                MDVisible := TRUE
            ELSE
                MDVisible := FALSE;
            Rec.MODIFY;

        END;
        // ERROR('STOP');

        IF Rec.Send = TRUE THEN
            SendEdit := FALSE ELSE
            SendEdit := TRUE;

        IF Rec."Head of Department" = Rec."Head of Department"::Approved THEN
            HeadEdit := FALSE ELSE
            HeadEdit := TRUE;


        IF Rec."Compliance check" = Rec."Compliance check"::Satisfactory THEN
            CompliancEdit := FALSE ELSE
            CompliancEdit := TRUE;

        IF Rec."Head of Audit" = Rec."Head of Audit"::Approved THEN
            HODAuditEdit := FALSE ELSE
            HODAuditEdit := TRUE;

        IF Rec."General Manager" = Rec."General Manager"::Approved THEN
            GMEdit := FALSE ELSE
            GMEdit := TRUE;

        IF Rec."Managing Director" = Rec."Managing Director"::Approved THEN
            MDEdit := FALSE ELSE
            MDEdit := TRUE;
    end;

    var
        GMVisible: Boolean;
        MDVisible: Boolean;
        VendAmt: Decimal;
        SendEdit: Boolean;
        HeadEdit: Boolean;
        CompliancEdit: Boolean;
        HODAuditEdit: Boolean;
        GMEdit: Boolean;
        MDEdit: Boolean;
        PurchaseHeader: Record 38;
        PurchaseLine: Record 39;
        PurchaseLine2: Record 39;
        AirOnlineHeader: Record 70022;
        AirOnlineOrderLine: Record 70023;
}

