page 70500 "VAT Output Subform"
{
    AutoSplitKey = true;
    Caption = 'VAT Output Subform';
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Vat Input Template Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                }
                field("Chasis No."; Rec."Chasis No.")
                {

                    trigger OnValidate()
                    begin
                        Rec.SETFILTER("Document No.", VATOutputTemplate."No.");
                        IF VATOutputTemplate.GET(VATOutputTempLine."Document No.") THEN BEGIN
                            IF VATOutputTempLine.FIND('-') THEN
                                REPEAT
                                    Linecount := VATOutputTempLine.COUNT;
                                    VATOutputTempLine."Input VAT Amount" := (VATOutputTemplate."Sum VAT Amount" / (Linecount));

                                UNTIL VATOutputTempLine.NEXT = 0;

                        END;
                    end;
                }
                field("Input VAT Amount"; Rec."Input VAT Amount")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        VATOutputTempLine: Record "VAT Output Temp Line";
        "LineNo.": Integer;
        VATOutputTemplate: Record "VAT Output Template";
        Linecount: Decimal;
}

