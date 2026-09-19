page 50347 "Pending Purchase Requests"
{
    Caption = 'Req. Wksh. Names';
    DataCaptionExpression = DataCaption;
    PageType = List;
    SourceTable = "Requisition Wksh. Name";
    SourceTableView = WHERE("Worksheet Template Name" = CONST('REQ.'),
                            "Request Type" = CONST(Parts));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name; Rec.Name)
                {
                }
                field("COF No."; Rec."COF No.")
                {
                }
                field("Veh. Reg. No."; Rec."Veh. Reg. No.")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field(Description; Rec.Description)
                {
                }
                // field("No. Of Lines"; Rec."No. Of Lines")
                // {
                // }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Edit Worksheet")
            {
                Caption = 'Edit Worksheet';
                Image = OpenWorksheet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ShortCutKey = 'Return';

                trigger OnAction()
                begin
                    ReqJnlManagement.TemplateSelectionFromBatch(Rec);
                end;
            }
        }
    }

    trigger OnInit()
    begin
        Rec.SETRANGE("Worksheet Template Name");
    end;

    var
        ReqJnlManagement: Codeunit 330;

    local procedure DataCaption(): Text[250]
    var
        ReqWkshTmpl: Record 244;
    begin
        IF NOT CurrPage.LOOKUPMODE THEN
            IF Rec.GETFILTER("Worksheet Template Name") <> '' THEN
                IF Rec.GETRANGEMIN("Worksheet Template Name") = Rec.GETRANGEMAX("Worksheet Template Name") THEN
                    IF ReqWkshTmpl.GET(Rec.GETRANGEMIN("Worksheet Template Name")) THEN
                        EXIT(ReqWkshTmpl.Name + ' ' + ReqWkshTmpl.Description);
    end;
}

