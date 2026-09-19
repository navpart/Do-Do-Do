xmlport 50151 "Change Model"
{
    Direction = Import;
    Format = VariableText;
    UseRequestPage = false;
    Permissions = tabledata "Item Ledger Entry" = rimd, tabledata "Value Entry" = rimd;

    schema
    {
        textelement(Root)
        {
            tableelement(Table2000000026; Integer)
            {
                AutoSave = false;
                XmlName = 'Integer';
                SourceTableView = SORTING(Number)
                                  WHERE(Number = CONST(1));
                textelement(serialno)
                {
                    XmlName = 'Serial';
                }
                textelement(Description)
                {
                }
                textelement(ItemNo)
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    ItemLedgerEntry.SETRANGE("Serial No.", SerialNo);
                    IF ItemLedgerEntry.FINDFIRST THEN BEGIN
                        REPEAT
                            ItemLedgerEntry."Item No." := ItemNo;
                            ItemLedgerEntry.Description := Description;
                            ItemLedgerEntry.Modify();

                            ValueEntry.SetRange("Item Ledger Entry No.", ItemLedgerEntry."Entry No.");
                            if ValueEntry.FindFirst() then begin
                                ValueEntry."Item No." := ItemNo;
                                ValueEntry.Description := Description;
                                ValueEntry.Modify();
                            end;

                        UNTIL ItemLedgerEntry.NEXT = 0;
                    END;

                    MESSAGE(Text001)
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    trigger OnPostXmlPort()
    begin

    end;

    var
        ItemLedgerEntry: Record 32;
        ValueEntry: Record "Value Entry";
        PurchRecptLine: Record 121;
        Counter: Integer;
        Text001: Label 'Records were successfully modified.';
}

