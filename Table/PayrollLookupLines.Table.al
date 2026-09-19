table 50003 "Payroll-Lookup Lines."
{

    fields
    {
        field(1; TableId; Code[20])
        {
            Editable = false;
            NotBlank = true;

            trigger OnValidate()
            begin
                TableId := xRec.TableId;
                EXIT;
            end;
        }
        field(2; "Lower Amount"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            MinValue = 0;

            trigger OnValidate()
            begin
                LookupHeader.GET(Rec.TableId);
                IF LookupHeader.Type = 1 THEN
                    "Lower Amount" := 0;
            end;
        }
        field(3; "Upper Amount"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            MinValue = 0;

            trigger OnValidate()
            begin
                LookupHeader.GET(Rec.TableId);
                IF LookupHeader.Type = 1 THEN
                    "Upper Amount" := 0;

                IF LookupHeader.Type = 2 THEN
                    VALIDATE("Tax Rate %");
            end;
        }
        field(4; "Lower Code"; Code[20])
        {

            trigger OnValidate()
            begin
                LookupHeader.GET(Rec.TableId);
                IF (LookupHeader.Type = 0) OR
                   (LookupHeader.Type = 2) THEN
                    "Lower Code" := '';
            end;
        }
        field(5; "Upper Code"; Code[20])
        {

            trigger OnValidate()
            begin
                LookupHeader.GET(Rec.TableId);
                IF (LookupHeader.Type = 0) OR
                   (LookupHeader.Type = 2) THEN
                    "Upper Code" := '';
            end;
        }
        field(8; "Extract Amount"; Decimal)
        {
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                LookupHeader.GET(Rec.TableId);
                IF (LookupHeader.Type = 2) THEN
                    "Extract Amount" := 0;
            end;
        }
        field(9; "Tax Rate %"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                LookupHeader.GET(Rec.TableId);
                IF (LookupHeader.Type = 0) OR (LookupHeader.Type = 1) THEN BEGIN
                    "Tax Rate %" := 0;
                    "Cum. Tax Payable" := 0
                END
                ELSE BEGIN
                    LookupLines.SETRANGE(TableId, TableId);
                    LookupLines.SETRANGE("Lower Code", '');
                    IF NOT LookupLines.FIND('-') THEN BEGIN
                        /* This is the first record being created for this tax table */
                        IF "Upper Amount" <> 0 THEN
                            "Cum. Tax Payable" := (1 / 100) * ("Tax Rate %" *
                                                  ("Upper Amount" - "Lower Amount"))
                    END
                    ELSE BEGIN

                        IF LookupLines."Lower Amount" = "Lower Amount" THEN
                            /* We are at the record being edited currently*/
                      LookupLines := Rec;

                        IF LookupLines."Upper Amount" <> 0 THEN
                            LookupLines."Cum. Tax Payable" := (1 / 100) *
                            (LookupLines."Tax Rate %" * (LookupLines."Upper Amount"
                                                         - LookupLines."Lower Amount"))
                        ELSE
                            LookupLines."Cum. Tax Payable" := 0;

                        IF LookupLines."Lower Amount" = "Lower Amount" THEN
                            /* We are at the record being edited currently*/
                      "Cum. Tax Payable" := LookupLines."Cum. Tax Payable"
                        ELSE
                            LookupLines.MODIFY;
                        PrevRec := LookupLines;

                        IF (LookupLines.NEXT <> 0) THEN
                            REPEAT

                                IF LookupLines."Lower Amount" = "Lower Amount" THEN
                                    /* We are at the record being edited currently*/
                        LookupLines := Rec;

                                IF LookupLines."Upper Amount" = 0 THEN
                                    LookupLines."Cum. Tax Payable" := 0
                                ELSE BEGIN
                                    LookupLines."Cum. Tax Payable" := (1 / 100) *
                                    (LookupLines."Tax Rate %" * (LookupLines."Upper Amount" -
                                                                 PrevRec."Upper Amount"));
                                    LookupLines."Cum. Tax Payable" := LookupLines."Cum. Tax Payable" +
                                                                       PrevRec."Cum. Tax Payable";
                                END;
                                IF LookupLines."Lower Amount" = "Lower Amount" THEN
                                    /* We are at the record being edited currently*/
                        "Cum. Tax Payable" := LookupLines."Cum. Tax Payable"
                                ELSE
                                    LookupLines.MODIFY;
                                PrevRec := LookupLines;
                            UNTIL (LookupLines.NEXT = 0)
                    END
                END

            end;
        }
        field(10; "Cum. Tax Payable"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50001; "Annual Lower"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50002; "Annual Upper"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
    }

    keys
    {
        key(Key1; TableId, "Lower Amount", "Lower Code")
        {
            Clustered = true;
        }
        key(Key2; TableId, "Annual Lower", "Lower Code")
        {
        }
    }

    fieldgroups
    {
    }

    var
        LookupHeader: Record 50002;
        LookupLines: Record 50003;
        PrevRec: Record 50003;

    procedure GetPayableTax(LookUpCode: Code[10]; MthAmountToTax: Decimal): Decimal
    var
        LkLines: Record 50003;
        TaxToPay: Decimal;
    begin
        LkLines.RESET;
        LkLines.SETRANGE(LkLines.TableId, LookUpCode);
        LkLines.SETFILTER(LkLines."Upper Amount", '<=%1', MthAmountToTax);
        IF LkLines.FIND('+') THEN BEGIN
            TaxToPay := LkLines."Cum. Tax Payable";
            IF LkLines."Upper Amount" = MthAmountToTax THEN
                EXIT(TaxToPay)
            ELSE BEGIN
                LkLines.RESET;
                LkLines.SETRANGE(LkLines.TableId, LookUpCode);
                LkLines.SETFILTER(LkLines."Upper Amount", '>%1', MthAmountToTax);
                LkLines.FIND('-');
                EXIT(TaxToPay + LkLines."Tax Rate %" * (MthAmountToTax - LkLines."Lower Amount") / 100);
            END;
        END
        ELSE
            EXIT(0);
    end;
}

