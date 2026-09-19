page 70090 "Labour and Operations List"
{
    Caption = 'Service List';
    CardPageID = "Labour and Operation Card";
    DataCaptionFields = "Document Type", "No.";
    Editable = false;
    PageType = List;
    SourceTable = "Service Header";
    SourceTableView = WHERE("Document Type" = FILTER(Order));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Status; Rec.Status)
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("No."; Rec."No.")
                {
                }
                field("Order Date"; Rec."Order Date")
                {
                }
                field("Order Time"; Rec."Order Time")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Response Date"; Rec."Response Date")
                {
                    Visible = "Response DateVisible";
                }
                field("Response Time"; Rec."Response Time")
                {
                    Visible = "Response TimeVisible";
                }
                field(Priority; Rec.Priority)
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        DimMgt.LookupDimValueCodeNoUpdate(1);
                    end;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        DimMgt.LookupDimValueCodeNoUpdate(2);
                    end;
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Links; Links)
            {
                Visible = false;
            }
            systempart(Notes; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action(Card)
                {
                    Caption = 'Card';
                    Image = EditLines;
                    ShortCutKey = 'Shift+F7';

                    trigger OnAction()
                    begin
                        CASE Rec."Document Type" OF
                            Rec."Document Type"::Quote:
                                PAGE.RUN(PAGE::"Service Quote", Rec);
                            Rec."Document Type"::Order:
                                PAGE.RUN(PAGE::"Service Order", Rec);
                            Rec."Document Type"::Invoice:
                                PAGE.RUN(PAGE::"Service Invoice", Rec);
                            Rec."Document Type"::"Credit Memo":
                                PAGE.RUN(PAGE::"Service Credit Memo", Rec);
                        END;
                    end;
                }
            }
        }
    }

    trigger OnInit()
    begin
        "Response TimeVisible" := TRUE;
        "Response DateVisible" := TRUE;
    end;

    trigger OnOpenPage()
    begin
        IF Rec."Document Type" = Rec."Document Type"::Order THEN BEGIN
            "Response DateVisible" := TRUE;
            "Response TimeVisible" := TRUE;
        END ELSE BEGIN
            "Response DateVisible" := FALSE;
            "Response TimeVisible" := FALSE;
        END;
    end;

    var
        DimMgt: Codeunit 408;

        "Response DateVisible": Boolean;

        "Response TimeVisible": Boolean;
}

